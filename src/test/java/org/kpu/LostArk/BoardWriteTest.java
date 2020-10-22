package org.kpu.LostArk;

import java.util.ArrayList;
import java.util.List;

import org.DAO.BoardDAOImpl;
import org.VO.BoardVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"  })

public class BoardWriteTest {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardWriteTest.class);
	
	@Autowired
	private BoardDAOImpl boardDAO;

	
	@Test
	public void boardwriteMapper() throws Exception {
		BoardVO vo = new BoardVO();
		vo.setContent("내용");
		vo.setTitle("제목");
		vo.setWriter("작성자");
		List<String> file = new ArrayList<String>();
		file.add("/upload/file1");
		file.add("/upload/file1");
		vo.setImgPath(file);
		
		boardDAO.write(vo);
		
	}


	
	
}
