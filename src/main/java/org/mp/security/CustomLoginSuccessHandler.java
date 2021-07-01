package org.mp.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(
			HttpServletRequest request, 
			HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		log.warn("Login Success");
		// 媛�吏�怨� �엳�뒗 沅뚰븳 紐⑸줉 援ы븯湲�
		List<String> roleNames = new ArrayList<>();
		
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		
		log.warn("ROLE NAMES: " + roleNames);
		// 沅뚰븳�뿉 �뵲�씪 �럹�씠吏� 遺꾧린
		if (roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/users/admin");
			return;
		}
		//MEMBER의 권한으로 로그인 되어있는 상태일 땐 mypage로 보냄
		if (roleNames.contains("ROLE_MEMBER")) {
			response.sendRedirect("/users/mypage");
			return;
		}
		
		response.sendRedirect("/");

	}
}
