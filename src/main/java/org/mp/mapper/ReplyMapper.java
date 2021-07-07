package org.mp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mp.domain.Criteria;
import org.mp.domain.ReplyVO;


public interface ReplyMapper {
	public int insert(ReplyVO vo);
	public ReplyVO read(Long rno); 
	public int delete(Long rno); 
	public int update(ReplyVO replyContent);

	//2개 이상을 전달하기 위해 Map형태를 이용 //별도의 클래스를 이용 //@Param을 이용 -> #{} 사용 가능 
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno); 
	public int getCountByBno(Long bno); 
	
	public int deleteReply(Long bno);


}
