package com.kh.BucketStory.member.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.BucketStory.admin.model.vo.Notify;
import com.kh.BucketStory.admin.model.vo.PageInfo;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.bucket.model.vo.ShareBucket;
import com.kh.BucketStory.bucket.model.vo.WishList;
import com.kh.BucketStory.common.Pagination;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.main.model.service.MainService;
import com.kh.BucketStory.member.model.service.MemberService;
import com.kh.BucketStory.member.model.vo.BLike;
import com.kh.BucketStory.member.model.vo.Board;
import com.kh.BucketStory.member.model.vo.BoardComment;
import com.kh.BucketStory.member.model.vo.Follow;
import com.kh.BucketStory.member.model.vo.MemberMyBucketList;
import com.kh.BucketStory.member.model.vo.Reply;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	@Autowired MainService mainService;

	// 위시리스트 이동 페이지
	@RequestMapping("myWish.me")
	public String myWish(@RequestParam String nickName, Model m, HttpSession session) {
		session.setAttribute("nickName", nickName);
		int followCheck = 2;
		Member loginUser = null;
		String userId = null;
		if(session.getAttribute("loginUser") != null) {
			loginUser = (Member) session.getAttribute("loginUser");		
			followCheck = mService.followCheck(nickName, loginUser.getUserId());
			userId = loginUser.getUserId();
		} 
		
		ArrayList<Board> blogList = mainService.selectBlogList();
		ArrayList<WishList> wishList = new ArrayList<WishList>();
		ArrayList<ShareBucket> shareList = new ArrayList<ShareBucket>();
		if(userId != null) {
			wishList = mainService.selectWishList(userId);
			shareList = mainService.selectShareList(userId);
		}
		Member getMember = mService.getMember(nickName);
		session.setAttribute("getMember", getMember);
		ArrayList<WishList> memberWishList = mService.getWishList(nickName);
		if(wishList != null) {
			m.addAttribute("memberWishList", memberWishList).addAttribute("followCheck", followCheck)
			.addAttribute("wishList", wishList).addAttribute("shareList", shareList)
			.addAttribute("getMember", getMember).addAttribute("blogList", blogList);
			return "myPageWishList";
 		} else {
 			return "myPageWishList";
 		}
	}
	
	// 블로그에서 버킷에 글 등록 페이지 이동
	@RequestMapping("blogWrite.me")
	public String writer(@RequestParam String bkNo, @RequestParam Integer page, Model m) {
		m.addAttribute("bkNo", bkNo).addAttribute("page", page);
		return "blogWriter";
	}

	// 블로그에서 버킷에 글 등록할 때
	@RequestMapping("BlogInsert.me")
	public String BlogInsert(HttpSession session, @RequestParam String bContent, @RequestParam int bkNo,
			@RequestParam String bTitle, @RequestParam Integer page, Model model) throws UnsupportedEncodingException {
		
		bContent = bContent.replaceAll(System.getProperty("line.separator"), " ");
		Member loginUser = (Member) session.getAttribute("loginUser");
		String nickName = (String) session.getAttribute("nickName");
		String userid = loginUser.getUserId();
		
		int checked = mService.dateUpdate(userid, bkNo);
		
		
		Board board = new Board(bTitle, bContent, userid, bkNo);
		int result = mService.blogInsert(board);

		if (result > 0 && checked > 0) {
			return "redirect:myBlog.me?nickName=" + URLEncoder.encode(nickName, "UTF-8") + "&bkNo=" + board.getBkNo()
					+ "&page=" + page;
		} else {
			return "redirect:myBlog.me?bkNo=" + board.getBkNo() + "&page=" + page;
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
	public String MyPageBucket(HttpSession session, Model m, @RequestParam String nickName) {
		Member loginUser = null;
		int followCheck = 2;
		String userId = null;
		Member getMember = new Member();
		if(session.getAttribute("loginUser") != null) {
			loginUser = (Member) session.getAttribute("loginUser");
			userId = loginUser.getUserId();
			getMember = mService.getMember(nickName);
		} 
		getMember = mService.getMember(nickName);
		
		ArrayList<Follow> followingList = mService.getFollowingList(nickName);
		ArrayList<Follow> followerList = mService.getFollowerList(nickName);
		session.setAttribute("followingList", followingList);
		session.setAttribute("followerList", followerList);
		
		session.setAttribute("nickName", nickName);
		ArrayList<WishList> wishList = new ArrayList<WishList>();
		ArrayList<ShareBucket> shareList = new ArrayList<ShareBucket>();
		if(userId != null) {
			wishList = mainService.selectWishList(userId);
			shareList = mainService.selectShareList(userId);
		} else {
			String getUserId = mService.getUserId(nickName);
			wishList = mainService.selectWishList(getUserId);
			shareList = mainService.selectShareList(getUserId);
		}
		
		ArrayList<MemberMyBucketList> myBucketList = new ArrayList<MemberMyBucketList>();

		String flag = "false";
		if (loginUser != null && loginUser.getNickName().equals(nickName)) {
			myBucketList = mService.myBucketList(loginUser.getNickName());
			flag = "true";
		} else if(loginUser != null ) {
			myBucketList = mService.myBucketList(nickName);
			followCheck = mService.followCheck(nickName, loginUser.getUserId());
		} else {
			String getUserId = mService.getUserId(nickName);
			myBucketList = mService.myBucketList(nickName);
			followCheck = mService.followCheck(nickName, getUserId);
		}
		int list = myBucketList.size();
		session.setAttribute("getMember", getMember);
		session.setAttribute("list", list);

		if (myBucketList != null) {
			m.addAttribute("myBucketList", myBucketList).addAttribute("flag", flag).addAttribute("followingList", followingList).addAttribute("followerList", followerList).addAttribute("followCheck", followCheck).addAttribute("wishList", wishList).addAttribute("shareList", shareList);
			return "myPageBucket";
		} else {
			return "myPageBucket";
		}
	}

	// 버킷리스트를 추가페이지 이동
	@RequestMapping("bucketWrite.me")
	public String BucketWrite() {
		return "bucketWrite";
	}

	// 내가 작성한 버킷/ 버킷에 따른 스토리/ 버킷에 대한 index번호
	@RequestMapping("myBlog.me")
	public String BucketBlog(HttpSession session, Model m, @RequestParam(value = "bkNo", required = false) String bkNo,
			@RequestParam(value = "page", required = false) Integer page, @RequestParam("nickName") String nickName,
			@RequestParam(value = "bNo", required = false) String bNo) {
		String flag = "false";
		session.setAttribute("nickName", nickName);
		int followCheck = 2;
		Member loginUser = null;
		if(session.getAttribute("loginUser") != null) {
			loginUser = (Member) session.getAttribute("loginUser");			
		}
		int currentPage = 1;

		if (page != null) {
			currentPage = page;
		}
		int listCount = 0;
		ArrayList<MemberMyBucketList> myBucketList = new ArrayList<MemberMyBucketList>();
		PageInfo pi = null;

		boolean check = false;
		listCount = mService.getListCount(nickName);
		if (bkNo != null) {
			while (true) {
				pi = Pagination.getPageInfo(currentPage, listCount);
				myBucketList = mService.myBucketListPage(nickName, pi);
				if (!myBucketList.isEmpty()) {
					for (MemberMyBucketList mmbl : myBucketList) {
						if (mmbl.getBkNo() == Integer.parseInt(bkNo)) {
							check = true;
							break;
						}
					}
				} 
				if(check) {
					break;
				}
				currentPage++;
			}
		} else {
			pi = Pagination.getPageInfo(currentPage, listCount);
			myBucketList = mService.myBucketListPage(nickName, pi);	
		}

		int bn = 0;
		int index = 0;
		if (myBucketList.isEmpty()) {
		} else {
			if (bkNo == null) {
				bkNo = myBucketList.get(0).getBkNo() + "";
				bn = Integer.parseInt(bkNo);
				index = 0;
			} else {
				bn = Integer.parseInt(bkNo);
				for (int i = 0; i < myBucketList.size(); i++) {
					if (myBucketList.get(i).getBkNo() == bn) {
						index = i;
						break;
					}
				}
			}
		}
		
		Member getMember = new Member();
		ArrayList<Board> bList = new ArrayList<Board>();
		if (loginUser != null && loginUser.getNickName().equals(nickName)) {
			bList = mService.getBoard(loginUser.getNickName(), bn);
			flag = "true";
		} else if(loginUser != null){
			bList = mService.getBoard(nickName, bn);
			followCheck = mService.followCheck(nickName, loginUser.getUserId());
		} else {
			String getUserId = mService.getUserId(nickName);
			bList = mService.getBoard(nickName, bn);
			followCheck = mService.followCheck(nickName, getUserId);
			System.out.println(bList);
			
		}
		getMember = mService.getMember(nickName);
		
//		int list = myBucketList.size();
		session.setAttribute("getMember", getMember);
		session.setAttribute("list", listCount);
		
		ArrayList<Follow> followingList = mService.getFollowingList(nickName);
		ArrayList<Follow> followerList = mService.getFollowerList(nickName);
		session.setAttribute("followingList", followingList);
		session.setAttribute("followerList", followerList);

		if (myBucketList != null & bList != null) {
			m.addAttribute("myBucketList", myBucketList).addAttribute("index", index).addAttribute("bList", bList)
					.addAttribute("pi", pi).addAttribute("flag", flag).addAttribute("bNo", bNo).addAttribute("getMember", getMember).addAttribute("followCheck", followCheck);
			return "bucketBlog";
		} else {
			System.out.println("TEST3");
			return "bucketBlog";
		}
	}
	
	// 버킷리스트 등록
	@RequestMapping(value = "bInsert.me", method = RequestMethod.POST)
	public String BucketInsert(@ModelAttribute BucketList BL, @RequestParam("uploadFile") MultipartFile uploadFile,
			@RequestParam("tags") List<String> tags, HttpServletRequest request, HttpSession session,
			HttpServletResponse response) throws UnsupportedEncodingException {
		response.setContentType("text/html;charset=UTF-8");
		System.out.println();
		BL.setBkContent(BL.getBkContent().replaceAll(System.getProperty("line.separator"), "<br>"));
		System.out.println(BL.getBkContent());
		String nickName = (String) session.getAttribute("nickName");
		Media m = new Media();
		String tag = String.join(",", tags);
		BL.setTag(tag);
		BL.setUserId(((Member) session.getAttribute("loginUser")).getUserId());

		if (uploadFile != null && !uploadFile.isEmpty()) {
			String mweb = saveFile(uploadFile, request);

			if (mweb != null) {
				m.setMorigin(uploadFile.getOriginalFilename());
				m.setMweb(mweb);
			}
		}

		int result = mService.bucketInsert(m, BL);

		if (result > 0) {
			return "redirect:myBucket.me?nickName=" + URLEncoder.encode(nickName, "UTF-8");
		} else {
			return "bucketWrite";
		}
	}
	
	// 파일 업로드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\muploadFiles";

		File folder = new File(savePath);

		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
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
	
	
	//	댓글 등록 
	@RequestMapping(value = "bCommentInsert.me", method = RequestMethod.POST)
	public void bCommentInsert(@ModelAttribute BoardComment boardComment, HttpSession session, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		Member m = (Member) session.getAttribute("loginUser");
		boardComment.setUserid(m.getUserId());
		ArrayList<BoardComment> bCommentList =  mService.bCommentInsert(boardComment);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(bCommentList, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//	댓글의 답글 등록
	@RequestMapping(value = "replyInsert.me", method = RequestMethod.POST)
	public void replyInsert(@ModelAttribute Reply reply, HttpSession session, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		Member m = (Member) session.getAttribute("loginUser");
		reply.setUserid(m.getUserId());
		ArrayList<Reply> replyList = mService.replyInsert(reply);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(replyList, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 댓글 수정
	@RequestMapping(value = "bCommentUpdate.me", method = RequestMethod.POST)
	public void bCommentUpdate(@ModelAttribute BoardComment boardComment, HttpSession session, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		Member m = (Member) session.getAttribute("loginUser");
		boardComment.setUserid(m.getUserId());
		BoardComment bc = mService.bCommentUpdate(boardComment);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(bc, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 댓글의 답글 수정
	@RequestMapping(value = "replyUpdate.me", method = RequestMethod.POST)
	public void replyUpdate(@ModelAttribute Reply reply, HttpSession session, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		Member m = (Member) session.getAttribute("loginUser");
		reply.setUserid(m.getUserId());
		Reply r = mService.replyUpdate(reply);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(r, response.getWriter());
		} catch (JsonIOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 댓글 삭제
	@RequestMapping("commentDelete.me")
	@ResponseBody
	public String commentDelete(@RequestParam Integer cmNo, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		int result = mService.commentDelete(cmNo);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	// 댓글의 답글 삭제
	@RequestMapping("replyDelete.me")
	@ResponseBody
	public String replyDelete(@RequestParam Integer rpNo, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		int result = mService.replyDelete(rpNo);
		if(result > 0) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping("follow.me")
	@ResponseBody
	public String follow(Follow follow) {
		int result = mService.follow(follow);
		if(result > 0) {
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping("unfollow.me")
	@ResponseBody
	public String unfollow(Follow follow) {
		int result = mService.unfollow(follow);
		if(result > 0) {
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping("report.me")
	@ResponseBody
	public String report(Notify n) {
		if(n.getBno() != 0) {
			int result = mService.bReportCheck(n);
			if(result == 0) {
				result = mService.bReportInsert(n);
				return "success";
			} else {
				return "exist";
			}
		} else if(n.getCmno() != 0) {
			int result = mService.cReportCheck(n);
			if(result == 0) {
				result = mService.cReportInsert(n);
				return "success";
			} else {
				return "exist";
			}
		} else if(n.getRpno() != 0) {
			int result = mService.rReportCheck(n);	
			if(result == 0) {
				result = mService.rReportInsert(n);
				return "success";
			} else {
				return "exist";
			}
		}
		return "fail";
	}
	
	@RequestMapping("bLike.me")
	@ResponseBody
	public String bLike(BLike bl, @RequestParam String status) {
		if(status.equals("add")) {
			int result = mService.bLikeAdd(bl);
			if(result > 0) {
				return "success";			
			} 
		} else if(status.equals("remove")) {
			int result = mService.bLikeDel(bl);
			if(result > 0) {
				return "success";							
			} 
		}
		return "fail";
	}
	
	@RequestMapping("bLikeCheck.me")
	@ResponseBody
	public String bLikeCheck(BLike bl) {
		int result = mService.bLikeCheck(bl);
		if(result > 0) {
			return "exist";			
		}
		return "empty";
	}
	
	@RequestMapping("blogUpdate.me")
	public String blogUpdate(@RequestParam Integer bNo, Model m, @RequestParam Integer bkNo, @RequestParam Integer page) {
		Board b = mService.getUpdateBoard(bNo);
		if(b != null) {
			m.addAttribute("b", b).addAttribute("bkNo", bkNo).addAttribute("page", page);
		}
		return "blogUpdate";
	}
	
	@RequestMapping("bUpdate.me")
	public String bUpdate(HttpSession session, @RequestParam String bContent, @RequestParam Integer bkNo,
			@RequestParam Integer bNo, @RequestParam String bTitle, @RequestParam Integer page, Model model) throws UnsupportedEncodingException {
		bContent = bContent.replaceAll(System.getProperty("line.separator"), " ");
		Member loginUser = (Member) session.getAttribute("loginUser");
		String nickName = (String) session.getAttribute("nickName");
		String userid = loginUser.getUserId();

		Board board = new Board(bTitle, bContent, userid, bkNo);
		board.setbNo(bNo);
		int result = mService.bUpdate(board);

		if (result > 0) {
			return "redirect:myBlog.me?nickName=" + URLEncoder.encode(nickName, "UTF-8") + "&bkNo=" + board.getBkNo()
					+ "&page=" + page;
		} else {
			return "redirect:myBlog.me?bkNo=" + board.getBkNo() + "&page=" + page;
		}
	}
	
	@RequestMapping("blogDelete.me")
	public String blogDelte(HttpSession session, @RequestParam Integer bNo, @RequestParam Integer bkNo, @RequestParam Integer page, Model model) throws UnsupportedEncodingException {
		Board board = new Board();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String nickName = loginUser.getNickName();
		board.setbNo(bNo);
		int result = mService.blogDelte(board);
		
		if (result > 0) {
			return "redirect:myBlog.me?nickName=" + URLEncoder.encode(nickName, "UTF-8") + "&bkNo=" + bkNo
			+ "&page=" + page;
		} else {
			return "redirect:myBlog.me?bkNo=" + board.getBkNo() + "&page=" + page;
		}
	}
	
	@RequestMapping("bucketUpdateGo.me")
	public String bucketUpdate(@RequestParam Integer bkNo, @RequestParam Integer page, Model m) {
		BucketList bucket = mService.getBucket(bkNo);
		m.addAttribute("bkNo", bkNo).addAttribute("page", page).addAttribute("bucket", bucket);
		return "bucketUpdate";
	}
	
	@RequestMapping("bucketUpdate.me")
	public String bucketUpdate(@ModelAttribute BucketList BL, @RequestParam("uploadFile") MultipartFile uploadFile,
			@RequestParam("tags") List<String> tags, HttpServletRequest request, HttpSession session,
			HttpServletResponse response, @RequestParam Integer bkNo, @RequestParam Integer page, @RequestParam String mweb) throws UnsupportedEncodingException {
		Member loginUser = (Member) session.getAttribute("loginUser");
		String nickName = loginUser.getNickName();
		BL.setBkContent(BL.getBkContent().replaceAll(System.getProperty("line.separator"), "<br>"));
		Media m = new Media();
		String tag = String.join(",", tags);
		BL.setTag(tag);
		BL.setUserId(((Member) session.getAttribute("loginUser")).getUserId());
		if (uploadFile != null && !uploadFile.isEmpty()) {
			String mweb2 = saveFile(uploadFile, request);
			if (mweb2 != null) {
				m.setBkno(bkNo);
				m.setMorigin(uploadFile.getOriginalFilename());
				m.setMweb(mweb2);
			}
		} else {
			m.setBkno(bkNo);
			m.setMweb(mweb);
		}
		int result = mService.bucketUpdate(m, BL);
		
		if (result > 0) {
			return "redirect:myBlog.me?nickName=" + URLEncoder.encode(nickName, "UTF-8") + "&bkNo=" + bkNo
					+ "&page=" + page;
		} else {
			return "redirect:myBlog.me?bkNo=" + bkNo + "&page=" + page;
		}		
	}
	
	@RequestMapping("profileChangeGo.me")
	public String profileChangeGo(HttpSession session, Model m, @RequestParam(value = "status", required = false) String status) {
		Member b = (Member) session.getAttribute("loginUser");
		Member getMember = mService.getMember(b.getNickName());
		if(status == null) {
			status = "2";
		}
		m.addAttribute("getMember", getMember).addAttribute("status", status);
		return "ProfileChange";
	}
	
	@RequestMapping("profileChange.me")
	public String profileChange(HttpSession session, Model m, @RequestParam("uploadFile") MultipartFile uploadFile, HttpServletRequest request) throws UnsupportedEncodingException {
		Member loginUser = (Member) session.getAttribute("loginUser");
		Member mb = new Member();
		System.out.println(loginUser.getUserId());
		if (uploadFile != null && !uploadFile.isEmpty()) {
			String profileImg = profileSaveFile(uploadFile, request);
			if (profileImg != null) {
				mb.setUserId(loginUser.getUserId());
				mb.setPrImage(profileImg);
			}
		} else {
			System.out.println("이건?");
			mb.setUserId(loginUser.getUserId());
			mb.setPrImage("");
		}
		int result = mService.profileChange(mb);
		if(result > 0) {
			return "redirect:profileChangeGo.me?status=1";			
		} else {
			return "redirect:myBucket.me";	
		}
	}
	
	public String profileSaveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\member\\images\\profiles";

		File folder = new File(savePath);
		if (!folder.exists()) {
			folder.mkdirs();
		}

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis())) + "."
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
