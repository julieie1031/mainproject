package org.mp.service;

import java.util.List;


import org.mp.domain.Criteria;
import org.mp.domain.RestVO;
import org.mp.mapper.RestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RestServiceImpl implements RestService {

	@Autowired
    private RestMapper mapper;
	
	@Override
	public List<RestVO> listRest() {
		// TODO Auto-generated method stub
		return mapper.listRest();	}

	@Override
	public RestVO detailRest(Long restId) {
		// TODO Auto-generated method stub
		return mapper.detailRest(restId);
	}

	@Override
	public List<RestVO> listRestPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.listRestPaging(cri);
	}


}
