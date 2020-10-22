package org.Controller;
import java.util.HashMap;
import java.util.Map;

import org.Service.BoardService;
import org.VO.BoardVO;
import org.VO.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/board/*")
public class BoardRestController {
	
	@Autowired
	private BoardService boardService; 
	
	@RequestMapping(value="/{board_num}", method=RequestMethod.GET)
	public ModelAndView read(
			@PathVariable("board_num") int board_num) throws Exception {
		
//		ResponseEntity<Map<String, Object>> entity = null;
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		try {
//			map.put("boardvo", boardService.read(board_num));
//			
//			entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//		ResponseEntity<Map<String, Object>> entity = null;
//		Map<String, Object> map = new HashMap<String, Object>();
//		try {
//			map.pu
//		} catch (Exception e) {
//			// TODO: handle exception
//		}
		ModelAndView mav = new ModelAndView();
		BoardVO boardvo =boardService.read(board_num);
		mav.addObject("boardvo", boardvo);
		mav.setViewName("board/read");
		
		return mav;

	}
}
