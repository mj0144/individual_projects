package org.Service;

import java.util.List;

import org.VO.NpcVO;

public interface NpcService {
	public NpcVO readNpc(String id) throws Exception;
	public void addNpc(NpcVO npc) throws Exception;
	public List<NpcVO> readNpcList() throws Exception;
	public void updateNpc(NpcVO npc) throws Exception;
	public void deleteNpc(NpcVO npc) throws Exception;
	public NpcVO NameCheck(String name) throws Exception;

	
	public List<NpcVO> searchNPC(String id) throws Exception;
}
