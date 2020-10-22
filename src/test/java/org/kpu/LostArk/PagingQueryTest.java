package org.kpu.LostArk;


import java.util.List;

import org.DAO.NpcDAO;
import org.Service.BoardService;
import org.VO.BoardVO;
import org.VO.NpcVO;
import org.VO.PageVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class PagingQueryTest {
	
	@Autowired
	private NpcDAO npcDAO;
	@Autowired
	private BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOTest.class);

	
	
	//페이징 처리 db쿼리 테스트
	@Test
	public void testListPage() throws Exception{
		PageVO vo = new PageVO();
		vo.setPage(2); //2번째 페이지.
		vo.setPerPageNum(5); //해당페이지에서 보여줄 게시글 갯수.
		
		
		List<NpcVO> list = npcDAO.pageList(vo);
		
		for(NpcVO e : list) {
			logger.info(e.getNpc_num() + " : " + e.getNPC_name());
		}
		
	}
	
	
	//UriComponents 테스트
	@Test
	public void testURI() throws Exception {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/npc/read")
				.queryParam("pagevo", 12)
				.queryParam("perPageNum", 20)
				.build();
		logger.info("/npc/read?pagevo=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}
	
	
	@Test
	public void testURI2() throws Exception {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("/{module}/{page}")
				.queryParam("pagevo", 12)
				.queryParam("perPageNum", 20)
				.build()
				.expand("npc", "read")
				.encode();
		logger.info("/npc/read?pagevo=12&perPageNum=20");
		logger.info(uriComponents.toString());
	}
	
	@Test
	public void testBoardURI() throws Exception{
		UriComponents uriComponent = UriComponentsBuilder.newInstance()
				.path("/board/list")
				.queryParam("pagevo", 3)
				.queryParam("perPageNum", 5)
				.build();
		logger.info("/board/list?pagevo=3&perPageNum=5");
		logger.info(uriComponent.toString());
	}
	
	@Test
	public void makeQueryRest() throws Exception {
		UriComponents uriComponents = UriComponentsBuilder.newInstance()
				.path("board")
				.query("1")
				.query("5")
				.build();
		logger.info(uriComponents.toString());
	}
	

	
}
