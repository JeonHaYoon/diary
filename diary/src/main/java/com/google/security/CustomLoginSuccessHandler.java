package com.google.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.jaas.AuthorityGranter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		List<String> roleNames = new ArrayList<String>();
		auth.getAuthorities().forEach(authority ->{
			roleNames.add(authority.getAuthority());
		});
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("diary/admin");
			return;
		}
		if(roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("diary/member");
			return;
		}
		
		response.sendRedirect("/diary");
	}

	
	
}
