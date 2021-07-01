package org.mp.service;

import org.mp.domain.AuthVO;
import org.mp.domain.MemberVO;

public interface MemberService {
	public void insertMember(MemberVO vo);
	public void insertAuth(AuthVO vo);
}
