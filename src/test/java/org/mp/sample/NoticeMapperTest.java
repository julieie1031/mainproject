package org.mp.sample;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mp.domain.NoticeVO;
import org.mp.mapper.MemberMapper;
import org.mp.mapper.NoticeMapper;
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
public class NoticeMapperTest {
	@Setter(onMethod = @__({@Autowired}))
	private NoticeMapper mapper;
	
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

	@Test
	public void testGetList() {
		mapper.getList().forEach(notice->log.info(notice));
	}
	
	@Test
	public void testInsert() {
		NoticeVO notice = new NoticeVO();
		notice.setUserId("admin2");
		notice.setNoticeTitle("새로운 공지");
		notice.setNoticeContent("새로운 공지글:");
		
		mapper.insert(notice);
		log.info(notice);
		
	}
	@Test
	public void testInsertSelectkey() {
		NoticeVO notice = new NoticeVO();
		notice.setUserId("admin3");
		notice.setNoticeTitle("새로운 공지+");
		notice.setNoticeContent("새로운 공지글++");
		
		mapper.insertSelectkey(notice);
		log.info(notice);
		
	}
	@Test
	public void testRead() {
		NoticeVO notice = mapper.read(21L);
		log.info(notice);
	}
	@Test
	public void TestDelete() {
		log.info("DELETE COUNT:"+mapper.delete(8L));
	}
	@Test
	public void testUpdate() {
		NoticeVO notice = new NoticeVO();
		notice.setNoticeTitle("수정된 공지사항");
		notice.setNoticeContent("수정수정");
		notice.setNno(9L);
		
		int count = mapper.update(notice);
		log.info("UPDATE COUNT:"+count);
	}
}
