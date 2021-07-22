package org.mp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mp.domain.Criteria;
import org.mp.domain.RestVO;

public interface AdRestMapper {
	//숙소 조회
	public List<RestVO> adRestList();
	
	//숙소 삭제
	public int restDelete(String restId);
	public int restInsert(RestVO vo);
	
}
