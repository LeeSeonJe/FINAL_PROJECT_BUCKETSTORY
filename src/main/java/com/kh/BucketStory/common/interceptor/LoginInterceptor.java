package com.kh.BucketStory.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.BucketStory.member.model.vo.Member;



public class LoginInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		super.afterCompletion(request, response, handler, ex);
	}
}
