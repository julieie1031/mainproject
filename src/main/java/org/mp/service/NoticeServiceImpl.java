package org.mp.service;

import java.util.List;

import org.mp.domain.BoardVO;
import org.mp.domain.CriteriaNotice;
import org.mp.domain.NoticeVO;
import org.mp.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NoticeServiceImpl implements NoticeService{
	@Setter(onMethod_ = @Autowired)
	private NoticeMapper mapper;
	

	@Override
	public NoticeVO get(Long nno) {
		log.info("get...."+nno);
		return mapper.read(nno);
	}
	@Transactional 
	@Override
	public void register(NoticeVO notice) {
		log.info("regi...."+notice);
		mapper.insertSelectkey(notice);
	}
	@Transactional 
	@Override
	public boolean modify(NoticeVO notice) {
		log.info("mo....."+notice);
		return mapper.update(notice) ==1;
	}
	@Transactional 
	@Override
	public boolean remove(Long nno) {
		log.info("remove....."+nno);
		return mapper.delete(nno) == 1;
	}
	@Override
	public List<NoticeVO> mainNotice() {  
		return mapper.mainNotice();     
	}

	@Override
	public List<NoticeVO> getList(CriteriaNotice cri) {
	log.info("getList...."+cri);
		return mapper.getListWithPaging(cri);
	}
	@Override
	public int getTotal(CriteriaNotice cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}
	@Override
	public List<NoticeVO> getList() {
	log.info("getList....");
		return mapper.getList();
	}

}
