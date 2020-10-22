package org.kpu.LostArk;

import org.VO.PageMakerVO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })

public class PageVOTest {

	private static final Logger logger = LoggerFactory.getLogger(PageVOTest.class);
	
	@Test
	public void pageVO() {
		PageMakerVO maker = new PageMakerVO();
		//maker.setPagevo(maker.getPagevo());
		logger.info("page : " + maker.getPagevo().getPage());


	}
}
