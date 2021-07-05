package org.mp.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import javax.servlet.http.HttpSession;

import org.mp.domain.AuthVO;
import org.mp.domain.MemberVO;
import org.mp.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImpl implements MemberService {
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private PasswordEncoder pwencoder;
	
	/*
	 * @Setter(onMethod_=@Autowired) private DataSource ds;
	 */
	
	@Override
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		//bcrypt 암호화
		vo.setUserPwd(pwencoder.encode(vo.getUserPwd()));
		mapper.insertMember(vo);		
	}
	@Override
	public void insertAuth(AuthVO vo) {
		// TODO Auto-generated method stub
		mapper.insertAuth(vo);
		
	}
	@Override
	public void memberUpdate(MemberVO vo, HttpSession session) { 
		mapper.memberUpdate(vo);
		log.info(vo);
	}
	@Override
	public PasswordEncoder getPwencoder() {
		return pwencoder;
	}
}
