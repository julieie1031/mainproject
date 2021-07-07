package org.mp.service;

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

	/*
	  @Override public void memberUpdate(MemberVO vo) {
	  vo.setUserPwd(pwencoder.encode(vo.getUserPwd())); mapper.memberUpdate(vo);
	  log.info(vo); }
	 */
    
	//서비스에서 보낸 파라미터들을 memberUpdate(MemberVO vo)에 담습니다.
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {
		// vo에 담긴 파라미터들은 memberMapper.xml에 memberMapper라는 namespace에 
		// 아이디가 memberUpdate인 쿼리에 파라미터들을 넣어줍니다.
		vo.setUserPwd(pwencoder.encode(vo.getUserPwd()));
		mapper.memberUpdate(vo);
		log.info(vo);
	}
	@Override
	public PasswordEncoder getPwencoder() {
		return pwencoder;
	}
}
