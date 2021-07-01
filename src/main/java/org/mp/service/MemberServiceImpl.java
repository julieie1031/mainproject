package org.mp.service;

import javax.sql.DataSource;

import org.mp.domain.AuthVO;
import org.mp.domain.MemberVO;
import org.mp.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.Setter;

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
		vo.setUserPwd(pwencoder.encode(vo.getUserPwd()));
		mapper.insertMember(vo);		
	}
	@Override
	public void insertAuth(AuthVO vo) {
		// TODO Auto-generated method stub
		mapper.insertAuth(vo);
		
	}
}
