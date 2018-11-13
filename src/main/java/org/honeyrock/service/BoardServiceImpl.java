package org.honeyrock.service;

import java.util.List;

import org.honeyrock.domain.BoardVO;
import org.honeyrock.domain.PageParam;
import org.honeyrock.mapper.BoardMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	private BoardMapper mapper;
	
	@Override
	public List<BoardVO> getListAll(PageParam pageParam) {
		
		return mapper.getListAll(pageParam);
	}

	@Override
	public int register(BoardVO board) {
		
		return mapper.register(board);
	}

	@Override
	public BoardVO read(PageParam pageParam) {
		
		return mapper.read(pageParam);
	}

	@Override
	public int delete(BoardVO board) {
		
		return mapper.delete(board);
	}

	@Override
	public int modify(BoardVO board) {
		
		return mapper.modify(board);
	}

	@Override
	public int getTotal() {
		
		return mapper.count();
	}

	

}
