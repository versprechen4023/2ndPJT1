package ems.icemile.handler;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Aspect // AOP 클래스 정의 어노테이션 선언
@Component // 스프링 빈 정의를 위한 컴포넌트 어노테이션 선언

// 세션 제어를 위한 AOP 세션핸들러
public class SessionHandler {
	
	// ProceedingJoinPoint를 사용하기위한 before+after Around어노테이션 선언
	// 세션 검증의 대상은 모든 Controller 파일이된다
	// 단 UnUseAOP 어노테이션이 명시된 메서드는 제외한다
	// execution 으로 대상이 될 포인트컷을 명시한다
	@Around("execution(* ems.icemile.controller..*Controller.*(..)) " +
            "&& !@annotation(ems.icemile.annotation.UnUseAOP)")
	
	// ProceedingJoinPoint 를 통해 메서드를 제어한다
	public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable {
	    
		// 세션핸들러는 컨트롤러가아니므로 외부에서 세션을 가져온다
	    HttpSession session = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
	    // 세션의 emp_num이 null 이라면 로그인 정보가 없으므로 로그인 페이지로 이동한다
	    if (session.getAttribute("emp_num") == null) {
	    	log.debug("세션에 로그인 정보 없음 로그인 페이지 이동");
	    	return "redirect:/member/login";
	    }
	    
	    // 로그인되어 있는 경우 기존의 메서드를 그대로 실행한다
	    return joinPoint.proceed();
	} // end loginCheck
}// end SessionHandler
