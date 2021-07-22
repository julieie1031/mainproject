package org.mp.service;

import java.util.List;

import org.mp.domain.AuthVO;
import org.mp.domain.Criteria;
import org.mp.domain.MemberVO;
import org.springframework.security.crypto.password.PasswordEncoder;

public interface AdMemberService {
	
	public List<MemberVO> adMemList();
	public int memDelete(String userId);
}
