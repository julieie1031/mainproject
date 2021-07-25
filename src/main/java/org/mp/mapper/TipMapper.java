package org.mp.mapper;

import java.util.List;

import org.mp.domain.CriteriaTip;
import org.mp.domain.TipVO;

public interface TipMapper {
	public List<TipVO> getList();
	public void insert(TipVO tip);
	public void insertSelectkey(TipVO tip);
	public TipVO read(Long tno);
	public int delete(Long tno);
	public int update(TipVO tip);
	public int getTotalCount(CriteriaTip cri);
	public List<TipVO> getListWithPaging(CriteriaTip cri);
	
	
}
