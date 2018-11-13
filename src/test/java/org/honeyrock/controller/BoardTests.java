package org.honeyrock.controller;


import org.honeyrock.domain.BoardVO;
import org.honeyrock.domain.PageParam;
import org.honeyrock.mapper.BoardMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardTests {

	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	@Test
	public void getListAllTests() {
		
		PageParam pageParam = new PageParam();
		log.info(mapper.getListAll(pageParam));
	}
	
	@Test
	public void registerTests() {
		
		BoardVO board = new BoardVO();
		board.setTitle("titleee");
		board.setContent("contenttt");
		board.setWriter("writerrr");
		log.info(mapper.register(board));
	}
	
	@Test
	public void readTests() {
		
		PageParam pageParam = new PageParam();
		pageParam.setBno(10);
		log.info(mapper.read(pageParam));
	}
	
	@Test
	public void modifyTests() {
		
		BoardVO board = new BoardVO();
		board.setBno(37);
		board.setTitle("titleee");
		board.setContent("contenttt");
		board.setWriter("writerrr");
		log.info(mapper.modify(board));
	}
	
	@Test
	public void deleteTests() {
		
		BoardVO board = new BoardVO();
		board.setBno(5);
		log.info(mapper.delete(board));
	}
	
	@Test
	public void Tests() {
		PageParam pageParam = new PageParam();
		pageParam.setType("w");
		pageParam.setKeyword("ÀÛ¼ºÀÚ");
		log.info(mapper.getListAll(pageParam));
		log.info(mapper.count());
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
