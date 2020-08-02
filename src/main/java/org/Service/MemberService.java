package org.Service;

import java.util.Map;

import org.VO.MemberVO;

public interface MemberService {
	public void memberJoin(MemberVO vo) throws Exception;
	public MemberVO login(MemberVO vo) throws Exception;
	public int IdCheck(String id) throws Exception;
	public MemberVO readMember(String id) throws Exception;
	public void updateMember(String writer, boolean add) throws Exception;
}
