package org.aop;


import org.VO.MemberVO;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class MemberAspect {
	@Around("execution(* joinMemberPost(..))")
	public ModelAndView passwdCheck(ProceedingJoinPoint joinPoint) throws Throwable {
	
		 ModelAndView mav = new ModelAndView();
		    
			Object[] param=joinPoint.getArgs();			
			MemberVO vo =(MemberVO) param[0];
			
			String id = vo.getId();
			String passwd = vo.getPasswd();
			String passwdcheck = vo.getPasswdcheck();
			String nickname = vo.getNickname();
			
			
			//빈칸입력시, 알림
			if(id==""||passwd==""||nickname==""||passwdcheck=="") {
				if(id == "") {
		        	mav.setViewName("member/Member_join");
		        	//mav.addObject("focus", "id");
		        	mav.addObject("message", "아이디를 입력해주세요.");
				}else if(nickname=="") {
					mav.setViewName("member/Member_join");
		        	//mav.addObject("focus", "nickname");
		        	mav.addObject("message", "닉네임을 입력해주세요.");
				}else if(passwd==""||passwdcheck=="") {
					mav.setViewName("member/Member_join");
		        	//mav.addObject("focus", "passwd");
		        	mav.addObject("message", "비밀번호를 입력해주세요.");
				}
			}else { //빈칸이 없을 때.
				//'비밀번호'와 '비밀번호 확인'이 일치하는지 			
		        if(passwd.equals(passwdcheck)) { //비번 일치시,
		        	mav = (ModelAndView) joinPoint.proceed();
		        }else {
		        	mav.setViewName("member/Member_join");
		        	mav.addObject("message", "비밀번호가 일치하지 않습니다.");
				}
			}        
    return mav;
	}
}

