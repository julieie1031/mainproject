package org.mp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mp.domain.BoardVO;
import org.mp.domain.Criteria;

public interface BoardMapper {
	/* @Select("select * from board where bno > 0") */
	public List<BoardVO> getList();
	public void insert(BoardVO board);
	public void insertSelectkey(BoardVO board);
	public BoardVO read(Long bno);
	public int delete(Long bno);
	public int update(BoardVO board);
	public boolean plusHit(Long bno);
	public int getTotalCount(Criteria cri);
	public List<BoardVO> getListWithPaging(Criteria cri);
	public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
	public List<BoardVO> getReply(Long bno);
	
	//main 게시판 출력
	public List<BoardVO> getHitList();
	
	
}
