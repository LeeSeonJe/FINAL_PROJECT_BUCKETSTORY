package com.kh.BucketStory.common.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Update;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.MissingAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.BucketStory.common.model.service.CommonService;
import com.kh.BucketStory.common.model.vo.Email;
import com.kh.BucketStory.common.model.vo.EmailSender;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.Company;
import com.sun.javafx.collections.MappingChange.Map;

@SessionAttributes({"loginUser", "loginCompany"})
@Controller
public class CommonController {

	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private Email EEmail;
	
	@Autowired // 의존성 주입
	private CommonService cService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("login.co")
	public String LoginView() {
		return "login";
		
	}
	
	@Autowired
    private FacebookConnectionFactory connectionFactory;
	
    @Autowired
    private OAuth2Parameters oAuth2Parameters;
    
 // 로그인 테스트
    @RequestMapping("loginTest.co")
	public String LoginTest(@ModelAttribute Member m, @ModelAttribute Company c, Model model) {
    		return "loginTest";
//    		return "redirect:main.ho?menuNum=1&category=0";
    	}
    
	// 유저 로그인
	@RequestMapping("memberlogin.co")
	@ResponseBody
	public String Login(@ModelAttribute Member m, Model model) {
		Member loginUser = cService.memberLogin(m);
		String returnString = "";
		if(loginUser != null) {
			if(bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
				model.addAttribute("loginUser", loginUser);
				returnString = "success";
			} else {
				System.out.println("로그인 실패");
				returnString = "fail";
			}
		} else {
			returnString = "fail";
		}
		return returnString;
	}
	
	@RequestMapping("loginSuccess.co")
	public String LoginSuccess(HttpSession session) {
		String userId =  ((Member)session.getAttribute("loginUser")).getUserId();
		if(userId.equals("admin")) {
			return "redirect:adminwrite.ad";
		} else {
			return "loginTest";
		}
		
	}
	   
    // 기업 로그인
  @RequestMapping("companylogin.co") 
  @ResponseBody
  public String companyLogin(@ModelAttribute Company c, Model model) {
	  Company loginUser = cService.companyLogin(c);
	  String returnString = "";
	  if(loginUser != null) {
		  if(bcryptPasswordEncoder.matches(c.getCoPwd(), loginUser.getCoPwd())) {
			  model.addAttribute("loginCompany", loginUser);
			  returnString = "success";
		  } else {
			  System.out.println("로그인 실패");
			  returnString = "fail";
		  }
	  } else {
		  returnString = "fail";
	  }
	  return returnString;
  	}
  
  	@RequestMapping("loginSuccess2.co")
  	public String LoginSuccess2() {
  		return "loginTest";
	}
  	
	// 로그아웃
    @RequestMapping("logout.co")
    public String logout(SessionStatus status) {
    	status.setComplete();
    	
        return "redirect:login.co";
    }
    
    // 유저 회원가입
    @RequestMapping("memberIn.co")
    public String memberInsert(@ModelAttribute Member m, @RequestParam("email_1") String email_1, @RequestParam("email_2") String email_2,
    						   @RequestParam("birthY") String birthY, @RequestParam("birthM") String birthM, @RequestParam("birthD") String birthD) {
    	String email = email_1 + "@" + email_2;
    	m.setEmail(email);
    	String birth = birthY + birthM + birthD;
    	m.setBirth(birth);
    	
    	// 암호화 방식
    	String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
    	m.setUserPwd(encPwd);
    	
    	int result = cService.insertMember(m);
    	String returnValue = "";
    	
    	if(result > 0) {
    		returnValue = "redirect:login.co";
    	} else {
    		System.out.println("실패");
    	}
    	
    	return returnValue;
    }
	 
  	//기업 회원가입
    @RequestMapping("CompanyIn.co")
    public String CompanyInsert(@ModelAttribute Company c, @RequestParam("uploadFile") MultipartFile uploadFile,
    							HttpServletRequest request, @RequestParam("busiemail_1") String busiemail_1, @RequestParam("busiemail_2") String busiemail_2) {
    	
    	String busiEmail = busiemail_1 + "@" + busiemail_2;
    	c.setBusiEmail(busiEmail);
    	
    	// 기업 비번 암호화 방식
    	String encPwd = bcryptPasswordEncoder.encode(c.getCoPwd());
    	c.setCoPwd(encPwd);
    	
    	if(uploadFile != null && !uploadFile.isEmpty()) {
    		String mveb = saveFile(uploadFile, request);
    		
    		if(mveb != null) {
    			c.setCheckImg(mveb);
    		}
    	}
    	
    	System.out.println(c);
    	int result = cService.insertCompany(c);
    	String returnValue = "";
    	
		if(result > 0) { 
			returnValue = "redirect:login.co"; 
		} else {
			System.out.println("실패"); 
		}
    	
    	return returnValue;
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
    
    // ID 유효성 체크
    @RequestMapping("idDuplicateCheck.co")
	  public void idDuplicateCheck(@RequestParam("userId") String id, HttpServletResponse response) {
		  
		  int result = cService.idDuplicateCheck(id);
		 
		  boolean inUsable = result == 0 ? true : false;
		  
		  try {
			  response.getWriter().print(inUsable);
		  } catch (IOException e) {
			  e.printStackTrace();
			  
		  }
	  }
    
    // 기업 ID 유효성 체크
    @RequestMapping("idDuplicateCheck2.co")
	  public void idDuplicateCheck2(@RequestParam("coId") String id2, HttpServletResponse response) {
		  
		  int result = cService.idDuplicateCheck2(id2);
		 
		  boolean inUsable = result == 0 ? true : false;
		  
		  try {
			  response.getWriter().print(inUsable);
		  } catch (IOException e) {
			  e.printStackTrace();
			  
		  }
	  }
    
 // 닉넴 유효성 체크
    @RequestMapping("nickCheck.co")
	  public void nickCheck(@RequestParam("nickName") String nick, HttpServletResponse response) {
		  
		  int result = cService.nickCheck(nick);
		 
		  boolean inUsable = result == 0 ? true : false;
		  
		  try {
			  response.getWriter().print(inUsable);
		  } catch (IOException e) {
			  e.printStackTrace();
			  
		  }
	  }
    
 // 아이디 찾기
    @RequestMapping("compareEmail.co")
    @ResponseBody
    public String emailCompare(@RequestParam("email_1") String email_1, @RequestParam("email_2") String email_2, Model model) { 
    
		String email = email_1 + "@" + email_2;
    	
    	String userId = cService.compareEmail(email);
    	
    	String returnValue = "";
		if(userId!=null) {
			returnValue = userId;
			System.out.println(returnValue);
		} else {
			returnValue = "fail";
		}
		return returnValue;
	}	
    
 // 기업 아이디 찾기
    @RequestMapping("compareEmail2.co")
    @ResponseBody
    public String emailCompare2(@RequestParam("busiemail_1") String busiemail_1, @RequestParam("busiemail_2") String busiemail_2, Model model) { 
    
		String busiemail = busiemail_1 + "@" + busiemail_2;
    	
    	String coId = cService.compareEmail2(busiemail);
    	
    	String returnValue = "";
		if(coId!=null) {
			returnValue = coId;
			System.out.println(returnValue);
		} else {
			returnValue = "fail";
		}
		return returnValue;
	}	

    // 회원 비밀번호 찾기 : 임시 비밀번호 이메일로 보냄과 동시에 비번변경
    @RequestMapping("getPw.co")
    public ModelAndView sendEmailAction (@RequestParam("email_1") String email_1, @RequestParam("email_2") String email_2, @RequestParam("memPwdEmail") String email, ModelMap model) throws Exception {
        ModelAndView mav;
        
        String Email = email_1 + "@" + email_2;
    	
        System.out.println(Email+" "+email);
        int pw=cService.getPw(Email, email);
        System.out.println(pw);
        
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran); // 임시비번
        
        String encPwd = bcryptPasswordEncoder.encode(joinCode);
        
        if(pw>0) {
            EEmail.setContent("회원님의 비밀번호는 "+joinCode+" 입니다.");
            EEmail.setReceiver(email);
            EEmail.setSubject(Email+"님 비밀번호 찾기 메일입니다.");
            emailSender.SendEmail(EEmail);
            
            cService.update_pw(encPwd);
            System.out.println(encPwd);
            model.addAttribute("msg", "회원님의 메일로 임시 비밀번호를 발송 하였습니다.");
            mav= new ModelAndView("redirect:/login.co");
            return mav;
        }else {
        	System.out.println("실패");
        	model.addAttribute("msg", "아이디 또는 이메일을 정확히 입력해 주세요.");
            mav=new ModelAndView("redirect:/logout.co");
            return mav;
        }
    }
    
 // 기업 비밀번호 찾기 : 임시 비밀번호 이메일로 보냄과 동시에 비번변경
    
 // join  뷰로 매핑
    @RequestMapping(value = "/join", method = { RequestMethod.GET, RequestMethod.POST })
    public String join(HttpServletResponse response, Model model) {
        
        OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
    
        model.addAttribute("facebook_url", facebook_url);
        System.out.println("/facebook" + facebook_url);
 
        return "redirect:main.ho?menuNum=1&category=0";
    }
    
   
    
}  
    
	
	

