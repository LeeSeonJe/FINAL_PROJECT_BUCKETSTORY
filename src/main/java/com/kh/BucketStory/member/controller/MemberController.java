package com.kh.BucketStory.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.member.model.service.MemberService;
import com.kh.BucketStory.member.model.vo.Board;
import com.kh.BucketStory.member.model.vo.MemberMyBucketList;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	// 버킷리스트를 하는 과정
	@RequestMapping("blogWrite.me")
	public String writer(@RequestParam String bkNo, Model m) {
		m.addAttribute("bkNo", bkNo);
		return "blogWriter";
	}
	
	
	@RequestMapping("BlogInsert.me")
	public String test(HttpSession session, @RequestParam String bContent, @RequestParam int bkNo, @RequestParam String bTitle, Model model) {
		bContent = bContent.replaceAll(System.getProperty("line.separator"), " ");
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userid = loginUser.getUserId();
		
		
		Board board = new Board(bTitle, bContent, userid, bkNo);
		int result = mService.blogInsert(board);
		
		if(result > 0) {
			return "redirect:myBlog.me?bkNo" + board.getBkNo();	
		} else {
			return "redirect:myBlog.me?bkNo" + board.getBkNo();	
		}
	}
	
	@RequestMapping("update.me")
	public String update(@RequestParam("blogContent") String blogContent, Model model) {
		System.out.println(blogContent);
		model.addAttribute("blogContent", blogContent);
		return "update";
	}
	
	// 메인에서 마이페이지로 들어왔을 경우
	@RequestMapping("myBucket.me")
	public String MyPageBucket(HttpSession session, Model m) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		ArrayList<MemberMyBucketList> myBucketList = mService.myBucketList(loginUser.getUserId());
		
		if(myBucketList != null) {
			m.addAttribute("myBucketList", myBucketList);
			return "myPageBucket";
		} else {			
			return "myPageBucket";
		}
	}
	
	
	// 버킷리스트를 추가
	@RequestMapping("bucketWrite.me")
	public String BucketWrite() {
		return "bucketWrite";
	}
	
	@RequestMapping("myBlog.me")
	public String BucketBlog(HttpSession session, Model m, @RequestParam(value = "bkNo", required = false) String bkNo) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		ArrayList<MemberMyBucketList> myBucketList = mService.myBucketList(loginUser.getUserId());
		int bn = 0;
		int index = 0;
		if(bkNo == null) {
			bkNo = myBucketList.get(0).getBkNo() + "";
			bn = Integer.parseInt(bkNo);
			index = 0;
		} else {
			bn = Integer.parseInt(bkNo);
			for(int i = 0; i < myBucketList.size(); i++) {
				if(myBucketList.get(i).getBkNo() == bn) {
					index = i;
					break;
				}
			}
		}
		if(myBucketList != null) {
			m.addAttribute("myBucketList", myBucketList).addAttribute("index", index);
			return "bucketBlog";
		} else {			
			return "bucketBlog";
		}
	}
	
	@RequestMapping("bInsert.me")
	public String BucketInsert(@ModelAttribute BucketList BL, @RequestParam("uploadFile") MultipartFile uploadFile,
								@RequestParam("tags") List<String> tags, HttpServletRequest request,
								HttpSession session) {
		
		Media m = new Media();
		String tag = String.join(",", tags);
		BL.setTag(tag);
		BL.setUserId(((Member)session.getAttribute("loginUser")).getUserId());
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String mweb = saveFile(uploadFile, request);
			
			if(mweb != null) {
				m.setMorigin(uploadFile.getOriginalFilename());
				m.setMweb(mweb);
			}
		}
		
		int result = mService.bucketInsert(m, BL);
		
		if(result > 0) {
			return "redirect:myBucket.me";
		} else {
			return "bucketWrite";
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\muploadFiles";
		
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file .getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								+"."
								+ originFileName.substring(originFileName.lastIndexOf(".") + 1);
		String renamePath = folder + "//" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	
}
