package org.mp.service;

import java.util.List;

import org.mp.domain.NoticeVO;
import org.mp.mapper.NoticeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Setter(onMethod_ = {@Autowired})
	private NoticeMapper mapper;
	
	@Override
	public List<NoticeVO> getList() {
		List<NoticeVO> list = mapper.getList();
		return list;
	}
}
