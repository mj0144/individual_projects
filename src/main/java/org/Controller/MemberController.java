package org.Controller;


import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.Service.MemberService;
import org.Service.NpcService;
import org.VO.MemberVO;
import org.VO.NpcVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/member/*")
public class MemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private NpcService npcService;
	
	//회원가입.
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String joinMemberGet() throws Exception {
		return "member/Member_join";
	}
	
	
    @RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinMemberPost(@ModelAttribute("member") MemberVO vo) throws Exception {
    	memberService.memberJoin(vo);	
		return "member/Member_login";
	}
    
    

    //가입 시 아이디 중복확인.
    @ResponseBody
    @RequestMapping(value="/idCheck", method=RequestMethod.POST)
    public int IdCheckPost(String id) throws Exception{   	
    	return memberService.IdCheck(id);
    }
    
    //로그인
    @RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet(String msg, Model model) throws Exception {
    	model.addAttribute("msg", msg);

		return "member/Member_login";
	}

	@RequestMapping(value= "/login", method=RequestMethod.POST)
	public String login(@ModelAttribute("member") MemberVO member, 
			HttpServletRequest requset,
			Model model) throws Exception{
		MemberVO memberVO = memberService.login(member);
		HttpSession session = requset.getSession();

	
		if(memberVO != null) {
			session.setAttribute("member", memberVO);
			session.setAttribute("islogin", true);  //로그인 상태.
	    	
			return "redirect:/npc/NpcList";
			
		}else { //실패시 
			model.addAttribute("result", "fail");
			return "redirect:/member/login"; //앞에 '/'빠지면 안돼.
		}

	}
	
	
	
	
	//로그아웃
	@RequestMapping(value= "/logout", method=RequestMethod.POST)
	public String logout(HttpServletRequest request, RedirectAttributes rt) throws Exception{

/*		HttpSession session = request.getSession();

		session.removeAttribute("member");
		session.removeAttribute("islogin");*/
		
		rt.addAttribute("msg", "로그아웃되었습니다");
		
		return "redirect:/member/login";
	}
	
    @RequestMapping(value = "/read", method = RequestMethod.GET)
    public String readMember(@RequestParam("id") String id, Model model) throws Exception {
    	MemberVO member = memberService.readMember(id);
    	
        model.addAttribute("member", member);
        return "member/Member_read";   
    }
	
}
