package ems.icemile.controller;

import java.lang.reflect.UndeclaredThrowableException;

import javax.naming.NoPermissionException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;

// 예외처리 컨트롤러 모든 예외처리는 여기서함
@ControllerAdvice
@Slf4j
public class ExceptionController {
	
	// 발생되는 모든 예외를 제어한다
	@ExceptionHandler(Exception.class)
	public Object exceptionHandler(HttpServletRequest request, Exception e) {
		log.debug("예외발생!!! "+e);
		e.printStackTrace();
		
		// 요청이 AJAX인지 확인한다
		if(isAjax(request)) {
			// AJAX에 해당하는 에러를 반환한다
			return ajaxExceptionHandler(e);
		}
		
		// 생성된 예외를 확인한다
		if (e instanceof UndeclaredThrowableException) {
			// 예외의 이유가 NoPermissionException이라면 권한 없음 페이지(401.jsp)로 이동한다
			if(e.getCause() instanceof NoPermissionException) {
				return "redirect:/main/noPermission";
			}
		}
		
		// 그외의 에러는 500.jsp로 이동한다
		return "redirect:/main/error";
		
	} // end exceptionHandler
	
	// AJAX요청에 따른 예외처리 결과값 반환 처리 메서드
	private ResponseEntity<?> ajaxExceptionHandler(Exception e){
		
		// 생성된 예외를 확인한다
		if (e instanceof UndeclaredThrowableException) {
			// 예외의 이유가 NoPermissionException이라면 401 (Unauthorized)권한 없음을 반환한다
			if(e.getCause() instanceof NoPermissionException) {
				return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("No Permission");
			}
		}
		// 그외에는 500(NTERNAL_SERVER_ERRO) 세션없음을 반환한다
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("No login Session");
	} // end ResponseEntity
	
	// 요청이 AJAX인지 확인하는 메서드
	private boolean isAjax(HttpServletRequest request) {
		return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	} // end isAjax
	
} // end class
