package com.google.mapper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class MapperTests {
	
	@Setter(onMethod_ = {@Autowired} )
	private PasswordEncoder pwencodder;
	
	@Setter(onMethod_ = {@Autowired} )
	private DataSource ds;
	
	/**
	 * 회원데이터 100개 생성하는 테스트
	 */
	
	//@Test
	public void testInsertMember() {
		String sql = " INSERT INTO member (memberId, memberPw, nickname, region, birth, memberName, email, gender) ";
		sql += " values (?,?,?,?,?,?,?,?) ";
		
		for(int i=0; i<100; i++) {
			Connection conn = null;
			PreparedStatement stmt = null;
			
			try {
				conn = ds.getConnection();
				stmt = conn.prepareStatement(sql);
				
				if(i< 80) {
					stmt.setString(1, "member" + i);
					stmt.setString(2, pwencodder.encode("pw"+i));
					stmt.setString(3, "닉네임"+i);
					stmt.setString(4, "지역"+i);
					stmt.setString(5, "생일"+i);
					stmt.setString(6, "일반사용자"+i);
					stmt.setString(7, "이메일"+i);
					stmt.setString(8, "f");
					
				}else if(i <90) {
					stmt.setString(1, "manager" + i);
					stmt.setString(2, pwencodder.encode("pw"+i));
					stmt.setString(3, "닉네임"+i);
					stmt.setString(4, "지역"+i);
					stmt.setString(5, "생일"+i);
					stmt.setString(6, "운영자"+i);
					stmt.setString(7, "이메일"+i);
					stmt.setString(8, "m");
				}else {
					stmt.setString(1, "admin" + i);
					stmt.setString(2, pwencodder.encode("pw"+i));
					stmt.setString(3, "닉네임"+i);
					stmt.setString(4, "지역"+i);
					stmt.setString(5, "생일"+i);
					stmt.setString(6, "관리자"+i);
					stmt.setString(7, "이메일"+i);
					stmt.setString(8, "m");
				}
				stmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				
					try {
						if(stmt != null) stmt.close();
						if(conn != null) conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
		}
		
	}
	
	/**
	 * 
	 * 생성된 회원에 권한을 넣어주는 것
	 */
	
	@Test
	public void testInsertAuth() {
		String sql = " INSERT INTO member_auth (memberId, auth) ";
		sql += " values (?,?) ";
		
		for(int i=0; i<100; i++) {
			Connection conn = null;
			PreparedStatement stmt = null;
			
			try {
				conn = ds.getConnection();
				stmt = conn.prepareStatement(sql);
				
				if(i< 80) {
					stmt.setString(1, "member" + i);
					stmt.setString(2, "ROLE_USER");
				}else if(i<90) {
					stmt.setString(1, "manager" + i);
					stmt.setString(2, "ROLE_MEMBER");
				}else {
					stmt.setString(1, "admin" + i);
					stmt.setString(2, "ROLE_ADMIN");
				}
				stmt.executeUpdate();
			}catch(SQLException e){
				e.printStackTrace();
			}finally {
				try {
					if(stmt != null) stmt.close();
					if(conn != null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
	}
}
