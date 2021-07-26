package org.mp.sample;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mp.domain.NoticeVO;
import org.mp.service.NoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class NoticeServiceTest {
	@Setter(onMethod_ = {@Autowired})
	private NoticeService service;
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
		}
	@Test
	public void testReigster() {
		NoticeVO notice = new NoticeVO();
		notice.setUserId("admin4");
		notice.setNoticeTitle("서비스 공지글");
		notice.setNoticeContent("입니다랑");
		
		service.register(notice);
		log.info("생성 번호"+notice.getNno());
	}

}
