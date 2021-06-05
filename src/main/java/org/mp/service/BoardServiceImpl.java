package org.mp.service;

import java.util.List;


import org.mp.domain.BoardVO;
import org.mp.domain.Criteria;
import org.mp.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService{
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	
	@Override
	public BoardVO get(Long bno) {
		log.info("get.....");
		return mapper.read(bno);
	}
	@Override
	public void register(BoardVO board) {
		log.info("register....." + board.getBno());
		mapper.insertSelectkey(board);
	}
	@Override
	public boolean modify(BoardVO board) {
		log.info("modyfi...." + board);
		return mapper.update(board)==1;
	}
	@Override
	public boolean remove(Long bno) {
		log.info("remove...." + bno);
		return mapper.delete(bno)==1;
	}
	@Override
	public List<BoardVO> getList(Criteria cri) {
		log.info("get List with criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}
	@Override
	public boolean plusHit(Long bno) {
		return mapper.plusHit(bno);
	}
	
	
}
