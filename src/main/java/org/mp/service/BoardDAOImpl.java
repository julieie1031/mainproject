package org.mp.service;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sqlSession;

	@Override
	public void boardHit(Long bno) throws Exception {
		sqlSession.update("boardMapper.boardHit", bno);
		
	}
}
