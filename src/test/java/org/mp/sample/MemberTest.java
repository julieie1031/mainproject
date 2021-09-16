package org.mp.sample;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/*import org.springframework.security.crypto.password.PasswordEncoder;*/
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;



@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"
   ,"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
public class MemberTest {

   private BCryptPasswordEncoder pwencoder;
   private DataSource ds;
   
   public final BCryptPasswordEncoder getPwencoder() {
	   return pwencoder;
   }
   @Autowired
   public final void setPwencoder(BCryptPasswordEncoder pwencoder) {
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
   public void testInsertMember() {
      String sql="insert into members(userid,userpwd,username) values(?,?,?)";
      Connection conn= null;
      PreparedStatement pstmt = null;

      for(int i = 0 ; i < 30 ; i++) {

         try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(2, pwencoder.encode("pw"+i));
            if(i<10) {
               pstmt.setString(1, "user"+i);pstmt.setString(3, "일반 유저"+i);

            }else if(i<20) {
               pstmt.setString(1, "member"+i);pstmt.setString(3, "멤버"+i);
            }else {
               pstmt.setString(1, "admin"+i);pstmt.setString(3, "관리자"+i);
            }
            pstmt.executeUpdate();
         } catch (SQLException e) {}
         finally {if(pstmt!=null) {try {pstmt.close();} catch (SQLException e) {}}
                if(conn !=null) {try {conn.close();} catch (SQLException e) {}}
            }
         }
      }
   
   @Test
   public void testInsertAuth() {
	   String sql = "insert into authorities(userid,authority) values(?,?)";
	   Connection conn = null; PreparedStatement pstmt = null;
	   for(int i = 0; i < 30; i++) {
	   try {
	        conn = ds.getConnection();
	        pstmt = conn.prepareStatement(sql);
	      
	        
	        if(i <10) {
	          
	          pstmt.setString(1, "user"+i);
	          pstmt.setString(2,"ROLE_USER");
	          
	        }else if (i <20) {
	          
	          pstmt.setString(1, "member"+i);
	          pstmt.setString(2,"ROLE_MEMBER");
	          
	        }else {
	          
	          pstmt.setString(1, "admin"+i);
	          pstmt.setString(2,"ROLE_ADMIN");
	          
	        }
	        
	        pstmt.executeUpdate();
	        
	      }catch(Exception e) {
	        e.printStackTrace();
	      }finally {
	  
	        if(pstmt != null) { try { pstmt.close();  } catch(Exception e) {} }
	        if(conn != null) { try { conn.close();  } catch(Exception e) {} }
	        
	      }
	    }//end for
	  }
	 
   }
