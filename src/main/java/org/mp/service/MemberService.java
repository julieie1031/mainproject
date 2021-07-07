package org.mp.service;

import org.mp.domain.AuthVO;
import org.mp.domain.MemberVO;
import org.springframework.security.crypto.password.PasswordEncoder;

public interface MemberService {
	public void insertMember(MemberVO vo);
	public void insertAuth(AuthVO vo);
	public void memberUpdate(MemberVO vo) throws Exception;
	
	//암호화
	public PasswordEncoder getPwencoder();

}
