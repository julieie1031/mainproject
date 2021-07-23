package org.mp.sample;


import static org.junit.Assert.assertNotNull;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mp.domain.BoardVO;
import org.mp.domain.Criteria;
import org.mp.mapper.BoardMapper;
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
public class BoardMapperTest {
	@Setter(onMethod = @__({@Autowired}))
	private BoardMapper mapper;
	private BoardService service;
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper Membermapper;
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
		mapper.getList().forEach(board->log.info(board));
	}
	
	
	
	@Test
	public void testInsert() {
		BoardVO board = new BoardVO();
		board.setUserId("작성자 02");
		board.setTitle("새로 작성");
		board.setContent("새로 작성한 내용");
		board.setHit(2);
		
		
		mapper.insert(board);
		
		log.info(board);
	}
	
	@Test
	public void testRead() {
		BoardVO board = mapper.read(4L);
		log.info(board);
	}
	
	@Test
	public void testDelete() {
		log.info("DELETE COUNT : " + mapper.delete(3L));
	}
	
	@Test
	public void testUpdate() {
		BoardVO board = new BoardVO();
		board.setBno(5L);
		board.setUserId("수정된 아이디");
		board.setTitle("수정된 제목");
		board.setContent("수정된 내용");
		
		int count = mapper.update(board);
		log.info("UPDATE COUNT : " + count);
	}
	
	@Test
	public void testExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		//3개씩 5페이지
		cri.setPageNum(3);
		cri.setAmount(5);
		
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board->log.info(board));
	}
	
	@Test
	public void testPaging1() {
		
		List<BoardVO> list = mapper.getHitList();
		list.forEach(board->log.info(board));
	}
	
	@Test
	public void testSearch() {
		Criteria cri = new Criteria();
		cri.setKeyword("11233");
		cri.setType("W");
		List<BoardVO> list = mapper.getListWithPaging(cri);
		list.forEach(board->log.info(board));
	}
}
