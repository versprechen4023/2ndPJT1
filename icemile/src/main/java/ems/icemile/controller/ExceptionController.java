package ems.icemile.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.slf4j.Slf4j;

@ControllerAdvice
@Slf4j
public class ExceptionController {
	
	@ExceptionHandler(Exception.class)
	public void exceptionHandler(Exception e) {
		log.debug("예외발생!!! "+e);
	}
}
