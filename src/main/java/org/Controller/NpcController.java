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
import org.security.MemberUserDetail;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
    	PageMakerVO maker = new PageMakerVO();
		
		maker.setPagevo(pagevo);
		model.addAttribute("pageMaker", maker);
        model.addAttribute("npc", npcService.readNpc(npc_num));
    }
    

    
    
    //게시글 등록
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String createMemberGet() throws Exception {
		return "npc/Npc_register";
	}
	
	
    @RequestMapping(value = "/register", method = RequestMethod.POST)
	public String createMemberPost(NpcVO nvo, HttpServletRequest request, String writer, Authentication authentication) throws Exception {
    	MemberUserDetail userDetail = (MemberUserDetail) authentication.getPrincipal();
    	//현재로그인한 유저의 아이디.
    	nvo.setWriter(userDetail.getUsername());
		//게시글 등록.
		npcService.addNpc(nvo);
    	
    	//게시글 등록 시, 유저의 post-count증가   	
		memberService.updateMember(writer, true);
    	
    	return "redirect:/npc/NpcList";
	}
	
    
    ///게시글 등록시 NPC_name 이름 중복 방지
    @ResponseBody
    @RequestMapping(value="/nameCheck", method=RequestMethod.POST)
    public int IdCheckPost(String npc_name) throws Exception{   	
    	return npcService.NameCheck(npc_name);
    }
	
  
    
    
    //게시글 수정
    //url과 뷰이름이 같으므로 void
    @RequestMapping(value = "/Npc_modify", method = RequestMethod.GET)
    public void modifyMemberGet(@RequestParam("npc_num") int npc_num,
    		@ModelAttribute("pagevo") PageVO pagevo,
    		Model model) throws Exception {
    		
        model.addAttribute("npc", npcService.readNpc(npc_num)); 
        model.addAttribute("pagevo", pagevo);
    }
    
    
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyMemberPost(NpcVO vo, 
    		PageVO pagevo,
    		RedirectAttributes attr) throws Exception {
    	
    	npcService.updateNpc(vo);
    	attr.addAttribute("page", pagevo.getPage());
    	attr.addAttribute("perPageNum", pagevo.getPerPageNum());
    	attr.addAttribute("msg", "수정되었습니다");
    	

        return "redirect:/npc/NpcList";
    }
    


    
    
    
    //게시글 삭제.
	@Transactional(propagation=Propagation.REQUIRED, timeout=10)
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String deleteMember(@RequestParam("npc_num") int npc_num,
    		PageVO pagevo,
    		String writer,
    		RedirectAttributes attr) throws Exception {
  	
    	npcService.deleteNpc(npc_num);
    	//게시글 작성 수 -1
    	memberService.updateMember(writer, false);
    	attr.addAttribute("page", pagevo.getPage());
    	attr.addAttribute("perPageNum", pagevo.getPerPageNum());
    	attr.addAttribute("msg", "삭제되었습니다");
    	
        return "redirect:/npc/NpcList";
    }
	
	
	@RequestMapping(value= "/NpcList", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("pagevo")PageVO pagevo, Model model, String msg, HttpSession session) throws Exception{
		PageMakerVO maker = new PageMakerVO();
			
		maker.setPagevo(pagevo);
		//총 게시물 갯수
		maker.setTotalCount(npcService.countPaging(pagevo));
		List<NpcVO> npcs = npcService.pageList(pagevo);

		model.addAttribute("npcs", npcs);
		model.addAttribute("pageMaker", maker);
		model.addAttribute("member", session.getAttribute("member"));
		if(msg != null) {
			model.addAttribute("msg", msg);
		}
		
	}
	
	

}
