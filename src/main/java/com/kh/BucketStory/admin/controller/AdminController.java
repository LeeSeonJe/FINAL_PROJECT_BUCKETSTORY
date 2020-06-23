package com.kh.BucketStory.admin.controller;


import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.Company;

@Controller
public class AdminController {
	
	@Autowired
	private BoardService bService;
	
	
	@RequestMapping("adminwrite.ad")
	public String admintest() {
		return "festivalWrite";
	}
	
	/* 메인 페이지에서 페스티벌페이지*/
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
		  .setViewName("adminQnAinsert");
		
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
			throw new BoardException("상세페이지 요청에 실패했습니다.");
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
	
	/* 회원 경고페이지 리스트 */
	@RequestMapping("cautionlist.ad")
	public ModelAndView cautionlist(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getcautionListCount();
				
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notify> list = bService.notifyselectList(pi);
		
//		System.out.println("경고 페이지 리스트 " + list);
		
		if(list != null) {
			
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("adminCaution");
		} else {
			throw new BoardException("게시글 전체 조회에 실패했습니다.");
		}
		return mv;
	}
	
	/* 신고된 회원 경고  */
	@RequestMapping("warning.ad")
	public String waringmember(@RequestParam(value="Notify[]") List<String> no) {
		
		System.out.println("no 값 보기 " + no);
		
		int result = bService.warningMember(no);
		
		System.out.println("result 값 보기 " + result);
		
		if(result > 0) {
			return "redirect:adminwarning.ad";
		} else {
			throw new BoardException("경고 받은 회원 실패");
		}
	}
	
	/* 경고 회원 리스트*/
	@RequestMapping("adminwarning.ad")
	public ModelAndView memberList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Notify> list = bService.Memberlist(pi);
	
//		System.out.println("경고 받은 회원 확인하기 " + list);
	
		if(list != null) {
			
			mv.addObject("list", list)
			  .addObject("pi", pi)
			  .setViewName("adminMeDelete");
		} else {
			throw new BoardException("경고 회원 전체 조회 실패했습니다.");
		}
		
		return mv;
	}
	
	
	/* 회원 강제 탈퇴 */
	@RequestMapping("delectMember.ad")
	public String deleteMember(@RequestParam("Notify[]") List<String> no) {
		
//		int[] no = new int [no_no.size()];
//		for(int i = 0; i < no.length; i++) {
//			no[i] = Integer.parseInt(no_no.get(i));
//		}
//		
		int result = bService.deleteMember(no);
		
		if(result > 0) {
			return "redirect:adminwarning.ad";
		} else {
			throw new BoardException("회원 삭제 실패");
		}
		
	}
	
	/* 기업 승인 리스트 */
	@RequestMapping("adminCompany.ad")
	public ModelAndView companylist(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = bService.companyListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Company> list = bService.companylist(pi);
		
		if(list != null) {
			mv.addObject("list",list)
			  .addObject("pi", pi)
			  .setViewName("adminJoinCompanyList");
		} else {
			throw new BoardException("리스트 실패");
		}
		
		return mv;
	}
	
	
	
	/* 기업 승인 상세페이지 */
	@RequestMapping("companyDetail.ad")
	public ModelAndView adminCompanyDetail(@RequestParam("coId") String c, @RequestParam("page") int page, ModelAndView mv) {
		
//		System.out.println("c 값 " + c);
		
		
		Company company = bService.adminCompanyDetail(c);

//		System.out.println("company 값 " + company);
		
		if(company != null) {
			mv.addObject("company", company)
			  .addObject("page", page)
			  .setViewName("adminJoinCompanyDetail");
		} else {
			throw new BoardException("기업 승인 상세보기 실패했습니다.");
		}	
		
		return mv;
	}
	
	/* 기업 승인 상세페이지 */
	@RequestMapping("companyanppoval.ad")
	public String companyanppoval(@RequestParam("coId") String c, @RequestParam("page") int page) {
			
			System.out.println("c 값 " + c);
			
			int result = bService.companyanppoval(c);
			
			if(result > 0) {
				return "redirect:adminCompany.ad";
			} else {
				throw new BoardException("기업 승인에 실패하였습니다");
			}
	}
	
	/* 기업 거절 상세페이지 */
	@RequestMapping("uncompanyanppoval.ad")
	public String uncompanyanppoval(@RequestParam("coId") String c, @RequestParam("page") int page) {
		
		int result = bService.uncompayanpporval(c);
		
		if(result > 0) {
			
			return "redirect:adminCompany.ad";
		} else {
			throw new BoardException("기업 거절에 실패하였습니다");
		}
	}
}