package org.Service;

import java.util.List;

import org.DAO.NpcDAO;
import org.VO.MemberVO;
import org.VO.NpcVO;
import org.VO.PageVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class NpcServiceImpl implements NpcService {

	@Autowired
	private NpcDAO npcDAO;
	
	
	public NpcVO readNpc(int npc_num) throws Exception{
		return npcDAO.read(npc_num);
	}
	public void addNpc(NpcVO npc) throws Exception{
		npcDAO.add(npc);
	}
	

	
	
	@Transactional(isolation=Isolation.READ_COMMITTED, timeout=10)
	public void updateNpc(NpcVO npc) throws Exception{
		npcDAO.update(npc);
	}
	
	public int NameCheck(String name) throws Exception{
		return npcDAO.NameCheck(name);
	}

	public void deleteNpc(int npc_num) throws Exception{
		npcDAO.delete(npc_num);
	}
	
	
	//리스트 검색.
	public List<NpcVO> searchNPC(String id) throws Exception{
		return npcDAO.searchNPC(id);
	}
	
	
	//페이징처리
	@Override
	public List<NpcVO> pageList(PageVO vo) throws Exception {
		return npcDAO.pageList(vo);
	}
	
	
	//게시글 전체 갯수
	@Override
	public int countPaging(PageVO vo) throws Exception {
		// TODO Auto-generated method stub
		return npcDAO.countPaging(vo);
	}
	

	
}
