package org.kpu.LostArk;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardRestTest {

	private static final Logger logger = LoggerFactory.getLogger(BoardRestTest.class);
	
	@Test
	public void read() {
		UriComponents uriComponent = UriComponentsBuilder.newInstance()
				.path("board/read")
				.queryParam("page", 1)
				.queryParam("perPageNum", 5)
				.query("1")
				.build();
		
		logger.info(uriComponent.toString());
		
	}
	
}
