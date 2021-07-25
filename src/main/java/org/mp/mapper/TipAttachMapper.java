package org.mp.mapper;

import java.util.List;

import org.mp.domain.TipAttachVO;

public interface TipAttachMapper {
	public void insert(TipAttachVO vo);
	public void delete(String uuid);
	public void deleteAll(Long tno);
	public void deleteAttach(Long tno);
	public List<TipAttachVO> findByTno(Long tno);
	public List<TipAttachVO> getOldFiles();
}
