package org.security;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.access.AccessDeniedHandler;


public class MemberAccessDeniedHandler implements AccessDeniedHandler {
	private static final Logger logger = LoggerFactory.getLogger(MemberAuthenticationProvider.class);

	@SuppressWarnings("deprecation")
	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			
		AccessDeniedException accessDeniedException) throws IOException, ServletException {
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	        if (auth != null) {
	        	logger.info("User: " + auth.getName() + " attempted to access the protected URL: " + request.getRequestURI());
	        }
	        response.setContentType("text/html;charset=UTF-8");
	        //request.setAttribute("msg", "잘못된 접근입니다.");

	        String msg = URLEncoder.encode("잘못된 접근입니다", "UTF-8");

	       
	        response.sendRedirect(request.getContextPath() + "/npc/NpcList?msg="+msg);
	        
	        
		
	}

}
