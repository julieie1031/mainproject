package org.mp.sample;


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mp.domain.Criteria;
import org.mp.domain.RestVO;
import org.mp.mapper.RestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class RestMapperTest {
	@Setter(onMethod = @__({@Autowired}))
	private RestMapper mapper;
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		//3개씩 5페이지
		cri.setPageNum(3);
		cri.setAmount(5);
		
		List<RestVO> list = mapper.listRestPaging(cri);
		list.forEach(rest->log.info(rest.getRestId()));
		
	}

	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		//3개씩 5페이지
		cri.setKeyword("멍멍");
		cri.setType("N");
		
		List<RestVO> list = mapper.listRestPaging(cri);
		list.forEach(rest->log.info(rest));
		
	}
	
}
