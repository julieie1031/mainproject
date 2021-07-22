package org.mp.service;

import java.util.List;

import org.mp.domain.AuthVO;
import org.mp.domain.Criteria;
import org.mp.domain.MemberVO;
import org.mp.mapper.AdMemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class AdMemberServiceImpl implements AdMemberService {
	
	@Setter
	private AdMemberMapper mapper;
	
	public List<MemberVO> adMemList(){
		return mapper.AdMemList();
	}

	@Override
	public int memDelete(String userId) {
		
		return mapper.memDelete(userId);
	}



}
