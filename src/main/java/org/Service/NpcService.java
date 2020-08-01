package org.Service;

import java.util.List;

import org.VO.NpcVO;
import org.VO.PageVO;

public interface NpcService {
	public NpcVO readNpc(int npc_num) throws Exception;
	public void addNpc(NpcVO npc) throws Exception;
	public void updateNpc(NpcVO npc) throws Exception;
	public void deleteNpc(int npc_num) throws Exception;
	
	//이름 중복체크
	public int NameCheck(String name) throws Exception;

	
	public List<NpcVO> searchNPC(String id) throws Exception;
	
	
	public List<NpcVO> pageList(PageVO vo) throws Exception;
	
	//페이징 처리를 위한 게시글 총 갯수
	public int countPaging(PageVO vo) throws Exception;
}
