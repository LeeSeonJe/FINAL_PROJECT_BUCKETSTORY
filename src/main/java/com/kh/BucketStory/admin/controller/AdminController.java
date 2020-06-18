package com.kh.BucketStory.admin.controller;


import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.BucketStory.admin.model.exception.BoardException;
import com.kh.BucketStory.admin.model.service.BoardService;
import com.kh.BucketStory.admin.model.vo.Festival;
import com.kh.BucketStory.admin.model.vo.Notify;
import com.kh.BucketStory.admin.model.vo.PageInfo;
import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.common.Pagination;

@Controller
public class AdminController {
	
	@Autowired
	private BoardService bService;
	
	
	@RequestMapping("adminwrite.ad")
	public String admintest() {
		return "festivalWrite";
	}
	
	/* 메인 페이지 에서 페스티벌페이지*/
	@RequestMapping("list.ad")
	public String adminfestivalList() {

		return "festivalView";
	}
	
	/* 페스티벌 작성 페이지 */
	@RequestMapping("feinsert.ad")
	public String festivalInsert(@ModelAttribute Festival f, @RequestParam("feUploadFile") MultipartFile uploadFile, HttpServletRequest request) {
		
		Media m = new Media();
		
		System.out.println(f);
		System.out.println(uploadFile);
		System.out.println(uploadFile.getOriginalFilename()); // 실제 사진 파일이 있는지 없는지를 확인 하는 방법
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String renameFileName = saveFile(uploadFile, request);
			
			if(renameFileName != null) {
				m.setMorigin(uploadFile.getOriginalFilename());
				m.setMweb(renameFileName);
			}
		}
				
		int result = bService.insertfestival(f, m);
		
		if(result > 0) {
			return "redirect:list.ad";
			
		} else {
			throw new BoardException("게시물 등록에 실패하였습니다.");
		}
	}
	
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\buploadFiles";
		
		File folder = new File(savePath);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String originFileName = file.getOriginalFilename();
		String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
								 + "."
								 + originFileName.substring(originFileName.lastIndexOf(".") + 1);
		
		String renamePath = folder + "\\" + renameFileName;
		try {
			file.transferTo(new File(renamePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	/* QnA 게시판 리스트 */
	@RequestMapping("adminQnAlist.ad")
	public ModelAndView adminQnAList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<adminQnA> list = bService.adminQnAselectList(pi);
		
//		System.out.println("값이 넘어 오는지 확인하기" + list);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("adminQnAboard");
		} else {
			throw new BoardException("실패하였습니다.");
		}
		
		return mv;
	}
	
//	/* qna 상세페이지 */
	@RequestMapping("qnadetail.ad")
	public ModelAndView adminqnadetailview(@RequestParam("q_no") int qno, @RequestParam("page") int page, ModelAndView mv) {
		
		adminQnA adminQnA = bService.adminqnadetailview(qno);
		
		mv.addObject("adminQnA", adminQnA)
		  .addObject("page", page)
		  .setViewName("adminQnADetail");
		
		return mv;
	}
	
//	/* qna 상세페이지(답변페이지 이동) */
	@RequestMapping("adminQnAinsert.ad")
	public ModelAndView adminqnaupdateDetail(@RequestParam("q_no") int qno, @RequestParam("page") int page, ModelAndView mv) {

		adminQnA adminQnA = bService.adminqnaUpdate(qno);

		if(adminQnA != null) {
			mv.addObject("adminQnA", adminQnA)
			  .addObject("page", page)
			  .setViewName("adminQnAinsert");

			return mv;
		} else {
			throw new BoardException("게시글 수정 폼 요청에 실패했습니다.");
		}	
	}

	/* qna 상세페이지(답변달기) */
	@RequestMapping("addAnswer.ad")
	public ModelAndView adminqnaupdate(@ModelAttribute adminQnA a, @RequestParam("q_no") int qno, @RequestParam("page") int page, ModelAndView mv) {
		
		int result = bService.adminqnaUpdatedetail(a);
		
		if(result > 0) {
			mv.addObject("page", page)
			  .addObject("adminQnA", a)
			  .setViewName("redirect:qnadetail.ad?q_no=" + a.getQ_no());
			
		} else {
			throw new BoardException("게시글 수정에 실패했습니다.");
		}
		 
		return mv;
	}
	
	/* 회원 경고페이지 이동 */
	@RequestMapping("cautionBoard.ad")
	public String cautionBoardlist() {
		return "adminCaution";
	}
	
	
	/* 회원 경고페이지 리스트 */
	@RequestMapping("cautionlist.ad")
	public ModelAndView cautionlist(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		PageInfo pi = Pagination.getPageInfo(currentPage, 0);
		
		ArrayList<Notify> list = bService.notifyselectList(pi);
		
		if(list != null) {
			
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("adminCaution");
		} else {
			throw new BoardException("게시글 전체 조회에 실패했습니다.");
		}
		return mv;
	}
	

}