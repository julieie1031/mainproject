package org.mp.mapper;

import java.util.List;

import org.mp.domain.BoardAttachVO;

//BoardAttachMapper의 경우는 첨부파일의 수정이라는 개념이 존재하지 않기 때문에, insert()와 delete() 작업만을 처리한다 
//특정 게시물의 번호로 첨부파일을 찾는 작업이 필요하므로 findByBno() 메서드를 정의한다
public interface BoardAttachMapper {
	public void insert(BoardAttachVO vo);
	public void delete(String uuid);
	public List<BoardAttachVO> findByBno(Long bno);
	public void deleteAll(Long bno);
	public void deleteAttach(Long bno);
	public List<BoardAttachVO> getOldFiles();
}
