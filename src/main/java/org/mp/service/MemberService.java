package org.mp.service;

import org.mp.domain.AuthVO;
import org.mp.domain.MemberVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/*import org.springframework.security.crypto.password.PasswordEncoder;*/


public interface MemberService {
	public void insertMember(MemberVO vo);
	public void insertAuth(AuthVO vo);
	public void memberUpdate(MemberVO vo);
	/* public String memberDelete(String userPwd); */
	public void delete(String userId);
	//암호화
	public BCryptPasswordEncoder getPwencoder();
	/* public MemberVO idCheck(String userId) throws Exception; */
	

}
