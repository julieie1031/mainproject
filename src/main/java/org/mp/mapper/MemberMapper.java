package org.mp.mapper;

import org.mp.domain.AuthVO;
import org.mp.domain.MemberVO;

public interface MemberMapper {
	public void insertMember(MemberVO vo);
	public void insertAuth(AuthVO vo);
	
	public MemberVO read(String userId);

}