package org.mp.sample;


import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mp.domain.Criteria;
import org.mp.domain.RestVO;
import org.mp.mapper.MemberMapper;
import org.mp.mapper.RestDetailMapper;
import org.mp.mapper.RestMapper;
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
public class RestMapperTest {
	@Setter(onMethod = @__({@Autowired}))
	private RestMapper mapper;
	@Setter(onMethod = @__({@Autowired}))
	private RestDetailMapper mapper2;
	
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
	
	@Test
	public void testread() {
		
		RestVO vo = mapper2.read(1L);
		log.info(vo);
		vo.getDetailList().forEach(RestDetailVO -> log.info(RestDetailVO));
	}
	
}
