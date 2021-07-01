package org.mp.service;

import java.util.List;

import org.mp.domain.Criteria;
import org.mp.domain.ReplyPageDTO;
import org.mp.domain.ReplyVO;
import org.mp.mapper.BoardMapper;
import org.mp.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service 
public class ReplyServiceImpl implements ReplyService {
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;

	//트랙잭션을 설정하면 동시에 진행 
	@Transactional
	@Override
	public int register(ReplyVO vo) {
		log.info("register...." + vo);

		boardMapper.updateReplyCnt(vo.getBno(), 1); //댓글 수 1증가
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		log.info("get....." + rno);
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify....." + vo);
		return mapper.update(vo);
	}

	//트랙잭션을 설정하면 동시에 진행 
	@Transactional
	@Override
	public int remove(Long rno) {
		log.info("remove...." + rno);
		ReplyVO vo = mapper.read(rno);

		boardMapper.updateReplyCnt(vo.getBno(), -1); //댓글 수 1감소
		return boardMapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		log.info("get Reply List of a Board......" + bno);
		return mapper.getListWithPaging(cri, bno);
	}

	//댓글과 댓글의 수를 같이 전달하도록 변경

	@Override 
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		log.info(bno + "의 댓글 count 갯수 : " + mapper.getCountByBno(bno)); 
		return new ReplyPageDTO(mapper.getCountByBno(bno), mapper.getListWithPaging(cri, bno));
	}


}