package com.kh.BucketStory.common.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.BucketStory.common.model.service.CommonService;
import com.kh.BucketStory.common.model.service.MailService;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.Company;

@SessionAttributes({"loginUser", "loginCompany"})
@Controller
public class CommonController {
	
	private MailService mailService;
	
	@Autowired // 의존성 주입
	private CommonService cService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	
	@RequestMapping("login.co")
	public String LoginView() {
		return "login";
	}
	
	// 유저 로그인
	@RequestMapping("memberlogin.co")
	public String Login(@ModelAttribute Member m, Model model) {
		Member loginUser = cService.memberLogin(m); 
		
		if(bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:main.ho?menuNum=1&category=0";
		} else {
			return "redirect:login.co";
		}
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
    
    // 기업 로그인
	
  @RequestMapping("companylogin.co") public String companyLogin(@ModelAttribute Company c, Model model) {
	  Company loginUser = cService.companyLogin(c);
	  System.out.println(loginUser);
  
	  if(bcryptPasswordEncoder.matches(c.getCoPwd(), loginUser.getCoPwd())) {
		  model.addAttribute("loginCompany", loginUser);
		  return "redirect:main.ho?menuNum=1&category=0";
	  } else {
		  System.out.println("실패");
		  return "redirect:login.co";
	  }
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
    @RequestMapping("dupid.co")
	  public void idDuplicateCheck(@RequestParam("id") String id, HttpServletResponse response) {
		  
		  int result = cService.idDuplicateCheck(id);
		 
		  boolean inUsable = result == 0 ? true : false;
		  
		  try {
			  response.getWriter().print(inUsable);
		  } catch (IOException e) {
			  e.printStackTrace();
			  
		  }
	  }
    
 // 회원가입 이메일 인증
    @RequestMapping(value = "sendMail/auth.co", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public boolean sendMailAuth(HttpSession session, @RequestParam String email, @RequestParam String busiEmail) {
        int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
        String joinCode = String.valueOf(ran);
        session.setAttribute("joinCode", joinCode);
 
        String subject = "회원가입 인증 코드 발급 안내 입니다.";
        StringBuilder sb = new StringBuilder();
        sb.append("귀하의 인증 코드는 " + joinCode + " 입니다.");
        return mailService.send(subject, sb.toString(), "pbmin1993@gmail.com", email, null);
    }


 // 비밀번호 찾기
    @RequestMapping(value = "/sendMail/password", method = RequestMethod.POST)
    public String sendMailPassword(HttpSession session, @RequestParam String id, @RequestParam String email, @RequestParam String captcha, RedirectAttributes ra) {
        String captchaValue = (String) session.getAttribute("captcha");
        if (captchaValue == null || !captchaValue.equals(captcha)) {
            ra.addFlashAttribute("resultMsg", "자동 방지 코드가 일치하지 않습니다.");
            return "redirect:/find/password";
        }
 
        Member user = cService.findAccount(email);
        
        if (user != null) {
            if (!user.getUserId().equals(id)) {
                ra.addFlashAttribute("resultMsg", "입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.");
                return "redirect:/find/password";
            }
            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String password = String.valueOf(ran);
            CommonService.updateInfo(user.getUserId(), "password", password); // 해당 유저의 DB정보 변경
 
            String subject = "임시 비밀번호 발급 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
            mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
            ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "redirect:/find/password";
    }


 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
 	
}  
    
	
	

