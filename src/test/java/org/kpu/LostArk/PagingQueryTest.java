package org.kpu.LostArk;

import java.util.List;

import org.DAO.NpcDAO;
import org.VO.NpcVO;
import org.VO.PageVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class PagingQueryTest {
	
	@Autowired
	private NpcDAO npcDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOTest.class);

	
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
}
