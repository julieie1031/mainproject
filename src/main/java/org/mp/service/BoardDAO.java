package org.mp.service;

public interface BoardDAO {
	// 게시판 조회수
	public void boardHit(Long bno) throws Exception;
}
