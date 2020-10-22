package org.Service;

import java.util.List;

import org.DAO.BoardDAOImpl;
import org.Utils.ImageUtil;
import org.VO.BoardVO;
import org.VO.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAOImpl boardDao;
	
	@Autowired
	private ImageUtil imageUtil;
	
	public static final String pattern = "yyyy-MM-dd hh:mm:ss";
	
	
	@Transactional
	public void write(BoardVO vo, List<MultipartFile> files) throws Exception{
		vo.setImgPath(imageUtil.fileUpload(files));
		boardDao.write(vo);
		
		
		
//		String[] files = vo.getFiles();
//		
//		if(files == null) return;
//		
//		for(String fileName : files) {
//			boardDao.addAttach(fileName);
//		}
		
	}
	
	public List<BoardVO> list() throws Exception{
		return boardDao.list();
	}

	@Override
	public List<BoardVO> limitList(PageVO pagevo) throws Exception {
	
		return boardDao.limitList(pagevo);
	}

	@Override
	public int totalCount() throws Exception {
		return boardDao.totalCount();
	}

	@Override
	public BoardVO read(int board_num) throws Exception {
		return boardDao.read(board_num);
	}
	
	
}
