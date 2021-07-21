package org.mp.service;

import java.util.List;

import org.mp.domain.AuthVO;
import org.mp.domain.MemberVO;
import org.mp.domain.ReservationVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/*import org.springframework.security.crypto.password.PasswordEncoder;*/


public interface MemberService {
	public void insertMember(MemberVO vo);
	public void insertAuth(AuthVO vo);
	public void memberUpdate(MemberVO vo);
	public void delete(String userId);
	//암호화
	public BCryptPasswordEncoder getPwencoder();
	public List<ReservationVO> reservationList(String userId);
	

}
