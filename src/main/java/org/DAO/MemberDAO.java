package org.DAO;

import org.VO.MemberVO;

public interface MemberDAO {
	public void join(MemberVO vo) throws Exception;
	public MemberVO loginById(MemberVO vo) throws Exception;
	public MemberVO IdCheck(String id) throws Exception; //가입시 중복아이디 확인.
	public MemberVO read(String id)throws Exception;
	public void update(MemberVO member, int add) throws Exception;
}
