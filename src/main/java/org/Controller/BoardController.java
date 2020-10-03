package org.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.Service.BoardService;
import org.Service.BoardServiceImpl;
import org.Utils.ImageUtil;
import org.Utils.MediaUtils;
import org.VO.BoardVO;
import org.VO.PageMakerVO;
import org.VO.PageVO;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	//servlet-context.xml에서 등록한 업로드할 경로 C:\\infoproject\\boardImg.
	@Autowired
	private String uploadPath;
	@Autowired
	private BoardService boardService;
	
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class); 

	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String read() {
		return "board/read";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.GET)
	public String write() {
		return "board/write";
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String board_write(@ModelAttribute("boardvo")BoardVO boardvo, Principal principal) throws Exception {
		boardvo.setWriter(principal.getName());
		boardService.write(boardvo);
		return "board/list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void list(Model model, @ModelAttribute("pagevo") PageVO pagevo) throws Exception{
		PageMakerVO maker = new PageMakerVO();
		maker.setPagevo(pagevo);
		
		//보여지는 페이지에 뽑힐 게시글 리스트.
		List<BoardVO> boardvo = boardService.limitList(pagevo);
		
		//총게시물 개수 설정 및 페이지 계산.
		maker.setTotalCount(boardService.totalCount());
		
		model.addAttribute("pageMaker", maker);
		model.addAttribute("boardvo", boardvo);	
	}
	
	
	@RequestMapping("/imageUpload")
	@ResponseBody
	public void uploadeImageFile(
			@RequestParam("file") MultipartFile file, 
			HttpServletRequest request) throws Exception {
		
		logger.info("originalName : " + file.getOriginalFilename());
		logger.info("size : "+ file.getSize());
		logger.info("contentType : " + file.getContentType());
		
		
		
		
	}
	
}
	
	

