package ems.icemile.controller;

import java.lang.reflect.UndeclaredThrowableException;

import javax.naming.NoPermissionException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.slf4j.Slf4j;

// 예외처리 컨트롤러 모든 예외처리는 여기서함
@ControllerAdvice
@Slf4j
public class ExceptionController {
	
	// 발생되는 모든 예외를 제어한다
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e) {
		log.debug("예외발생!!! "+e);
		e.printStackTrace();
		
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
} // end class
