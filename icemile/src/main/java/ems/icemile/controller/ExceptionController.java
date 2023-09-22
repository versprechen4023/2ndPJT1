package ems.icemile.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.slf4j.Slf4j;

// 예외처리 컨트롤러 모든 예외처리는 여기서함
@ControllerAdvice
@Slf4j
public class ExceptionController {
	
	@ExceptionHandler(Exception.class)
	public void exceptionHandler(Exception e) {
		log.debug("예외발생!!! "+e);
	}
}
