package org.honeyrock.service;

import java.util.List;

import org.honeyrock.domain.PageParam;
import org.honeyrock.domain.ReplyPageDTO;
import org.honeyrock.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo);
	
	public ReplyVO get(int rno);
	
	public int modify(ReplyVO vo);
	
	public int remove(int rno);
	
	public List<ReplyVO> getList(PageParam page, int bno);
	
	public ReplyPageDTO getListPage(PageParam page, int bno);
}
