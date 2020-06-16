package com.kh.BucketStory.expert.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.ComInBucket;
import com.kh.BucketStory.expert.model.exception.ExpertException;
import com.kh.BucketStory.expert.model.service.ExpertService;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.expert.model.vo.EsRequest;

@Controller
public class ExpertController {

	@Autowired
	private ExpertService ExService;

	@RequestMapping("info.ex")
	public ModelAndView expertInfo(@RequestParam("coId") String coId, ModelAndView mv) {
		Company company = ExService.selectCompanyInfo(coId);
		ArrayList<BucketList> bucket = ExService.selectComBucket(coId);

		mv.addObject("company", company);
		mv.setViewName("ex_info");
		if (bucket != null) {
			mv.addObject("bucket", bucket);
		}
		return mv;
	}

	@RequestMapping("ex_infoUpdateForm.ex")
	public ModelAndView ex_infoUpdateForm(@RequestParam("coId") String coId, ModelAndView mv) {

		Company company = ExService.selectCompanyInfo(coId);
		ArrayList<BucketList> bucket = ExService.selectComBucket(coId);

		mv.addObject(company);
		mv.setViewName("ex_infoUpdateForm");
		if (bucket != null) {
			mv.addObject("bucket", bucket);
		}
		return mv;
	}

	@RequestMapping("expertUpdate.ex")
	public ModelAndView expertInfoUpdate(@ModelAttribute Company com,
			@RequestParam(value = "bucket", required = false) String bucket, ModelAndView mv) {
		int result = ExService.updateExInfo(com);

		if (result > 0) {
			if (bucket != null) {
				String[] bucketList = bucket.split(",");
				List<ComInBucket> list = new ArrayList<ComInBucket>();
				Map<String, Object> hm = new HashMap<String, Object>();

				for (int i = 0; i < bucketList.length; i++) {
					ComInBucket cib = new ComInBucket();
					cib.setCoId(com.getCoId());
					cib.setBkNo(bucketList[i]);

					list.add(cib);
				}
				hm.put("list", list);

				int result2 = ExService.insertBucket(hm);

				if (result2 > 0) {
					mv.setViewName("redirect:info.ex?coId=" + com.getCoId());
				} else {
					throw new ExpertException("버킷리스트 등록에 실패하였습니다.");
				}
			} else {
				mv.setViewName("redirect:info.ex?coId=" + com.getCoId());
			}
		} else {
			throw new ExpertException("게시글 수정에 실패하였습니다.");
		}
		return mv;
	}

	@RequestMapping("cateList.ex")
	public void selectCateList(@RequestParam("catenum") int catenum, HttpServletResponse response) {

		response.setContentType("application/json; charset=UTF-8");
		ArrayList<BucketList> list = ExService.selectCateList(catenum);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping("estimate.ex")
	public ModelAndView extrimateView(@RequestParam String coId,@RequestParam String esr_no,ModelAndView mv, HttpSession session) {

		Company company = ExService.selectCompanyInfo(coId);
		EsRequest er = ExService.RequestDetail(esr_no);
		BucketList bucket = ExService.selectBucket(Integer.parseInt(er.getBkNo()));
		 
		mv.addObject("company", company);
		mv.addObject("bucket",bucket);
		mv.addObject("er",er);
		
		mv.setViewName("estimate");
		return mv;
	}

	@RequestMapping("esrequest.ex")
	public ModelAndView ex_esrequestView(@RequestParam String coId, @RequestParam int bkNo, ModelAndView mv) {

		Company company = ExService.selectCompanyInfo(coId);
		BucketList bl = ExService.selectBucket(bkNo);
		if (company != null) {
			mv.addObject("company", company);
			if (bl != null) {
				mv.addObject("bucket", bl);
			}
		}
		mv.setViewName("esrequest");
		return mv;
	}

	@RequestMapping("insertEsrequest.ex")
	public String insertRequest(@ModelAttribute EsRequest er, HttpSession session) {
		// er.setUserId(session.getAttribute("loginUser").getUserId);
		er.setUserId("user01");
		int result = ExService.insertEsrequest(er);
		if (result > 0) {
			return "redirect:getRequest.ex?coId="+er.getCoId();
		} else {
			return "redirect:getRequest.ex?coId="+er.getCoId();
		}
	}

	
	 @RequestMapping("getRequest.ex")
	 public ModelAndView ex_getRequestView(@RequestParam String coId,ModelAndView mv) {
	 
		 ArrayList<EsRequest> er = ExService.selectEsRequest(coId);
		 
		 mv.addObject("coId",coId);
		 mv.addObject("er",er);
		 mv.setViewName("ex_getRequest");
		 
		 return mv;
	 }
	 
	 @RequestMapping("makingRequestView.ex")
	 public ModelAndView makingRequestView(ModelAndView mv,@RequestParam String coId) {
		 
		 mv.addObject("coId",coId);
		 mv.setViewName("ex_MakingRequest");
		 return mv;
	 }
	 @RequestMapping("completeRequestView.ex")
	 public ModelAndView completeRequestView(ModelAndView mv,@RequestParam String coId) {
		 mv.addObject("coId",coId);
		 mv.setViewName("ex_completeRequest");
		 return mv;
	 }
	 
	 @RequestMapping("requestDetail.ex")
	 public ModelAndView requestDetail(@RequestParam String esr_no,ModelAndView mv) {
		 EsRequest er = ExService.RequestDetail(esr_no);
		 
		 if(er != null) {
			 mv.addObject("er",er);
			 Company company = ExService.selectCompanyInfo(er.getCoId());
			 BucketList bucket = ExService.selectBucket(Integer.parseInt(er.getBkNo()));
			 if(company != null && bucket != null) {
				 mv.addObject("company",company);
				 mv.addObject("bucket",bucket);
			 }
			 mv.setViewName("ex_requestDetail");
		 }
		 return mv;
		 
		 
	 }
}
