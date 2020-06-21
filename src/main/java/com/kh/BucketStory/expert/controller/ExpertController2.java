package com.kh.BucketStory.expert.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.BucketStory.admin.model.vo.adminQnA;
import com.kh.BucketStory.expert.model.exception.ExpertException;
import com.kh.BucketStory.expert.model.service.ExpertService;
import com.kh.BucketStory.expert.model.service.ExpertService2;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.expert.model.vo.PageInfo;
import com.kh.BucketStory.expert.model.vo.Pay;
import com.kh.BucketStory.expert.model.vo.pagination;

@Controller
public class ExpertController2 {

	// 의존성주입
	@Autowired
	private ExpertService ExService;

	@Autowired
	private ExpertService2 ExService2;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// Ajax용
	private static void resWriter(HttpServletResponse response, String msg) {
		try {
			PrintWriter out = response.getWriter();
			out.append(msg);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	/*  --------------------------------------------------
	 *  포인트 충전페이지 이동
	 *  --------------------------------------------------
	 */
//	@RequestMapping("point.ex")
//	public ModelAndView goPoint(HttpSession session, ModelAndView mv) {
//		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
//
//		if (ExService2.getListCount(coId) > 0) {
//			mv.addObject("hp", getPoint(coId));
//		} else {
//			mv.addObject("hp", 0);
//		}
//
//		mv.addObject("coId", coId);
//		mv.setViewName("hp_point");
//		return mv;
//	}
	@RequestMapping("point.ex")
	public ModelAndView goPoint(HttpSession session, ModelAndView mv, 
								@RequestParam(value = "search") @Nullable String search,
								@RequestParam(value = "page", required = false) Integer page) {

		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCount = 0;
		ArrayList<Pay> list = null;
		PageInfo pi = null;
		int uPoint = 0;
		String check = "goList";
		
		System.out.println(search);

		if(search.equals("none")) {
			check ="first";
			search = "all";
		}
		if( search.equals("insertPay") || search.equals("all") ){
			listCount = ExService2.getListCount(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectList(pi, coId);
			uPoint = getPoint(coId);
		}
		if (search.equals("Y")) {
			listCount = ExService2.getListCountY(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectListY(pi, coId);
			uPoint = ExService2.getYPoint(coId);
		}
		if (search.equals("N")) {
			listCount = ExService2.getListCountN(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectListN(pi, coId);
			uPoint = ExService2.getNPoint(coId);
		}

		if (list != null) {
			// list, pi, view
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("coId", coId);
			mv.addObject("search", search);
			mv.addObject("check", check);
			if (listCount > 0) {
				mv.addObject("hp", uPoint);
			} else {
				mv.addObject("hp", 0);
			}
			mv.setViewName("hp_point");
		} else {
			throw new ExpertException("포인트 조회에 실패했습니다.");
		}
		return mv;
	}

	/*  --------------------------------------------------
	 *  결제 이벤트 발생 -> 포인트 충전요청 
	 *  --------------------------------------------------
	 */
	@RequestMapping("pinsert.ex")
	public String pointInsert(HttpSession session, @ModelAttribute Pay p, HttpServletRequest request) {

		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		System.out.println(p);

		// PAY 테이블에 Point 집어넣기
		int result = ExService2.insertPoint(p);

		Company c = new Company();

		c.setCoId(coId);
		c.setPoint(getPoint(coId));

		// Company 에 보유포인트 갱신
		int result2 = ExService2.updateCompanyPoint(c);

		if (result > 0 && result2 > 0) {
//			System.out.println("완료");
			return "redirect:point.ex?search=insertPay";
		} else {
			throw new ExpertException("실패하였습니다.");
		}

	}

	/*  --------------------------------------------------
	 *  보유 포인트(coId) 확인
	 *  --------------------------------------------------
	 */

	public int getPoint(String coId) {
		int yPoint = ExService2.getYPoint(coId); // 충전 포인트
		int nPoint = ExService2.getNPoint(coId); // 사용 포인트
		return yPoint - nPoint;
	}

	
	/*  --------------------------------------------------
	 *  포인트 내역 페이지(전체)
	 *  --------------------------------------------------
	 */
	@RequestMapping("pointListAll.ex")
	public ModelAndView pointList(@RequestParam(value = "page", required = false) Integer page, ModelAndView mv,
			HttpServletRequest request) {
		char check = request.getParameter("check").charAt(0);
		String keyword = request.getParameter("keyword");

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = ExService2.getListCount();
		PageInfo pi = pagination.getPageInfo(currentPage, listCount);

		ArrayList<Pay> list = ExService2.selectList(pi);

		if (list != null) {
			// list, pi, view
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.setViewName("hp_pointListAll");
		} else {
			throw new ExpertException("포인트 내역 조회에 실패했습니다.");
		}
		return mv;
	}

	/*  --------------------------------------------------
	 *  포인트 내역 페이지(페이징)
	 *  --------------------------------------------------
	 */
	@RequestMapping(value = "pointList.ex", method = RequestMethod.GET)
	public ModelAndView pointList(HttpSession session, @RequestParam(value = "page", required = false) Integer page,
			ModelAndView mv) {

		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCount = ExService2.getListCount(coId);

		PageInfo pi = pagination.getPageInfo(currentPage, listCount);
		ArrayList<Pay> list = ExService2.selectList(pi, coId);
		if (list != null) {
			// list, pi, view
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("coId", coId);
			
			
			if (listCount > 0) {
				mv.addObject("hp", getPoint(coId));
			} else { // 포인트 내역이 없으면
				mv.addObject("hp", 0);
			}
			mv.setViewName("hp_pointList");
		} else {
			throw new ExpertException("포인트 내역 조회에 실패했습니다.");
		}
		return mv;
	}

	/*  --------------------------------------------------
	 *  포인트 내역 페이지(페이징 + 필터링)
	 *  
	 *  --------------------------------------------------
	 */
	@RequestMapping(value = "pointListYN.ex", method = RequestMethod.GET)
	public ModelAndView pointList(HttpSession session, @RequestParam(value = "search") String search,
			@RequestParam(value = "page", required = false) Integer page, ModelAndView mv) {

		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();

		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCount = 0;
		ArrayList<Pay> list = null;
		PageInfo pi = null;
		int uPoint = 0;
		
		//System.out.println(search);
		
		if(search.equals("all")) {
			listCount = ExService2.getListCount(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectList(pi, coId);
			uPoint = getPoint(coId);
		}
		if (search.equals("Y")) {
			listCount = ExService2.getListCountY(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectListY(pi, coId);
			uPoint = ExService2.getYPoint(coId); 
		}
		if (search.equals("N")) {
			listCount = ExService2.getListCountN(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectListN(pi, coId);
			uPoint = ExService2.getNPoint(coId); 
		}
		
		if (list != null) {
			// list, pi, view
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("coId", coId);
			mv.addObject("search",search);
	
			if (listCount > 0) {
				mv.addObject("hp", uPoint);
			} else { 
				mv.addObject("hp", 0);
			}
			mv.setViewName("hp_pointListYN");
		} else {
			throw new ExpertException("포인트 내역 조회에 실패했습니다.");
		}
		return mv;
	}

	/*
	 *  ----------------------------------------------------------------------------------------
	 *  헬퍼 qna 문의 페이지
	 *  ----------------------------------------------------------------------------------------
	 */
	
	// qna 문의 페이지로 이동
	@RequestMapping("helperQnA.ex")
	public ModelAndView goHelperSendQnAt(HttpSession session, 
						@RequestParam(value = "page", required = false) Integer page,
						ModelAndView mv) {

		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}

		int listCount = ExService2.getListQnACount(coId);
		PageInfo pi = pagination.getPageInfo(currentPage, listCount);
		ArrayList<adminQnA> list = ExService2.selectQnAList(pi, coId);

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("coId", coId);
		mv.setViewName("hp_QnA");
		} else {
			throw new ExpertException("QnA 내역 조회에 실패했습니다.");
		}
		return mv;
	}
	
	// qna 문의 페이지로 이동
	@RequestMapping("helperSendQnA.ex")
	public String goHelperSendQnA() {
		// String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
		return "hp_sendQnA";
	}

	// qna 문의 전송 : ajax 방식으로 변경
	@RequestMapping("insertQnAjax.ex")
	public void insertQnAjax(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		System.out.println("진입");
		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		adminQnA aQ = new adminQnA(title, content, null, coId);
		int result = ExService2.insertQnA(aQ);

		if (result > 0) {
//			System.out.println("성공");
			resWriter(response, "ok");
		} else {
			resWriter(response, "fail");
		}
	}
	@RequestMapping("helperQnaDelete.ex")
	public void deleteQnA(@RequestParam(value="q_no") int q_no, 
							HttpServletResponse response) {
		
		int result = ExService2.deleteQnA(q_no);

		if (result > 0) {
//			System.out.println("성공");
			resWriter(response, "ok");
		} else {
			resWriter(response, "fail");
		}
	}
	@RequestMapping("helperQnaUpdate.ex")
	public void updateQnA(HttpSession session, @RequestParam(value="q_no") int q_no, 
							HttpServletRequest request,
							HttpServletResponse response) {
	
		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		String title = request.getParameter("q_title");
		String content = request.getParameter("q_content");
		
		adminQnA aQ = new adminQnA(q_no, title, content);
		
		int result = ExService2.updateQnA(aQ);

		if (result > 0) {
//			System.out.println("성공");
			resWriter(response, "ok");
		} else {
			resWriter(response, "fail");
		}
	}
	
	/*  -------------------------------------------------------------------------------------------------
	 *  Qna 내역 페이지
	 *  -------------------------------------------------------------------------------------------------
	 */
	@RequestMapping(value = "helperQnaList.ex", method = RequestMethod.GET)
	public ModelAndView showQnAList(HttpSession session, 
							@RequestParam(value = "page", required = false) Integer page,
							@RequestParam(value = "search") @Nullable String search,
			ModelAndView mv) {

		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		
		int listCount = 0;
		PageInfo pi = null;
		ArrayList<adminQnA> list = null;
		
		
		if(search.equals("all")) {
			listCount = ExService2.getListQnACount(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectQnAList(pi, coId);
		}
		if(search.equals("Y")) {
			listCount = ExService2.getListQnACountY(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectQnAListY(pi, coId);
		}
		if(search.equals("N")) {
			listCount = ExService2.getListQnACountN(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectQnAListN(pi, coId);
		}

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("pi", pi);
			mv.addObject("coId", coId);
			mv.addObject("search",search);
			mv.setViewName("hp_QnAList");
		} else {
			throw new ExpertException("QnA 내역 조회에 실패했습니다.");
		}
		return mv;
	}
	
	/*  -------------------------------------------------------------------------------------------------
	 *  Qna 상세 페이지
	 *  -------------------------------------------------------------------------------------------------
	 */
//	@SuppressWarnings("unchecked")
	@RequestMapping(value = "helperQnaDetail.ex", method = RequestMethod.GET)
	@ResponseBody
	public void showQnADetail(HttpServletResponse response,
							@RequestParam(value = "q_no") int q_no) {
			
		adminQnA q = ExService2.getQnANo(q_no);
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(q, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
//		
//		JSONObject qna = new JSONObject();
//		
//		qna.put("q_no",q.getQ_no());
//		qna.put("q_title",q.getQ_title());
//		qna.put("q_content",q.getQ_content());
//		qna.put("q_date", q.getQ_date());
//		qna.put("answer", q.getAnswer());
//		qna.put("an_date", q.getAn_date());
//		qna.put("an_content", q.getAn_content());
//	
//		try {
//			PrintWriter out = response.getWriter();
//				out.println(qna);
//				out.flush();
//				out.close();
//			
//			}catch(IOException e) {
//				e.printStackTrace();				
//			}
//		
	}
	
	
	


}
