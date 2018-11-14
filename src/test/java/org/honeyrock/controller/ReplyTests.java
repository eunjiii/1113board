package org.honeyrock.controller;


import java.util.List;
import java.util.stream.IntStream;

import org.honeyrock.domain.PageParam;
import org.honeyrock.domain.ReplyVO;
import org.honeyrock.mapper.ReplyMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReplyTests {

	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	private int[] bnoArr = {4052, 4051, 4050, 4049, 4048};
	
	@Test
	public void testList() {
		
		
		PageParam page = new PageParam();
		
		List<ReplyVO> replies = mapper.getListWithPaging(page, bnoArr[0]);
		
		replies.forEach(reply->log.info(reply));
		
	}
	
	@Test
	public void testUpdate() {
		
		int targetRno = 10;
		
		ReplyVO vo = mapper.read(targetRno);
		
		vo.setReply("Update Reply");
		
		int count = mapper.update(vo);
		
		log.info("UPDATE COUNT: " + count);
		
	}
	
	@Test
	public void testDelete() {
		
		int targetRno = 1;
		
		mapper.delete(targetRno);
		
	}
	
	@Test
	public void testRead() {
		
		int targetRno = 5;
		
		ReplyVO vo = mapper.read(targetRno);
		
		log.info(vo);
		
	}
	
	@Test
	public void testCreate() {
		
		IntStream.rangeClosed(1, 10).forEach(i->{
			
			ReplyVO vo = new ReplyVO();
			
			vo.setBno(bnoArr[i%5]);
			vo.setReply("´ñ±ÛÅ×½ºÆ®"+i);
			vo.setReplyer("replyer"+i);
			
			mapper.insert(vo);
			
		});
		
	}
	
	@Test
	public void testMapper() {
		
		log.info(mapper);
		
	}
	
}
