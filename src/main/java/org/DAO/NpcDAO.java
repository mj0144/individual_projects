package org.DAO;

import java.util.List;

import org.VO.NpcVO;

public interface NpcDAO {
	public NpcVO read(String id)throws Exception;
	public List<NpcVO> readList() throws Exception;
	public void add(NpcVO vo) throws Exception;
	public void delete(NpcVO vo) throws Exception;
	public void update(NpcVO vo) throws Exception;
	public NpcVO NameCheck(String name) throws Exception;

	public List<NpcVO> searchNPC(String search) throws Exception;
}
