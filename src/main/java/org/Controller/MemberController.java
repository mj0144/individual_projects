package org.Controller;


import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.Service.MemberService;
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

public class MemberController {
	@Autowired
	private MemberService memberService;

	
	//회원가입.
	@RequestMapping(value = {"/member/join"}, method = RequestMethod.GET)
	public String joinMemberGet() throws Exception {
		return "member/Member_join";
	}
	
	
    @RequestMapping(value = {"/member/join"}, method = RequestMethod.POST)
	public ModelAndView joinMemberPost(@ModelAttribute("member") MemberVO vo) throws Exception {
    	System.out.println("rrr");
    	memberService.memberJoin(vo);
		ModelAndView mav = new ModelAndView();
    	mav.setViewName("member/Member_login");  	
		return mav;
	}
    
    

    //가입 시 아이디 중복확인.
    @ResponseBody
    @RequestMapping(value="/member/idCheck", method=RequestMethod.POST)
    public int IdCheckPost(HttpServletRequest request) throws Exception{
    	int result=0; //아이디 중복 여부 (1: 중복, 0: 중복안됨)
    	String id=request.getParameter("id");
   	
    	MemberVO idCheck = memberService.IdCheck(id);
    	   	
    	if(idCheck != null || id =="") {
    		result = 1;		//아이디 중복 또는 아이디 입력안했을 시.
        	}
    	return result;
    }
    
    //로그인
    @RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String loginGet() throws Exception {
    	System.out.println("login");
		return "member/Member_login";
	}

	@RequestMapping(value= "/member/login", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO member, RedirectAttributes attr, HttpServletRequest requset, HttpServletResponse response) throws Exception{
		ModelAndView mview = new ModelAndView();
		System.out.println(member.getId());
		MemberVO memberVO = memberService.login(member);
		HttpSession session = requset.getSession();
		System.out.println("kkk");
	
		if(memberVO != null) {
			session.setAttribute("member", memberVO);
			session.setAttribute("islogin", true);  //로그인 상태.
			mview.setViewName("npc/NpcList");
		}else { //실패시 
			mview.addObject("result", "fail");
			mview.setViewName("member/Member_login");
		}
		return mview;
	}
	
	
	
	
	//로그아웃
	@RequestMapping(value= {"/member/logout"}, method=RequestMethod.GET)
	public ModelAndView logout(HttpServletResponse response, HttpServletRequest request) throws Exception{

		HttpSession session = request.getSession();
		ModelAndView mview = new ModelAndView();

		session.removeAttribute("member");
		session.removeAttribute("islogin");
		
		mview.setViewName("redirect:/npc/list");
		
		return mview;
	}
	
    @RequestMapping(value = {"/member/read"}, method = RequestMethod.GET)
    public String readMember(@RequestParam("id") String id, Model model) throws Exception {
    	MemberVO member = memberService.readMember(id);
    	
        model.addAttribute("member", member);
        return "member/Member_read";   
    }
	
}
