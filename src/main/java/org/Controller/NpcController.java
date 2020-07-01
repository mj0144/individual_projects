package org.Controller;

import java.util.List;

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
    public String readMember(@RequestParam("id") String id, Model model) throws Exception {
    	NpcVO npc = npcService.readNpc(id);
    	
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
	public String createMemberPost(@ModelAttribute("npc") NpcVO vo, @RequestParam("writer") String writer /*@RequestParam("post_count") int post_count*/) throws Exception {
    	npcService.addNpc(vo);

    	//글 등록하면, 회원정보 post_count 증가.    	
    	MemberVO member = memberService.readMember(writer);
    	
    	int add= 5;
    	memberService.updateMember(member, add);

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
    public String modifyMemberGet(@RequestParam("id") String id, Model model) throws Exception {
    	
    	NpcVO npc = npcService.readNpc(id);
    	
        model.addAttribute("npc", npc);     
        return "npc/Npc_modify";
    }
    
    
    @RequestMapping(value = {"/npc/modify"}, method = RequestMethod.POST)
    public String modifyMemberPost(@ModelAttribute("npc") NpcVO vo) throws Exception {
    	npcService.updateNpc(vo);

        return "redirect:/npc/list";
    }
    


    
    
    
    //게시글 삭제.
	@Transactional(propagation=Propagation.REQUIRED, timeout=10)
    @RequestMapping(value = {"/npc/delete"}, method = RequestMethod.GET)
    public String deleteMember(@RequestParam("id") String id,  HttpServletRequest request) throws Exception {
    	NpcVO npc = npcService.readNpc(id);    	
    	npcService.deleteNpc(npc);
    	
    	//글 등록하면, 회원정보 post_count 증가.    	
    	HttpSession session = request.getSession();
    	MemberVO memberid = (MemberVO) session.getAttribute("member");   	
    	String writer = memberid.getId();
    	
    	MemberVO member = memberService.readMember(writer);
    	int add= 0;
    	memberService.updateMember(member, add);

        return "redirect:/npc/list";
    }

}
