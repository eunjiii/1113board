package org.honeyrock.service;

import java.util.List;

import org.honeyrock.domain.PageParam;
import org.honeyrock.domain.ReplyPageDTO;
import org.honeyrock.domain.ReplyVO;
import org.honeyrock.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(int rno) {

		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {

		return mapper.update(vo);
	}

	@Override
	public int remove(int rno) {

		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(PageParam page, int bno) {
		
		return mapper.getListWithPaging(page, bno);
	}
}
