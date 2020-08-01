package org.DAO;

import java.util.List;

import org.VO.NpcVO;
import org.VO.PageVO;

public interface NpcDAO {
	public NpcVO read(int npc_num)throws Exception;
	public void add(NpcVO vo) throws Exception;
	public void delete(int npc_num) throws Exception;
	public void update(NpcVO npc) throws Exception;
	
	//이름 중복확인
	public int NameCheck(String name) throws Exception;

	public List<NpcVO> searchNPC(String search) throws Exception;
	
	//페이징 처리
	public List<NpcVO> pageList(PageVO vo) throws Exception;
	
	//페이징 처리를 위한 게시글 총 갯수
	public int countPaging(PageVO vo) throws Exception;
}
