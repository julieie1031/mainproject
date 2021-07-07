package org.mp.sample;


import java.util.List;
import java.util.stream.IntStream;

import javax.sql.DataSource;

import org.mp.domain.Criteria;
import org.mp.domain.ReplyVO;
import org.mp.mapper.MemberMapper;
import org.mp.mapper.ReplyMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
		,"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class ReplyMapperTest {
	@Setter(onMethod_ = {@Autowired})
	private ReplyMapper replymapper;
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

	//외래키가 걸려있으므로 실제 존재하는 게시물 번호(bno)를 이용해서 테스트를 진행해야 함 
	private Long[] bnoArr = {530L, 531L, 532L, 534L, 533L}; 

	@Test
	public void testMapper() {
		log.info(mapper);
	}


	@Test 
	public void testCreate() { 
		IntStream.rangeClosed(1, 10).forEach(i-> {
			ReplyVO vo = new ReplyVO(); 
			vo.setBno(bnoArr[i%5]); 
			vo.setReplyContent("댓글 테스트" + i); 
			vo.setUserId("replyer" + i); 
			replymapper.insert(vo); 
		}); 
	}

	//댓글의 번호를 이용해서 특정 댓글 조회

	/*
	 * @Test public void testRead() { Long targetRno = 5L; ReplyVO vo =
	 * mapper.read(targetRno); log.info(vo); }
	 */

	//댓글 삭제

	@Test 
	public void testDelete() { 
		Long targetRno = 59L;
		replymapper.delete(targetRno); 
	}

	//댓글 수정


	@Test 
	public void testUpdate() { 
		Long targetRno = 59L; 
		ReplyVO vo = replymapper.read(targetRno); 
		vo.setReplyContent("Update Reply"); 
		int count = replymapper.update(vo); 
		log.info("Update Count : " + count); }


	@Test 
	public void testList() { 
		Criteria cri = new Criteria(); 
		List<ReplyVO>replies = replymapper.getListWithPaging(cri, bnoArr[0]);
		replies.forEach(reply->log.info(reply)); }


	@Test 
	public void testList2() { 
		Criteria cri = new Criteria(1, 5);
		List<ReplyVO> replies = replymapper.getListWithPaging(cri, 530L);
		replies.forEach(reply->log.info(reply)); 
	}




}


