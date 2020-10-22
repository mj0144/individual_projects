package org.Service;

import java.util.Map;

import org.DAO.MemberDAO;
import org.VO.MemberVO;
import org.VO.NpcVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;
	
	
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	public void memberJoin(MemberVO vo) throws Exception{
		vo.setPasswd(bcryptPasswordEncoder.encode(vo.getPasswd()));
		memberDAO.join(vo);
	}
	
	public MemberVO login(MemberVO vo) throws Exception{
		return memberDAO.loginById(vo);
	}
	
	public int IdCheck(String id) throws Exception{
		if(id.equals("")) {
			return 2;
		}
		return memberDAO.IdCheck(id);
	}
	
	//글 작성시, 회원의 작성게시물 수 증가. 
	public MemberVO readMember(String id) throws Exception{
		return memberDAO.read(id);
	}
	
	
	public void updateMember(String writer, boolean add) throws Exception{
		memberDAO.update(writer, add);
	}
	
	
	
	
}
