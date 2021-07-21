package org.mp.service;

import java.util.List;

import org.mp.domain.AuthVO;
import org.mp.domain.BoardVO;
import org.mp.domain.Criteria;
import org.mp.domain.MemberVO;
import org.mp.domain.ReservationVO;
import org.mp.mapper.MemberMapper;
import org.mp.mapper.ReservationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/*import org.springframework.security.crypto.password.PasswordEncoder;*/
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;
	
	@Setter(onMethod_=@Autowired)
	private BCryptPasswordEncoder pwencoder;
	
	@Setter(onMethod_=@Autowired)
	private ReservationMapper resermapper;
	/*
	 * @Setter(onMethod_=@Autowired) private DataSource ds;
	 */
	
	@Override
	public void insertMember(MemberVO vo) {
		// TODO Auto-generated method stub
		//bcrypt 암호화
		/* vo.setUserPwd(pwencoder.encode(vo.getUserPwd())); */
		mapper.insertMember(vo);		
	}
	@Override
	public void insertAuth(AuthVO vo) {
		// TODO Auto-generated method stub
		mapper.insertAuth(vo);
		
	}
	@Transactional
	@Override
	public void delete(String userId) {
		// TODO Auto-generated method stub
		mapper.delete(userId);		
		log.info("ok");
	}

    
	//서비스에서 보낸 파라미터들을 memberUpdate(MemberVO vo)에 담습니다.
	@Override
	public void memberUpdate(MemberVO vo) {
		// vo에 담긴 파라미터들은 memberMapper.xml에 memberMapper라는 namespace에 
		// 아이디가 memberUpdate인 쿼리에 파라미터들을 넣어줍니다
		log.info("update_ok1");
		/* vo.setUserPwd(pwencoder.encode(vo.getUserPwd())); */
		
		mapper.memberUpdate(vo);
		
	}
	@Override
	public List<ReservationVO> reservationList(String userId) {
		log.info("roomList_ok2");
		return resermapper.reservationList(userId);
	}

	
	@Override
	public BCryptPasswordEncoder getPwencoder() {
		/* return pwencoder; */
		 return new BCryptPasswordEncoder(); 
	}
}
