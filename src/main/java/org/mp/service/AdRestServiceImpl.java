package org.mp.service;

import java.util.List;

import org.mp.domain.RestVO;
import org.mp.mapper.AdRestMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class AdRestServiceImpl implements AdRestService {
	
	@Setter
	private AdRestMapper mapper;

	@Override
	public List<RestVO> adRestList() {
		return mapper.adRestList();
	}

	@Override
	public int restDelete(String restId) {
		return mapper.restDelete(restId);
	}

	@Override
	public int restInsert(RestVO vo) {
		// TODO Auto-generated method stub
		return mapper.restInsert(vo);
	}
	
}
