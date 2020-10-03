package org.DAO;

import java.util.List;

import org.VO.BoardVO;
import org.VO.PageVO;


public interface BoardDAO {
	public void write(BoardVO vo) throws Exception;
	public void addAttach(String fullName) throws Exception;
	public List<BoardVO> list() throws Exception;
	public List<BoardVO> limitList(PageVO pagevo) throws Exception;
	public int totalCount() throws Exception;

}
