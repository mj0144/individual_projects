package org.Service;

import org.DAO.MemberDAO;
import org.VO.MemberVO;
import org.VO.NpcVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	public void memberJoin(MemberVO vo) throws Exception{
		memberDAO.join(vo);
	}
	
	public MemberVO login(MemberVO vo) throws Exception{
		return memberDAO.loginById(vo);
	}
	
	public MemberVO IdCheck(String id) throws Exception{
		MemberVO vo = memberDAO.IdCheck(id);
		return vo;
	}
	

	public MemberVO readMember(String id) throws Exception{
		return memberDAO.read(id);
	}
	
	public void updateMember(MemberVO member, int add) throws Exception{
		memberDAO.update(member, add);
	}
	
	
	
}
