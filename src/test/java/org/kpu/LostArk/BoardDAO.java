package org.kpu.LostArk;

import java.util.List;

import org.Service.BoardService;
import org.VO.BoardVO;
import org.VO.PageVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class BoardDAO {
	
	@Autowired
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAO.class);
	
	
	@Test
	public void testBoardList() throws Exception{
		PageVO pagevo = new PageVO();
		pagevo.setPage(2); //2번째 페이지.
		pagevo.setPerPageNum(5); //해당페이지에서 보여줄 게시글 갯수.

		List<BoardVO> list = boardService.limitList(pagevo);
		
		for(BoardVO e : list) {
			logger.info(e.getBoard_num() + " : " + e.getTitle());
		}
	}
	
	//게시물 등록 테스트
	@Test
	public void testBoardInsert() throws Exception{
		BoardVO vo = new BoardVO();
		
		//vo.setBoard_num(board_num);
		vo.setContent("testContent");
		vo.setTitle("testTitle");
		vo.setWriter("id3");
		boardService.write(vo);
		//logger.info(boardService.register(vo))
	}
	
	@Test
	public void testBoardRead() throws Exception{
		int board_num = 1;
		BoardVO vo = boardService.read(1);
		logger.info(vo.toString());
	}
	
	
}
