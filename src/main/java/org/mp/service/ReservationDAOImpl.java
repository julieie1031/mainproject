package org.mp.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mp.domain.ReservationVO;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDAOImpl implements ReservationDAO {

	@Inject
	private SqlSession sqlSession;
	private static String namespace = "org.mp.mapper.ReservationMapper";
	
	@Override
	public void roomInsert(ReservationVO reser) throws Exception {
		sqlSession.insert(namespace+".roomInsert",reser);

	}

	@Override
	public List<ReservationVO> roomList() throws Exception {
		
		return sqlSession.selectList(namespace+".roomList");
	}

}
