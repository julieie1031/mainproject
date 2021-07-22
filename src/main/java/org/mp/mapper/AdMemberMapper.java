package org.mp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mp.domain.AuthVO;
import org.mp.domain.Criteria;
import org.mp.domain.MemberVO;

public interface AdMemberMapper {
	//회원 조회
	public List<MemberVO> AdMemList();
	
	//회원 삭제
	public int memDelete(String userId);
	


}
