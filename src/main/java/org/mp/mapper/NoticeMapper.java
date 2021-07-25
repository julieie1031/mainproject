package org.mp.mapper;

import java.util.List;
import org.mp.domain.CriteriaNotice;
import org.mp.domain.NoticeVO;

public interface NoticeMapper {
	public List<NoticeVO> getList();
	public void insert(NoticeVO notice);
	public void insertSelectkey(NoticeVO notice);
	public NoticeVO read(Long nno);
	public List<NoticeVO> mainNotice();
	public int delete(Long nno);
	public int update(NoticeVO notice);
	public int getTotalCount(CriteriaNotice cri);
	public List<NoticeVO> getListWithPaging(CriteriaNotice cri);
}
