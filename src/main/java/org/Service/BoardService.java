package org.Service;

import java.util.List;

import org.VO.BoardVO;
import org.VO.PageVO;

public interface BoardService {
	public void write(BoardVO vo) throws Exception;
	public List<BoardVO> list() throws Exception;
	public List<BoardVO> limitList(PageVO pagevo) throws Exception;
	public int totalCount() throws Exception;
}
