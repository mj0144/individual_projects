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
import org.VO.PageMakerVO;
import org.VO.PageVO;
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
@RequestMapping("/npc/*")
public class NpcController {
	private static final Logger logger = LoggerFactory.getLogger(NpcController.class);

	@Autowired
	private NpcService npcService;
	@Autowired
	private MemberService memberService;


	

	
	//게시글 정보보기
    @RequestMapping(value = "/Npc_read", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
    public void readMember(@RequestParam("npc_num") int npc_num, 
    		@ModelAttribute("pagevo") PageVO pagevo, 
    		Model model) throws Exception {
   	
        model.addAttribute("npc", npcService.readNpc(npc_num));
    }
    

    
    
    //게시글 등록
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String createMemberGet() throws Exception {
		return "npc/Npc_register";
	}
	
	
	///여기서 aop 사용해서 npc_name이랑 npc_register 빈칸 있는지 확인
	@Transactional(propagation=Propagation.REQUIRED, timeout=10)
    @RequestMapping(value = "/register", method = RequestMethod.POST)
	public String createMemberPost(NpcVO nvo, HttpServletRequest request) throws Exception {
    	
		//게시글 등록.
		npcService.addNpc(nvo);
    	
    	//게시글 등록 시, 유저의 post-count증가   	
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("member");
		memberService.updateMember(vo, true);
    	
    	return "redirect:/npc/list";
	}
	
    
    ///게시글 등록시 NPC_name 이름 중복 방지
    @ResponseBody
    @RequestMapping(value="/nameCheck", method=RequestMethod.POST)
    public int IdCheckPost(String npc_name) throws Exception{   	
    	return npcService.NameCheck(npc_name);
    }
	
  
    
    
    //게시글 수정
    @RequestMapping(value = "/modify", method = RequestMethod.GET)
    public String modifyMemberGet(@RequestParam("npc_num") int npc_num, Model model) throws Exception {
    	
    	NpcVO npc = npcService.readNpc(npc_num);
    	
        model.addAttribute("npc", npc);     
        return "npc/Npc_modify";
    }
    
    
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyMemberPost(NpcVO vo) throws Exception {
    	
    	npcService.updateNpc(vo);

        return "redirect:/npc/list";
    }
    


    
    
    
    //게시글 삭제.
	@Transactional(propagation=Propagation.REQUIRED, timeout=10)
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteMember(@RequestParam("npc_num") int npc_num,  HttpServletRequest request) throws Exception {
  	
    	npcService.deleteNpc(npc_num);
    	
    	//글 등록하면, 회원정보 post_count 증가.    
    	HttpSession session = request.getSession();
    	MemberVO member = (MemberVO) session.getAttribute("member");   	

    	memberService.updateMember(member, false);
        return "redirect:/npc/list";
    }
	
	
	@RequestMapping(value= "/NpcList", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("pagevo")PageVO pagevo, Model model) throws Exception{
		PageMakerVO maker = new PageMakerVO();
			
		maker.setPagevo(pagevo);
		//총 게시물 갯수
		maker.setTotalCount(npcService.countPaging(pagevo));
		List<NpcVO> npcs = npcService.pageList(pagevo);
		
		model.addAttribute("npcs", npcs);
		model.addAttribute("pageMaker", maker);
		
	}
	
	

}
