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
import com.kh.BucketStory.member.model.vo.MemberMyBucketList;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("writer.me")
	public String writer() {
		return "writer";
	}
	
	
	@RequestMapping("test.me")
	public String test(@RequestParam("ir1") String ir1, Model model) {
		System.out.println(ir1);
		ir1 = ir1.replaceAll(System.getProperty("line.separator"), " ");
		model.addAttribute("ir1", ir1);
		return "test";
	}
	
	@RequestMapping("update.me")
	public String update(@RequestParam("ir1") String ir1, Model model) {
		System.out.println(ir1);
		model.addAttribute("ir1", ir1);
		return "update";
	}
	
	// 메인에서 마이페이지로 들어왔을 경우
	@RequestMapping("myBucket.me")
	public String MyPageBucket(HttpSession session, Model m) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		ArrayList<MemberMyBucketList> myBucketList = mService.myBucketList(loginUser.getUserId());
		
		for(MemberMyBucketList mm : myBucketList) {
			System.out.println(mm);
		}
		if(myBucketList != null) {
			m.addAttribute("myBucketList", myBucketList);
			return "MyPageBucket";
		} else {			
			return "MyPageBucket";
		}
	}
	
	
	@RequestMapping("bucketWrite.me")
	public String BucketWrite() {
		return "bucketWrite";
	}
	
	@RequestMapping("myBlog.me")
	public String BucketBlog(HttpSession session, Model m) {
		Member loginUser = (Member) session.getAttribute("loginUser");
		ArrayList<MemberMyBucketList> myBucketList = mService.myBucketList(loginUser.getUserId());
		
		for(MemberMyBucketList mm : myBucketList) {
			System.out.println(mm);
		}
		if(myBucketList != null) {
			m.addAttribute("myBucketList", myBucketList);
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
