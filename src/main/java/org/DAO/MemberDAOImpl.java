package org.DAO;

import java.util.Map;

import org.VO.MemberVO;
import org.VO.NpcVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;

	private static final String namespace = "org.kpu.LostArk.mappers.MemberMapper";

	public void join(MemberVO vo) throws Exception { // 가입하기.
		sqlSession.insert(namespace + ".join", vo);
	}

	public MemberVO loginById(MemberVO vo) throws Exception { // 로그인 하기.
		MemberVO membervo = sqlSession.selectOne(namespace + ".loginById", vo);
		return membervo;
	}

	// 아이디 중복 체크
	public int IdCheck(String id) throws Exception { // 가입시 중복아이디 확인.
		return sqlSession.selectOne(namespace + ".idCheck", id);
	}

	public MemberVO read(String id) throws Exception {
		MemberVO vo = sqlSession.selectOne(namespace + ".selectByMember", id);
		return vo;
	}

	
	//게시글 삭제, 게시글 등록 시 작성한게시글  수 count
	public void update(String writer, boolean add) throws Exception {
		if (add == true) {
			sqlSession.insert(namespace + ".addupdate", writer);
		} else if (add == false) {
			sqlSession.insert(namespace + ".deupdate", writer);
		}
	}
}
