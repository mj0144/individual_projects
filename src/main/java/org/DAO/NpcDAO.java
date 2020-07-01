package org.DAO;

import java.util.List;

import org.VO.NpcVO;

public interface NpcDAO {
	public NpcVO read(int npc_num)throws Exception;
	public List<NpcVO> readList() throws Exception;
	public void add(NpcVO vo) throws Exception;
	public void delete(int npc_num) throws Exception;
	public void update(NpcVO npc) throws Exception;
	public NpcVO NameCheck(String name) throws Exception;

	public List<NpcVO> searchNPC(String search) throws Exception;
}
