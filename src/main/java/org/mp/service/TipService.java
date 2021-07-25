package org.mp.service;

import java.util.List;

import org.mp.domain.CriteriaTip;
import org.mp.domain.TipAttachVO;
import org.mp.domain.TipVO;

public interface TipService {
	public void register(TipVO tip);
	public TipVO get(Long tno);
	public boolean modify(TipVO tip);
	public boolean remove(Long tno);
	public List<TipVO> getList(CriteriaTip cri);
	public int getTotal(CriteriaTip cri);	
	public List<TipAttachVO> getAttachList(Long tno);	
	
	
}
