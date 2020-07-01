package org.Service;

import java.util.List;

import org.VO.NpcVO;

public interface NpcService {
	public NpcVO readNpc(int npc_num) throws Exception;
	public void addNpc(NpcVO npc) throws Exception;
	public List<NpcVO> readNpcList() throws Exception;
	public void updateNpc(NpcVO npc) throws Exception;
	public void deleteNpc(int npc_num) throws Exception;
	public NpcVO NameCheck(String name) throws Exception;

	
	public List<NpcVO> searchNPC(String id) throws Exception;
}
