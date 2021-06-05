package org.mp.mapper;

import java.util.List;

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
	public List<BoardVO> getListWithPaging(Criteria cri);
}
