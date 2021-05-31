package org.mp.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.mp.domain.RestVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RestDAOImpl implements RestDAO {

	 @Autowired
	 SqlSession sqlSession;
	
	@Override
	public List<RestVO> listRest() {
		// TODO Auto-generated method stub
		 return sqlSession.selectList("mappers.RestMapper.listRest");
	}

	@Override
	public RestVO detailRest(String restId) {
		// TODO Auto-generated method stub
		 return sqlSession.selectOne("mappers.RestMapper.detailRest", restId);
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
