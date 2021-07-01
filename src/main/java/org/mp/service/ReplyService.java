package org.mp.service;

import java.util.List;

import org.mp.domain.Criteria;
import org.mp.domain.ReplyPageDTO;
import org.mp.domain.ReplyVO;

public interface ReplyService {
	public int register(ReplyVO vo);
	public ReplyVO get(Long rno);
	public int modify(ReplyVO vo);
	public int remove(Long rno);
	public List<ReplyVO> getList(Criteria cri, Long bno);
	public ReplyPageDTO getListPage(Criteria cri, Long bno); 
}