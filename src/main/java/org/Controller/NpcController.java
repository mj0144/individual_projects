package org.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.Service.MemberService;
import org.Service.NpcService;
import org.VO.MemberVO;
import org.VO.NpcVO;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller

public class NpcController {
	private static final Logger logger = LoggerFactory.getLogger(NpcController.class);

	@Autowired
	private NpcService npcService;
	@Autowired
	private MemberService memberService;


	
	//목록 뜨위기
	@RequestMapping(value = {"/npc/list"}, method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
    public String listMember(Model model) throws Exception {

    	List<NpcVO> npcs = npcService.readNpcList();
    	
        model.addAttribute("npcs", npcs);
        return "npc/NpcList";
    }
	
	//게시글 정보보기
    @RequestMapping(value = {"/npc/read"}, method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
    public String readMember(@RequestParam("npc_num") int npc_num, Model model) throws Exception {
    	NpcVO npc = npcService.readNpc(npc_num);
    	
        model.addAttribute("npc", npc);
        return "npc/Npc_read";   
    }
    

    
    
    //게시글 등록
	@RequestMapping(value = {"/npc/register"}, method = RequestMethod.GET)
	public String createMemberGet() throws Exception {
		return "npc/Npc_register";
	}
	
	
	///여기서 aop 사용해서 npc_name이랑 npc_register 빈칸 있는지 확인
	@Transactional(propagation=Propagation.REQUIRED, timeout=10)
    @RequestMapping(value = {"/npc/register"}, method = RequestMethod.POST)
	public String createMemberPost(NpcVO nvo, HttpServletRequest request) throws Exception {
    	
		//게시글 등록.
		npcService.addNpc(nvo);
    	
    	//게시글 등록 시, 유저의 post-count증가   	
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		memberService.updateMember(vo, true);
//    	Map<String, Integer> post_counting = new HashMap<String, Integer>();
//    	System.out.println("작성자 : " + vo.getId());
//    	System.out.println("게시글 갯수 : " + vo.getPost_count());
//
//    	post_counting.put("writer", vo.getId());
//    	post_counting.put("post_count", vo.getPost_count());
    	
    	//memberService.updateMember(post_counting, true);
    	
    	return "redirect:/npc/list";
	}
	
    
    ///게시글 등록시 NPC_name 이름 중복 방지
    @ResponseBody
    @RequestMapping(value="/npc/nameCheck", method=RequestMethod.POST)
    public int IdCheckPost(HttpServletRequest request) throws Exception{
    	int result=0; //아이디 중복 여부 (1: 중복, 0: 중복안됨)
    	System.out.println("이름체크");
    	String name=request.getParameter("NPC_name");
   	
    	NpcVO nameCheck = npcService.NameCheck(name);
    	   	
    	if(nameCheck != null) {
    		result = 1;		//이름 중복
        	}
    	return result;
    }
	
  
    
    
    //게시글 수정
    @RequestMapping(value = {"/npc/modify"}, method = RequestMethod.GET)
    public String modifyMemberGet(@RequestParam("npc_num") int npc_num, Model model) throws Exception {
    	
    	NpcVO npc = npcService.readNpc(npc_num);
    	
        model.addAttribute("npc", npc);     
        return "npc/Npc_modify";
    }
    
    
    @RequestMapping(value = {"/npc/modify"}, method = RequestMethod.POST)
    public String modifyMemberPost(NpcVO vo) throws Exception {
    	
    	npcService.updateNpc(vo);

        return "redirect:/npc/list";
    }
    


    
    
    
    //게시글 삭제.
	@Transactional(propagation=Propagation.REQUIRED, timeout=10)
    @RequestMapping(value = {"/npc/delete"}, method = RequestMethod.GET)
    public String deleteMember(@RequestParam("npc_num") int npc_num,  HttpServletRequest request) throws Exception {
  	
    	npcService.deleteNpc(npc_num);
    	
    	//글 등록하면, 회원정보 post_count 증가.    
    	HttpSession session = request.getSession();
    	MemberVO member = (MemberVO) session.getAttribute("member");   	
//    	Map<String, Integer> post_counting = new HashMap<String, Integer>();
//    	post_counting.put(member.getId(), member.getPost_count());
//    	
//    	memberService.updateMember(post_counting, false);
    	memberService.updateMember(member, false);
        return "redirect:/npc/list";
    }
	
	
	
	

}
