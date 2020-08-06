package org.kpu.LostArk;


import org.DAO.MemberDAO;
import org.VO.MemberVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class MemberDAOTest {

	private static final Logger logger = LoggerFactory.getLogger(MemberDAOTest.class);

	@Autowired
	private MemberDAO memberDAO;
	
	
	@Test
	public void testReadbyId() throws Exception{
		MemberVO vo;
		vo = memberDAO.read("min");
		logger.info(vo.toString());
	}
	
}

