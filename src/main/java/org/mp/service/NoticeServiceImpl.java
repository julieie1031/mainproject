package org.mp.service;

import java.util.List;

import org.mp.domain.NoticeVO;
import org.mp.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class NoticeServiceImpl implements NoticeService{
	@Setter(onMethod_ = {@Autowired})
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> getList() {
		
		List<NoticeVO> list = mapper.getList();
		log.info(list.size());
		log.info(list.get(0).getNno());
		log.info(list.get(0).getUserId());
		log.info(list.get(0).getNdate());
		log.info(list.get(0).getNtitle());
		
		return list;
	}
}
