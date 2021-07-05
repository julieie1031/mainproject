package org.mp.sample;

import java.util.List;
import java.util.stream.IntStream;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mp.domain.Criteria;
import org.mp.domain.ReviewVO;
import org.mp.mapper.MemberMapper;
import org.mp.mapper.ReviewMapper;
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
public class ReviewMapperTest {
	
	@Setter(onMethod_ = @Autowired) 
	private ReviewMapper mapper;
	
	@Setter(onMethod_ = {@Autowired})
	   private WebApplicationContext ctx;
	   
	@Setter(onMethod_ = {@Autowired})
	   private MemberMapper mapper2;
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
	
	private Long[] renoArr = {1L,2L,3L};
	//삽입
	@Test
	public void testcreate() {
		IntStream.rangeClosed(1, 10).forEach(i-> {
			ReviewVO vo = new ReviewVO(); 
			vo.setRestId(renoArr[i%3]); 
			vo.setReview("리뷰테스트" + i); 
			vo.setReviewer("reviewer" + i); 
			mapper.rinsert(vo); 
		});
	}
	
	//조회
	@Test
	public void testRead() {
		Long targetReno = 2L;
		ReviewVO vo = mapper.rread(targetReno);
		log.info(vo);
	}
	
	//수정
	@Test
	public void testUpdate() {
		Long targetReno = 1L;
		ReviewVO vo = mapper.rread(targetReno);
		vo.setReview("update review");
		int count = mapper.rupdate(vo);
		
		log.info("update count : " + count);
	}
	
	 @Test 
	   public void testList() { 
	      Criteria cri = new Criteria(); 
	      List<ReviewVO> reviews = mapper.rgetListWithPaging(cri, renoArr[0]);
	      reviews.forEach(review ->log.info(review)); 
	      
	 }
	
	
	@Test
	public void testMapper() {
		log.info(mapper);
	}

}
