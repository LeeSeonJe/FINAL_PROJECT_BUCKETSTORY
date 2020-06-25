package com.kh.BucketStory.expert.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.expert.model.exception.ExpertException;
import com.kh.BucketStory.expert.model.service.ExpertService;
import com.kh.BucketStory.expert.model.service.ExpertService2;
import com.kh.BucketStory.expert.model.vo.Category;
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
	/*
	 *  -----------------------------------------------------------------------------------------------
	 *  헬퍼 메인페이지
	 *  	ModelAndView mv, 
	 *  	HttpSession session, 
	 *  	@RequestParam(value = "result") 
	 *  	@Nullable String result
	 *  -----------------------------------------------------------------------------------------------
	 */

	@RequestMapping("expertIntro.ex")
	public ModelAndView expertInfo2(ModelAndView mv, HttpSession session,
									@RequestParam(value = "result") @Nullable String result) {

		Company loginCom = (Company) session.getAttribute("loginCompany");
		// System.out.println(loginCom);

		// 기업/전문가 아이디
		String coId = loginCom.getCoId();
		System.out.println("기업아이디 :" + coId + "로 로그인하셨습니다.");

		// 상위 Top 5 포인트 보유왕
		ArrayList<Company> list = ExService2.selectTop5havingPoint();
	//	System.out.println(list);
	
		Company company = ExService.selectCompanyInfo(coId);	
		Media photo =  ExService2.getPhoto(coId);	
		Category cateName = ExService2.selectCateName(company.getCateNum());
		
			mv.addObject("com", company);
		if(photo !=null) {
			mv.addObject("photo", photo.getMweb());
		}
		
		mv.addObject("cateName", cateName.getCateName());
		mv.addObject("result", result);
		mv.addObject("list", list);
		mv.setViewName("hp_intro");
		return mv;
	}
	
	/* -----------------------------------------------------------------------------------------------
	 *  기업소개 변경
	 * -----------------------------------------------------------------------------------------------
	 */
	@RequestMapping("comUpdate.ex")
	public String comUpdate(HttpSession session, HttpServletRequest request, /*HttpServletResponse response,*/
			@RequestParam("uploadFile") MultipartFile uploadFile) {
		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		String coName = request.getParameter("coName");
		// String checkImg = request.getParameter("checkImg");
		String compaName = request.getParameter("compaName");
		String coIntro = request.getParameter("coIntro");
		int cateNum = Integer.parseInt(request.getParameter("cateNum"));
		String image = null;
		Company c = new Company(coId, coName, compaName,cateNum, coIntro);
		System.out.println("기업소개변경");
		System.out.println(c);
		
		int result = ExService2.updateCompany(c);
		
		if (uploadFile != null && !uploadFile.isEmpty()) {
			image = saveFile(uploadFile, request);
			if(image !=null) {
				Media media = new Media(coId, image, 1, 4);		
				int result2 = ExService2.goPhoto(media);
				if(result2 > 0) {
					System.out.println("사진집어넣기 성공");
				}
			}	
		}	
		if (result > 0) {	return "redirect:expertIntro.ex?result=ok";
		} else {		throw new ExpertException("정보 변경에 실패하였습니다.");
		}
	}
	/* -----------------------------------------------------------------------------------------------
	 *  기업소개 변경에 들어갈 파일 저장
	 * -----------------------------------------------------------------------------------------------
	 */
	private String saveFile(MultipartFile file, HttpServletRequest request) {
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
	/*
	 * -----------------------------------------------------------------------------------------------
	 * 헬퍼 회원정보 업데이트
	 * -----------------------------------------------------------------------------------------------
	 */
	
	@RequestMapping("helperUpdate.ex")
	public String helperUpdate(HttpSession session, HttpServletRequest request) {
		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		String coPwd = bcryptPasswordEncoder.encode(request.getParameter("coPwd"));
		String homePage = request.getParameter("homePage");
		String coTel = request.getParameter("coTel");
		String busiEmail = request.getParameter("busiEmail");
		Company c = new Company(coId, coPwd, homePage, coTel, busiEmail);
		int result = ExService2.updatehelper(c);
		if(result > 0) {return "redirect:expertIntro.ex?result=ok";
		} else {throw new ExpertException("정보변경에 실패하였습니다.");
		}
		
	}
	/*
	 * -----------------------------------------------------------------------------------------------
	 * 헬퍼 비번 일치확인 
	 * -----------------------------------------------------------------------------------------------
	 */
	@RequestMapping("helperPwdCheck.ex")
	public void helperPwdCheck(HttpSession session,
							   @RequestParam(value = "oldPwd") String oldPwd,
							   HttpServletResponse response) {
		
		String coPwd = ((Company) session.getAttribute("loginCompany")).getCoPwd();
		if(bcryptPasswordEncoder.matches(oldPwd,coPwd)){resWriter(response, "ok");
		}else {	resWriter(response, "fail");
		}
	}

	/*  --------------------------------------------------
	 *  포인트 충전페이지 이동
	 *  --------------------------------------------------
	 */
	@RequestMapping("point.ex")
	public ModelAndView goPointSimple(HttpSession session,ModelAndView mv) {
		String coId = ((Company) session.getAttribute("loginCompany")).getCoId();
		mv.addObject("coId", coId);
		mv.addObject("point", getPoint(coId));
		mv.setViewName("hp_point");
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
		
		int Ypoint = 0;
		int Npoint = 0;
		
		//System.out.println(coId);	
		// Null 처리 ->NVL이 안먹는다.
		if (ExService2.getListCount(coId) > 0) {

			if(ExService2.getListCountY(coId)>0) {
				Ypoint = ExService2.getYPoint(coId);
			}
			if(ExService2.getListCountN(coId)>0) {
				Npoint = ExService2.getNPoint(coId);
			}
			return Ypoint - Npoint;
		} else { 
			return 0;
		}
	}
	/*
	 * ===================================
	 *  Point => Ajax로 변경
	 *  ===================================
	 */
	@RequestMapping(value = "pointCountAjax.ex", method = RequestMethod.GET)
	@ResponseBody
	public void pointListAjaxP(HttpSession session,
								  @RequestParam(value = "page", required = false) Integer page,
								  @RequestParam(value = "search") @Nullable String search,
								  HttpServletResponse response){
	String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
		int currentPage = 1;
		int point = 0;
		if (page != null) {
			currentPage = page;
		}
		int listCount = 0;
		PageInfo pi = null;
		
		if(search.equals("all")) {
			listCount = ExService2.getListCount(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			point = getPoint(coId);
		}
		if (search.equals("Y")) {
			listCount = ExService2.getListCountY(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			point = ExService2.getYPoint(coId);
		}
		if (search.equals("N")) {
			listCount = ExService2.getListCountN(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			point = ExService2.getNPoint(coId);
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("pi", pi);
		map.put("point", Integer.toString(point));
		
		try {
			gson.toJson(map, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	@RequestMapping(value = "pointListAjax.ex", method = RequestMethod.GET)
	@ResponseBody
	public void pointListAjax2(HttpSession session,
								  @RequestParam(value = "page", required = false) Integer page,
								  @RequestParam(value = "search") @Nullable String search,
								  HttpServletResponse response){
		String coId = ((Company)session.getAttribute("loginCompany")).getCoId();
		int currentPage = 1;
		if (page != null) {
			currentPage = page;
		}
		int listCount = 0;
		ArrayList<Pay> list = null;
		PageInfo pi = null;
		if(search.equals("all")) {
			listCount = ExService2.getListCount(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectList(pi, coId);
		}
		if (search.equals("Y")) {
			listCount = ExService2.getListCountY(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectListY(pi, coId);
		}
		if (search.equals("N")) {
			listCount = ExService2.getListCountN(coId);
			pi = pagination.getPageInfo(currentPage, listCount);
			list = ExService2.selectListN(pi, coId);
		}
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(list, response.getWriter());
			
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}


}
