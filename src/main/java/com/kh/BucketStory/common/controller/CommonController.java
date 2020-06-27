package com.kh.BucketStory.common.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.BucketStory.common.model.service.CommonService;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.Company;

@SessionAttributes({"loginUser", "loginCompany"})
@Controller
public class CommonController {
	@Autowired
	JavaMailSender mailSender;
	
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
    @RequestMapping("nickChk.co")
	  public void nickNameCheck(@RequestParam("nickName") String nick, HttpServletResponse response) {
		  
		  int result = cService.nickNameCheck(nick);
		 
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
    
 // join  뷰로 매핑
    @RequestMapping(value = "/join", method = { RequestMethod.GET, RequestMethod.POST })
    public String join(HttpServletResponse response, Model model) {
        
        OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
        String facebook_url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, oAuth2Parameters);
    
        model.addAttribute("facebook_url", facebook_url);
        System.out.println("/facebook" + facebook_url);
 
        return "redirect:main.ho?menuNum=1&category=0";
    }
    
   
    @RequestMapping("emailCheck.co")
    @ResponseBody
    public String emailCheck(@RequestParam String email) {
    	
    	int result = cService.emailCheck(email);
    	if(result > 0) {
    		return "fail";
    	} else {
    		return "success";    		
    	}
    }
    
    @RequestMapping("CidEmailCheck.co")
    @ResponseBody
    public String CidEmailCheck(@RequestParam String email, @RequestParam String userId) {
    	int result = cService.CidEmailCheck(userId, email);
    	if(result > 0) {
    		return "success";
    	} else {
    		return "fail";    		
    	}
    }
    
    @RequestMapping("idEmailCheck.co")
    @ResponseBody
    public String idEmailCheck(@RequestParam String email, @RequestParam String userId) {
    	int result = cService.idEmailCheck(userId, email);
    	if(result > 0) {
    		return "success";
    	} else {
    		return "fail";    		
    	}
    }
    
    @RequestMapping("mempwdChange.co")
    @ResponseBody
    public String mempwdChange(@RequestParam String userId, @RequestParam String newPwd) {
    	String encPwd = bcryptPasswordEncoder.encode(newPwd);
    	int result = cService.mempwdChange(userId, encPwd);
    	if(result > 0) {
    		return "success";
    	} else {
    		return "fail";    		
    	}
    }
    
    @RequestMapping("conpwdChange.co")
    @ResponseBody
    public String conpwdChange(@RequestParam String userId, @RequestParam String newPwd) {
    	String encPwd = bcryptPasswordEncoder.encode(newPwd);
    	int result = cService.conpwdChange(userId, encPwd);
    	if(result > 0) {
    		return "success";
    	} else {
    		return "fail";    		
    	}
    }
    
    
    
    @RequestMapping("emailCode.co")
    @ResponseBody
    public String emailCode (ModelAndView mv, @RequestParam String email, HttpSession session) throws IOException {
		System.out.println(email);
		
        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "tjswp012@gamil.com";
        String tomail = email; // 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String content =
        
        System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        " 인증번호는 " +dice+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        try {
        	MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        session.removeAttribute("dice");
        session.setAttribute("dice", dice);
        
        String dice2 = String.valueOf(dice);
        return dice2;
	}    
    

}  
    
	
	

