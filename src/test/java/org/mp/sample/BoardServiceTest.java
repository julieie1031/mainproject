package org.mp.sample;


import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mp.domain.BoardVO;
import org.mp.domain.Criteria;
import org.mp.mapper.MemberMapper;
import org.mp.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
	,"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class BoardServiceTest {
	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper mapper;
	private PasswordEncoder pwencoder;
	private DataSource ds;
	
	
	
	   public final PasswordEncoder getPwencoder() {
		   return pwencoder;
	   }
	   @Autowired
	   public final void setPwencoder(PasswordEncoder pwencoder) {
	   this.pwencoder = pwencoder;
	   }
	   public final DataSource getDs() {
		   return ds;
	   }
	   @Autowired
	   public final void setDs(DataSource ds) {
		   this.ds = ds;
	   }
	
	   
	@Test
	public void testGetList() {
		/* service.getList().forEach(board->log.info(board)); */
		service.getList(new Criteria(2,5)).forEach(board -> log.info(board));
	}
	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setUserId("새 작성자");
		board.setTitle("새 제목");
		board.setContent("새 내용");
		service.register(board);
		log.info("생성된 게시물의 번호 : " + board.getBno());
	}
	@Test
	public void testGet() {
		log.info(service.get(6L).getTitle());
	}
	@Test
	public void testUpdate() {
		BoardVO board = service.get(6L);	
		if(board==null) {
			return;
		}
		board.setTitle("제목 수정 from Service");
		log.info("MODIFY RESULT : " + service.modify(board));
	}
	@Test
	public void testDelete() {
		log.info("REMOVE RESULT : " + service.remove(6L));
	}
	
	@Test
	public void testGetHitList() {
		service.getHitList().forEach(board -> log.info(board));
	}
}
