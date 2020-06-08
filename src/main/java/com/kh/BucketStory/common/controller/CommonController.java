package com.kh.BucketStory.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.BucketStory.common.controller.model.service.CommonService;
import com.kh.BucketStory.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class CommonController {
	
	@Autowired
	private CommonService cService;

	
	//@Autowired private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("login.co")
	public String LoginView() {
		return "login";
	}
	
	@RequestMapping("memberlogin.co")
	public String Login(@ModelAttribute Member m, HttpSession session) {
		Member loginUser = cService.memberLogin(m); 
		session.setAttribute("loginUser", loginUser);
		session.setMaxInactiveInterval(60000);
		return "success";
	}
	
	
	
	// 로그아웃
    @RequestMapping("logout")
    public String logout(HttpSession session) {
        session.setAttribute("userLoginInfo", null);
        return "redirect:login";
    }
    
    // 로그인 처리
	/*
	 * @RequestMapping(value="loginProcess", method = RequestMethod.POST) public
	 * ModelAndView loginProcess(User user, HttpSession session, HttpServletRequest
	 * request) { ModelAndView mav = new ModelAndView();
	 * mav.setViewName("redirect:main");
	 * 
	 * User loginUser = login.findByUserIdAndUserPwd(user.getUsername(),
	 * user.getPassword());
	 * 
	 * if (loginUser != null) { session.setAttribute("userLoginInfo", loginUser); }
	 * return mav; }
	 */
    
	// 로그아웃용 컨트롤러2
		/*
		 * @RequestMapping("logout.me") public String logout(SessionStatus status) {
		 * status.setComplete();
		 * 
		 * return "redirect:home.do"; }
		 * 
		 * // 회원가입
		 * 
		 * @RequestMapping("login.co") public String login() {
		 * 
		 * return "memberJoin";
		 * 
		 * }
		 */
		
	// 암호화 후 로그인
		/* @RequestMapping(value="login.co", method=RequestMethod.POST) 
		 public String memberLogin( Member m, Model model) { System.out.println(m);
		  
		  // MemberService mService = new MemberServiceImpl();
		  System.out.println(mService.hashCode());
		  
		  Member loginUser = mService.memberLogin(m);
		  
		  if(bcryptPasswordEncoder.matches(m.getUserpwd(), loginUser.getUserpwd())) {
			  model.addAttribute("loginUser", loginUser);
			  return "redirect:main.ho";
		  } else {
			  throw new MemberException("로그인 실패! 다시 입력해주세요");
		  }
	  } */
	
	
}
