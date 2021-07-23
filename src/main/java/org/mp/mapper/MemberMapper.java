package org.mp.mapper;

import org.mp.domain.AuthVO;
import org.mp.domain.MemberVO;

public interface MemberMapper {
	
	//회원가입
	public void insertMember(MemberVO vo);
	public void insertAuth(AuthVO vo);
	
	//회원정보수정
	public void memberUpdate(MemberVO vo);
	
	//로그인
	public MemberVO read(String userId);
	
	//회원탈퇴
	public void delete(String userId);
	
	//아이디 체크
	public int idCheck(String userId) throws Exception;

}