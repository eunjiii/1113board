package org.honeyrock.service;

import java.util.List;

import org.honeyrock.domain.BoardVO;
import org.honeyrock.domain.PageParam;


public interface BoardService {

	public List<BoardVO> getListAll(PageParam pageParam);
	
	public int register(BoardVO board);
	
	public BoardVO read(PageParam pageParam);
	
	public int delete(BoardVO board);
	
	public int modify(BoardVO board);
	
	public int getTotal();
}
