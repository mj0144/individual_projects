package org.Service;

import org.VO.MemberVO;

public interface MemberService {
	public void memberJoin(MemberVO vo) throws Exception;
	public MemberVO login(MemberVO vo) throws Exception;
	public MemberVO IdCheck(String id) throws Exception;
	public MemberVO readMember(String id) throws Exception;
	public void updateMember(MemberVO member, int add) throws Exception;
}
