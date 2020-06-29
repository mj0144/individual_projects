package org.aop;
import org.Service.NpcService;
import org.VO.NpcVO;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class NpcAspect {	
	@Around("execution(* createMemberPost(..))")
	public Object InserCheck(ProceedingJoinPoint joinPoint) throws Throwable {	
		Object[] param=joinPoint.getArgs();
		
		NpcVO vo =(NpcVO) param[0];
		String NPC_name = vo.getNPC_name();
		String NPC_region = vo.getNPC_region();
	
        if(NPC_name == "" || NPC_region =="") { //빈칸 확인
            return "redirect:/npc/register";
        }
            Object result = joinPoint.proceed();
            return result;
	}
}



