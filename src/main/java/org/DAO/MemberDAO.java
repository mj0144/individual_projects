package org.DAO;

import java.util.Map;

import org.VO.MemberVO;

public interface MemberDAO {
	public void join(MemberVO vo) throws Exception;
	public MemberVO loginById(MemberVO vo) throws Exception;
	public int IdCheck(String id) throws Exception; //가입시 중복아이디 확인.
	public MemberVO read(String id)throws Exception;
	public void update(MemberVO vo, boolean add) throws Exception;
}
