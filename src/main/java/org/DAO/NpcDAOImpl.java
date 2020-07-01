package org.DAO;

import java.util.ArrayList;
import java.util.List;

import org.VO.MemberVO;
import org.VO.NpcVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NpcDAOImpl implements NpcDAO {	
	
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "org.kpu.LostArk.mappers.NpcMapper";

	
	
	public NpcVO read(int npc_num)throws Exception{
		NpcVO vo = sqlSession.selectOne(namespace+".selectByNpc", npc_num);
		return vo;
	}
	
	public List<NpcVO> readList() throws Exception{
		List<NpcVO> npclist = new ArrayList<NpcVO>();
		npclist = sqlSession.selectList(namespace + ".selectAll");	
		return npclist;
	}
	
	public void add(NpcVO vo) throws Exception{
		sqlSession.insert(namespace+".insert", vo);
		
	}
	public void delete(int npc_num) throws Exception{
		sqlSession.delete(namespace+".delete", npc_num);
		
	}
	public void update(NpcVO npc) throws Exception{
		sqlSession.update(namespace+".update", npc);
		
	}

	
	public NpcVO NameCheck(String name) throws Exception{ //가입시 중복아이디 확인.
		NpcVO npcvo = sqlSession.selectOne(namespace+".IsCheck", name);
		return npcvo;
	}
	
	public List<NpcVO> searchNPC(String search) throws Exception{
		List<NpcVO> npclist = new ArrayList<NpcVO>();

		npclist= sqlSession.selectList(namespace+".search", search);
		return npclist;
	}
	
}
