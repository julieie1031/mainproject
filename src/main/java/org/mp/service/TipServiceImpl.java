package org.mp.service;

import java.util.List;

import org.mp.domain.CriteriaTip;
import org.mp.domain.TipAttachVO;
import org.mp.domain.TipVO;
import org.mp.mapper.TipAttachMapper;
import org.mp.mapper.TipMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class TipServiceImpl implements TipService{
	@Setter(onMethod_ = @Autowired)
	private TipMapper mapper;
	private TipAttachMapper attachMapper;

	@Override
	public TipVO get(Long tno) {
		log.info("get.....");
		return mapper.read(tno);
	}

	@Transactional 
	@Override
	public void register(TipVO tip) {
		log.info("register....." + tip.getTno());

		mapper.insertSelectkey(tip); 
		if(tip.getAttachList() == null || tip.getAttachList().size() <= 0) { 
			return; 
		}
		tip.getAttachList().forEach(attach ->{ attach.setTno(tip.getTno());
		attachMapper.insert(attach); });

	}	
	@Transactional
	@Override
	public boolean modify(TipVO tip) {
		log.info("modify...." + tip);
		attachMapper.deleteAll(tip.getTno());
		
	    boolean modifyResult = mapper.update(tip)==1;
	    
	      if(modifyResult && tip.getAttachList()!= null && tip.getAttachList().size()>0) {
	    	  tip.getAttachList().forEach(attach-> {
	    		  attach.setTno(tip.getTno());
	    		  attachMapper.insert(attach);
	    	  });
	      }
	      return modifyResult;
	   }
	
	@Transactional 
	@Override
	public boolean remove(Long tno) {
		log.info("remove...." + tno);
		attachMapper.deleteAttach(tno);
		attachMapper.deleteAll(tno);
		return mapper.delete(tno)==1;

	}
	@Override
	public List<TipVO> getList(CriteriaTip cri) {
		log.info("get List with criteria : " + cri);
		return mapper.getListWithPaging(cri);
	}
	@Override
	public int getTotal(CriteriaTip cri) {
		log.info("get total count");
		return mapper.getTotalCount(cri);
	}

	@Override
	public List<TipAttachVO> getAttachList(Long tno) {
		log.info("get Attach list by bno : " + tno);
		return attachMapper.findByTno(tno);
	}

}
