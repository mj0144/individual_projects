package org.Service;

import java.util.List;

import org.DAO.NpcDAO;
import org.VO.MemberVO;
import org.VO.NpcVO;
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
	
	public List<NpcVO> readNpcList() throws Exception{
		return npcDAO.readList();
	}
	
	
	@Transactional(isolation=Isolation.READ_COMMITTED, timeout=10)
	public void updateNpc(NpcVO npc) throws Exception{
		npcDAO.update(npc);
	}
	
	public NpcVO NameCheck(String name) throws Exception{
		NpcVO vo = npcDAO.NameCheck(name);
		return vo;
	}

	public void deleteNpc(int npc_num) throws Exception{
		npcDAO.delete(npc_num);
	}
	
	
	//리스트 검색.
	public List<NpcVO> searchNPC(String id) throws Exception{
		return npcDAO.searchNPC(id);
	}
	

	
}
