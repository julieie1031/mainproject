package org.mp.service;

import java.util.List;


import org.mp.domain.RestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RestServiceImpl implements RestService {

	@Autowired
    RestDAO restDao;
	
	@Override
	public List<RestVO> listRest() {
		// TODO Auto-generated method stub
		return restDao.listRest();	}

	@Override
	public RestVO detailRest(String restId) {
		// TODO Auto-generated method stub
		return restDao.detailRest(restId);
	}

	@Override
	public void updateRest(RestVO vo) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteRest(int restId) {
		// TODO Auto-generated method stub

	}

}
