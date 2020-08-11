package org.security;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


public class AuthDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	private static final String namespace = "org.kpu.LostArk.mappers.AuthMapper";
	
	
	public MemberUserDetail getUserById(String id) {
		return sqlSession.selectOne(namespace+".userDetailInfo", id);
	}

}
