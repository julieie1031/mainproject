package org.mp.service;

import java.util.List;

import org.mp.domain.CriteriaNotice;
import org.mp.domain.NoticeVO;



public interface NoticeService {
	public void register(NoticeVO notice);
	public NoticeVO get(Long nno);
	public boolean modify(NoticeVO notice);
	public boolean remove(Long nno);
	public List<NoticeVO> getList(CriteriaNotice cri);
	public List<NoticeVO> getList();
	public int getTotal(CriteriaNotice cri);
	
}
