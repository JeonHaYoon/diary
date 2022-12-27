package com.google.service;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberServiceTest {
 
	@Setter(onMethod_ = {@Autowired})
	private MemberService service;
	
	
	//서비스객체가 null인지 먼저 테스트
	//@Test
	public void TestExist() {
		log.info(service);
		assertNotNull(service);
	}
	
	/*
	 * //@Test public void testGetList() {
	 * service.getList().forEach(board->log.info(board)); }
	 */
	@Test
	public void testGet() {
	int check =	service.idcheck("admin99");
	log.info(check);
	}
	
	
}
