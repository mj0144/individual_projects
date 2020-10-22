package org.Service;

import java.util.List;

import org.VO.BoardVO;
import org.VO.PageVO;
import org.springframework.web.multipart.MultipartFile;

public interface BoardService {
	public void write(BoardVO vo, List<MultipartFile> files) throws Exception;
	public List<BoardVO> list() throws Exception;
	public List<BoardVO> limitList(PageVO pagevo) throws Exception;
	public int totalCount() throws Exception;
	public BoardVO read(int board_num) throws Exception;
}
