package com.kh.BucketStory.expert.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.BucketStory.bucket.model.vo.BucketList;
import com.kh.BucketStory.bucket.model.vo.ComInBucket;
import com.kh.BucketStory.bucket.model.vo.Media;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.service.ExpertService;
import com.kh.BucketStory.expert.model.service.ExpertService2;
import com.kh.BucketStory.expert.model.vo.Company;
import com.kh.BucketStory.expert.model.vo.EsRequest;
import com.kh.BucketStory.expert.model.vo.Estimate;
import com.kh.BucketStory.expert.model.vo.Pay;

@Controller
public class ExpertController {

	@Autowired
	private ExpertService ExService;
	
	@Autowired
	private ExpertService2 ExService2;
	
	@RequestMapping("info.ex")
	public ModelAndView expertInfo(HttpSession session, ModelAndView mv) {
		Company loginCom = (Company) session.getAttribute("loginCompany");
		ArrayList<BucketList> bucket = ExService.selectComBucket(loginCom.getCoId());

		mv.addObject("company", loginCom);
		mv.setViewName("ex_info");
		if (bucket != null) {
			ArrayList<Media> media = ExService.selectAllBucketMediaList();
			mv.addObject("bucket", bucket);
			mv.addObject("media",media);
		}
		return mv;
	}

	@RequestMapping("ex_infoUpdateForm.ex")
	public ModelAndView ex_infoUpdateForm(HttpSession session, ModelAndView mv) {
		Company loginCom = (Company) session.getAttribute("loginCompany");
		ArrayList<BucketList> bucket = ExService.selectComBucket(loginCom.getCoId());

		mv.addObject("company",loginCom);
		mv.setViewName("ex_infoUpdateForm");
		if (bucket != null) {
			ArrayList<Media> media = ExService.selectAllBucketMediaList();
			mv.addObject("bucket", bucket);
			mv.addObject("media",media);
		}
		return mv;
	}

	@RequestMapping("expertUpdate.ex")
	@ResponseBody
	public String expertInfoUpdate(HttpSession session,
			@RequestParam("bucket") String bucket) {
			
		Company loginCom = (Company) session.getAttribute("loginCompany");
		ComInBucket cib = new ComInBucket();
					cib.setCoId(loginCom.getCoId());
					cib.setBkNo(bucket);

				int result2 = ExService.insertBucket(cib);
				if( result2 > 0) {
					return "success";
				}else {
					return "false";
				}
		
	}

	@RequestMapping("cateList.ex")
	public void selectCateList(@RequestParam("catenum") int catenum, HttpServletResponse response) {

		response.setContentType("application/json; charset=UTF-8");
		ArrayList<BucketList> list = ExService.selectCateList(catenum);
		ArrayList<Media> media = ExService.selectAllBucketMediaList();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list",list);
		map.put("media", media);
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(map, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping("estimate.ex")
	public ModelAndView extrimateView(HttpSession session,@RequestParam String esr_no,ModelAndView mv) {
		Company loginCom = (Company) session.getAttribute("loginCompany");
		EsRequest er = ExService.RequestDetail(esr_no);
		BucketList bucket = ExService.selectBucket(Integer.parseInt(er.getBkNo()));
		Member member = ExService.selectMember(er.getUserId());
		
		mv.addObject("member",member);
		mv.addObject("company", loginCom);
		mv.addObject("bucket",bucket);
		mv.addObject("er",er);
		
		mv.setViewName("estimate");
		return mv;
	}

	@RequestMapping("esrequest.ex")
	public ModelAndView ex_esrequestView(HttpSession session, @RequestParam int bkNo, ModelAndView mv) {
		Company loginCom = (Company) session.getAttribute("loginCompany");
		BucketList bl = ExService.selectBucket(bkNo);
		
		if (loginCom != null) {
			mv.addObject("company", loginCom);
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
			return "redirect:getRequest.ex";
		} else {
			return "redirect:getRequest.ex";
		}
	}

	
	 @RequestMapping("getRequest.ex")
	 public ModelAndView ex_getRequestView(HttpSession session,ModelAndView mv) {
		 Company loginCom = (Company) session.getAttribute("loginCompany");
		 ArrayList<EsRequest> er = ExService.selectEsRequest(loginCom.getCoId());
		 
		 mv.addObject("coId",loginCom.getCoId());
		 mv.addObject("er",er);
		 mv.setViewName("ex_getRequest");
		 
		 return mv;
	 }
	 
	 @RequestMapping("makingRequestView.ex")
	 public ModelAndView makingRequestView(ModelAndView mv,HttpSession session) {
		 Company loginCom = (Company) session.getAttribute("loginCompany");
		 ArrayList<Estimate> arr = ExService.selectMakingEstimteList(loginCom.getCoId()); 
		 
		 mv.addObject("coId",loginCom.getCoId());
		 mv.addObject("estimate",arr);
		 mv.setViewName("ex_MakingRequest");
		 return mv;
	 }
	 
	 @RequestMapping("makingEstimate.ex")
	 public ModelAndView makingEstimate(@RequestParam("es_no") String esno,ModelAndView mv) {
		 
		 Estimate es = ExService.selectEstimate(esno);
		 System.out.println(esno);
		 BucketList bucket = ExService.selectBucket(es.getBkNo());
		 Member member = ExService.selectMember(es.getUserId());
		 EsRequest er = ExService.selectEsRequestOne(es.getEsr_no());
		 ArrayList<Media> media = ExService.selectMediaList(Integer.parseInt(esno));
		 if(es.getEs_option() != null) {
			 String[] option = es.getEs_option().split(",");
			 ArrayList<String[]> arr = new ArrayList<String[]>();
			 for(int i=0; i<option.length;i++) {
				 String[] op = option[i].split("#");
				 arr.add(op);
			 }
			 mv.addObject("option",arr);
		 }
	     mv.addObject("media",media);
		 mv.addObject("es",es);
		 mv.addObject("member",member);
		 mv.addObject("bucket",bucket);
		 mv.addObject("er",er);
		 
		 mv.setViewName("makingEstimate");
		 
		 return mv;
		 
	 }
	 
	 @RequestMapping("completeRequestView.ex")
	 public ModelAndView completeRequestView(ModelAndView mv,HttpSession session) {
		 Company loginCom = (Company) session.getAttribute("loginCompany");
		 ArrayList<Estimate> estimate = ExService.selectCompleteEstimteList(loginCom.getCoId());
		 
		 
		 mv.addObject("es",estimate);
		 mv.addObject("coId",loginCom.getCoId());
		 mv.setViewName("ex_completeRequest");
		 return mv;
	 }
	 @RequestMapping("roadingRequestView.ex")
	 public ModelAndView roadingRequestView(HttpSession session,ModelAndView mv) {
		 Company loginCom = (Company) session.getAttribute("loginCompany");
		 ArrayList<Estimate> es = ExService.selectEstimteList(loginCom.getCoId());
//		 BucketList bucket = ExService.selectBucket(es.get(0).getBkNo());
		 
		 mv.addObject("coId",loginCom.getCoId());
		 mv.addObject("estimate",es);
//		 mv.addObject("bucket",bucket);
		 mv.addObject("companyId",loginCom.getCoId());
		 
		 mv.setViewName("ex_roadingListView");
		 
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
	 
	 @RequestMapping("sendEstimate.ex")
	 public String sendEstimate(@ModelAttribute Estimate es,
			 					@RequestParam(value = "optionName", required = false) String optionName,
			 					@RequestParam(value = "optionPrice", required = false) String optionPrice,
			 					@RequestParam("uploadFile") MultipartFile[] uploadFile,
			 					HttpServletRequest request,HttpSession session) {
		 Company loginCom = (Company) session.getAttribute("loginCompany");
		 String esoption =""; 
		 
			 if(optionName != null && optionPrice !=null) {
				 String[] opn = optionName.split(","); 
				 String[] opc = optionPrice.split(",");
				 
				 for(int i=0;i<opn.length;i++) { 
					 if(i != opn.length-1) {
						 esoption += opn[i]+"#"+opc[i]+","; 
					 }else {
						 esoption += opn[i]+"#"+opc[i];
					 }
					
				 	es.setEs_option(esoption);
				 }
		 	}
			 int result = ExService.insertEstimate(es);
			 System.out.println(result);
			 
			 if(result>0) {
				 Pay p = new Pay();
				 p.setCoid(es.getCoId());
				 p.setPa_pay(500);
				 p.setStatus('N');
			 
				 int result6 =ExService2.insertPoint(p);
				 if(result6>0) {
					 Company c = new Company();
						c.setCoId(es.getCoId());
						c.setPoint(loginCom.getPoint()-500);
						System.out.println(c.getPoint());
					int result2 = ExService2.updateCompanyPoint(c);
				 }
				 int result3 =  ExService.updateEsRequestPosition(es.getEsr_no());
				 
				 if(uploadFile != null) {
				 int result2 = 1;
				 
				 for (MultipartFile file : uploadFile) {
					 if(file != null && !file.isEmpty() && result2 == 1) {
						 Media media = new Media();
							String renameFileName = saveFile(file,request);
							System.out.println(renameFileName);
							if(renameFileName != null) {
								media.setMorigin(file.getOriginalFilename());
								media.setMweb(renameFileName);
								
								result2 = ExService.insertEsmedia(media);
							}
					 }
				  }
				 }
			 }
			if(es.getStatus()==1) {
				return "redirect:roadingRequestView.ex";
			}else if(es.getStatus()==2){
				return "redirect:makingRequestView.ex";
			}else {
				return "redirect:roadingRequestView.ex";
			}
			
	 
	 }
	 
	 public String saveFile(MultipartFile file, HttpServletRequest request) {
			
			String root = request.getSession().getServletContext().getRealPath("resources");
			String savePath = root+"\\muploadFiles";
			
			File folder = new File(savePath);
			
			if(folder.exists()) {//폴더가 존재하지않으면
				folder.mkdirs();//폴더를 만들어 줘라
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originFileName = file.getOriginalFilename();
			String renameFileName = sdf.format(new Date(System.currentTimeMillis()))
					                           +"."
					                           +originFileName.substring(originFileName.lastIndexOf(".")+1);
			String renamePath = folder + "\\" +renameFileName;
			try {
				file.transferTo(new File(renamePath));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return renameFileName;
		}
	 
     public String payCheck(HttpSession session,HttpServletResponse response) {
			 Company loginCom = (Company) session.getAttribute("loginUser");
			 ExpertController2 ec2 = new ExpertController2();
			 
			 int point = loginCom.getPoint();
			 if(point > 500) {
				 Pay p = new Pay();
					 p.setCoid(loginCom.getCoId());
					 p.setPa_pay(500);
					 p.setStatus('N');
				 
				 int result =ExService2.insertPoint(p);
				 
				 if(result > 0) {
	
						Company c = new Company();
	
						c.setCoId(loginCom.getCoId());
						c.setPoint(point);
	
						// Company 에 보유포인트 갱신
						int result2 = ExService2.updateCompanyPoint(c);
						if(result2 >0) {
							return "success";
						}else {
							return "false";
						}
				 }else {
						return "false";
					}
			 }else {
				 return "false";
			 }
     }
	 
	 @RequestMapping("estimateView.ex")
	 public ModelAndView estimateView(@RequestParam("es_no") String esno,ModelAndView mv) {
		 Estimate es = ExService.selectEstimate(esno);
		 BucketList bucket = ExService.selectBucket(es.getBkNo());
		 Member m = ExService.selectMember(es.getUserId());
		 EsRequest er = ExService.selectEsRequestOne(es.getEsr_no());
		 ArrayList<Media> media = ExService.selectMediaList(es.getEs_no());
		 ArrayList<String[]> arr = new ArrayList<String[]>();
		 if(es.getEs_option()!= null) {
			 String[] option = es.getEs_option().split(",");
			 for(int i=0; i<option.length;i++) {
				 String[] op = option[i].split("#");
				 arr.add(op);
			 }
		 }
		 
		 mv.addObject("media",media);
		 mv.addObject("er", er);
		 mv.addObject("es",es);
		 mv.addObject("option",arr);
		 mv.addObject("bucket",bucket);
		 mv.addObject("member",m);
		 mv.setViewName("estimateView");
		 
		 return mv;
		 
	 }
	 
	 @RequestMapping("updateEstimate.ex")
	 public String updateEstimate(@ModelAttribute Estimate es,
							@RequestParam(value = "optionName", required = false) String optionName,
							@RequestParam(value = "optionPrice", required = false) String optionPrice,
							@RequestParam(value="uploadFile", required=false) MultipartFile[] uploadFile,
							HttpServletRequest request) {
			String esoption =""; 
			
			if(optionName != null && optionPrice !=null) {
			String[] opn = optionName.split(","); 
			String[] opc = optionPrice.split(",");
			
			for(int i=0;i<opn.length;i++) { 
				 if(i != opn.length-1) {
					 esoption += opn[i]+"#"+opc[i]+","; 
				 }else {
					 esoption += opn[i]+"#"+opc[i];
				 }
				
				es.setEs_option(esoption);
			}
			}
			
			int result = ExService.updateEstimate(es);
			if(es.getStatus()==4) {
				Pay p = new Pay();
				 p.setCoid(es.getCoId());
				 p.setPa_pay(500);
				 p.setStatus('Y');
			 
				 int result6 =ExService2.insertPoint(p);
				 
				 if(result6>0) {
					 int yPoint = ExService2.getYPoint(es.getCoId()); // 충전 포인트
					int nPoint = ExService2.getNPoint(es.getCoId()); // 사용 포인트
					int point = yPoint - nPoint;
					 Company c = new Company();
						c.setCoId(es.getCoId());
						c.setPoint(point);
						System.out.println(c.getPoint());
					int result2 = ExService2.updateCompanyPoint(c);
				 }
			}
			if(result>0 && uploadFile != null) {
			
			int result2 = 1;
			
			for (MultipartFile file : uploadFile) {
				 if(file != null && !file.isEmpty() && result2 == 1) {
					 Media media = new Media();
						String renameFileName = saveFile(file,request);
						System.out.println(renameFileName);
						if(renameFileName != null) {
							media.setMorigin(file.getOriginalFilename());
							media.setMweb(renameFileName);
							media.setEsNo(es.getEs_no());
							
							result2 = ExService.updateEsmedia(media);
						}
				 }
			}
			}
			if(es.getStatus()==1) {
				return "redirect:roadingRequestView.ex";
			}else if(es.getStatus()==2) {
				return "redirect:makingRequestView.ex";
			}else if(es.getStatus() ==3 || es.getStatus() ==4){
				return "redirect:myEstimateView.ex";
			}else {
				return "redirect:myEstimateView.ex";
			}
	 }
	 @RequestMapping("deleteMedia.ex")
	 public void deleteMedia(@RequestParam("mnumber") String mnumber,
			 				 @RequestParam("esno") String esno,HttpServletResponse response) {
		 System.out.println(mnumber);
		 System.out.println(esno);
		 response.setContentType("application/json; charset=UTF-8");
		 
		 int result = ExService.deleteMedia(mnumber);
		 
		 if(result > 0) {
			 ArrayList<Media> media = ExService.selectMediaList(Integer.parseInt(esno));
			 
			 Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
				try {
					gson.toJson(media, response.getWriter());
				} catch (JsonIOException e) {
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		 }
	 }
	 
	 @RequestMapping("myEstimateView.ex")
	 public ModelAndView myEstimate(HttpSession session,ModelAndView mv) {
		 Member loginUser = (Member) session.getAttribute("loginUser");
		 
		 ArrayList<Estimate> es =  ExService.selectUserEstimate(loginUser.getUserId());
		 Map<Integer,String> bucket = new HashMap<Integer,String>();
		 
		 for(int i=0;i<es.size();i++) {
			 BucketList b = ExService.selectBucket(es.get(i).getBkNo());
			 bucket.put(es.get(i).getBkNo(),b.getBkName());
		 }
		 
		 
		 mv.addObject("bucket",bucket);
		 mv.addObject("es",es);
		 mv.setViewName("ex_userEstimate");
		 
		 return mv;
	 }
	 
	 @RequestMapping("myEstimate.ex")
	 @ResponseBody
	 public void myEstimate(HttpSession session,@RequestParam("status") String status,HttpServletResponse response) {
		 	
		 response.setContentType("application/json; charset=UTF-8");
		 	Member loginUser = (Member) session.getAttribute("loginUser");
		 	Map<String,String> m = new HashMap<String,String>();
		 	m.put("userId", loginUser.getUserId());
		 	m.put("status", status);
		 	
			ArrayList<Estimate> list = ExService.selectMyEstimate(m);
			System.out.println(list.size());
			 Map<Integer,String> bucket = new HashMap<Integer,String>();
			 
			 for(int i=0;i<list.size();i++) {
				 BucketList b = ExService.selectBucket(list.get(i).getBkNo());
				 bucket.put(list.get(i).getBkNo(),b.getBkName());
			 }
			 Map<String,Object> map = new HashMap<String,Object>();
				map.put("list",list);
				map.put("bucket", bucket);

			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			try {
				gson.toJson(map, response.getWriter());
			} catch (JsonIOException e) {
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	 }
	 
	 
}
