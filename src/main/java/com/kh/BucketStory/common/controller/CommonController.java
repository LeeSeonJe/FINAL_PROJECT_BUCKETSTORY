package com.kh.BucketStory.common.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.kh.BucketStory.common.model.service.CommonService;
import com.kh.BucketStory.common.model.vo.Member;
import com.kh.BucketStory.expert.model.vo.Company;

@SessionAttributes("loginUser")
@Controller
public class CommonController {
	
	@Autowired // 의존성 주입
	private CommonService cService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("login.co")
	public String LoginView() {
		return "login";
	}
	
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
    @RequestMapping("companylogin.co")
	public String companyLogin(@ModelAttribute Company c, Model model) {
		Company loginCompany = cService.companyLogin(c); 
		
		if(bcryptPasswordEncoder.matches(c.getCoPwd(), loginCompany.getCoPwd())) {
			model.addAttribute("loginCompany", loginCompany);
			return "redirect:main.ho?menuNum=1&category=0";
		} else {
			return "redirect:login.co";
		}
	}
    
    @RequestMapping()
    public String CompanyInsert(@ModelAttribute Company c, @RequestParam("uploadFile") MultipartFile uploadFile,
    							HttpServletRequest request) {
    	
    	
    	
    	if(uploadFile != null && !uploadFile.isEmpty()) {
    		String mveb = saveFile(uploadFile, request);
    		
    		if(mveb != null) {
    			c.setCheckImg(mveb);
    		}
    	}
    	
		/* int result = cService.insertCompany(c); */
    	String returnValue = "";
    	
		/*
		 * if(result > 0) { returnValue = "redirect:login.co"; } else {
		 * System.out.println("실패"); }
		 */
    	
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
    
    
    
}
    
	
	

