package org.honeyrock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.honeyrock.domain.PageParam;
import org.honeyrock.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);
	
	public ReplyVO read(int bno);
	
	public int delete(int bno);
	
	public int update(ReplyVO reply);
	
	public List<ReplyVO> getListWithPaging(
			@Param("page") PageParam page,
			@Param("bno") int bno);
	
	public int getCountByBno(int bno);
}
