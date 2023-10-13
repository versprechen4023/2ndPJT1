package ems.icemile.handler;

import javax.naming.NoPermissionException;
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

public class AccessHandler {

		// ProceedingJoinPoint를 사용하기위한 before+after Around어노테이션 선언
		// 세션 검증의 대상은 Department 어노테이션이 명시된 메서드가된다
		@Around("@annotation(ems.icemile.annotation.Department)")
		// 인사관련 권한 제어
		// ProceedingJoinPoint 를 통해 메서드를 제어한다
		public Object DepartmentCheck(ProceedingJoinPoint joinPoint) throws Throwable {
			// 세션핸들러는 컨트롤러가아니므로 외부에서 세션을 가져온다
		    HttpSession session = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
		    // 권한을 가져온다
		    String role = (String)session.getAttribute("emp_role");
		    // 첫번째 권한(인사)이 없으면 예외를 던진다
		    if (role.substring(0, 1).equals("0")) {
		    	log.debug("인사 권한 없음");
		    	throw new NoPermissionException("인사 권한이 없습니다");
		    }
		    
		    // 권한이 있는 경우 기존의 메서드를 그대로 실행한다
		    return joinPoint.proceed();
		}// end DepartmentCheck
		
		// ProceedingJoinPoint를 사용하기위한 before+after Around어노테이션 선언
		// 세션 검증의 대상은 Business 어노테이션이 명시된 메서드가된다
		@Around("@annotation(ems.icemile.annotation.Business)")
		// 영업관련 권한 제어
		// ProceedingJoinPoint 를 통해 메서드를 제어한다
		public Object BusinessCheck(ProceedingJoinPoint joinPoint) throws Throwable {
			// 세션핸들러는 컨트롤러가아니므로 외부에서 세션을 가져온다
			HttpSession session = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
			// 권한을 가져온다
			String role = (String)session.getAttribute("emp_role");
			// 두번째 권한(영업)이 없으면 예외를 던진다
			if (role.substring(0, 1).equals("1")) {
				log.debug("영업 권한 없음");
				throw new NoPermissionException("영업 권한이 없습니다");
			}
				    
			// 권한이 있는 경우 기존의 메서드를 그대로 실행한다
			return joinPoint.proceed();
		}// end BusinessCheck
		
		// ProceedingJoinPoint를 사용하기위한 before+after Around어노테이션 선언
		// 세션 검증의 대상은 Production 어노테이션이 명시된 메서드가된다
		@Around("@annotation(ems.icemile.annotation.Production)")
		// 생산관련 권한 제어
		// ProceedingJoinPoint 를 통해 메서드를 제어한다
		public Object ProductionCheck(ProceedingJoinPoint joinPoint) throws Throwable {
			// 세션핸들러는 컨트롤러가아니므로 외부에서 세션을 가져온다
			HttpSession session = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
			// 권한을 가져온다
			String role = (String)session.getAttribute("emp_role");
			// 세번째 권한(생산)이 없으면 예외를 던진다
			if (role.substring(0, 1).equals("2")) {
				log.debug("생산 권한 없음");
				throw new NoPermissionException("생산 권한이 없습니다");
			}
						    
			// 권한이 있는 경우 기존의 메서드를 그대로 실행한다
			return joinPoint.proceed();
		}// end ProductionCheck
		
		// ProceedingJoinPoint를 사용하기위한 before+after Around어노테이션 선언
		// 세션 검증의 대상은 Logistics 어노테이션이 명시된 메서드가된다
		@Around("@annotation(ems.icemile.annotation.Logistics)")
		// 물류 권한 제어
		// ProceedingJoinPoint 를 통해 메서드를 제어한다
		public Object LogisticsCheck(ProceedingJoinPoint joinPoint) throws Throwable {
			// 세션핸들러는 컨트롤러가아니므로 외부에서 세션을 가져온다
			HttpSession session = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
			// 권한을 가져온다
			String role = (String)session.getAttribute("emp_role");
			// 네번째 권한(물류)이 없으면 예외를 던진다
			if (role.substring(0, 1).equals("3")) {
				log.debug("물류 권한 없음");
				throw new NoPermissionException("물류 권한이 없습니다");
			}
								    
			// 권한이 있는 경우 기존의 메서드를 그대로 실행한다
			return joinPoint.proceed();
		}// end LogisticsCheck
		
}// end AccessHandler
