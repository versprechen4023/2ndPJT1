package ems.icemile.controller;

import java.lang.reflect.UndeclaredThrowableException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.slf4j.Slf4j;

// 예외처리 컨트롤러 모든 예외처리는 여기서함
@ControllerAdvice
@Slf4j
public class ExceptionController {
	
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(HttpServletRequest request, Exception e) {
		log.debug("예외발생!!! "+e);
		e.printStackTrace();
		
		// 권한 없는 예외라면 권한 없음 페이지(401.jsp)로 이동한다
		if (e instanceof UndeclaredThrowableException) {
			return "redirect:/main/noPermission";
		}
		// 그외의 에러는 500.jsp로 이동한다
		return "redirect:/main/error";
	}
}
