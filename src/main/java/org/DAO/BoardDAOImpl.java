package org.DAO;

import java.util.List;

import org.VO.BoardVO;
import org.VO.PageVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	private static final String namespace = "board";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public void addAttach(String fullName) throws Exception{
		sqlSession.insert(namespace+".addAttach", fullName);
	}
	@Override
	public void write(BoardVO vo) throws Exception{
		sqlSession.insert(namespace+".write", vo);		
	}

	@Override
	public List<BoardVO> list() throws Exception {	
		return sqlSession.selectList(namespace+ ".list");
	}
	
	@Override
	public List<BoardVO> limitList(PageVO pagevo) throws Exception{
		return sqlSession.selectList(namespace+ ".limitList", pagevo);
	}
	
	@Override
	public int totalCount() throws Exception{
		return sqlSession.selectOne(namespace+".totalCount");
	}
	
	
}
