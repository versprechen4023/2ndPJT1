package ems.icemile.handler;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/chat")
@Slf4j
public class ChatHandler extends TextWebSocketHandler {
	
	// 웹소켓 커넥션이 연결되었을때 호출되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("커넥션연결됨");
	}
	
	// 클라이언트로 부터 텍스트 메시지를 받았을때 호출되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        log.info("메시지넘어옴");

        TextMessage initialGreeting = new TextMessage("메시지 잘 넘어오나");
        session.sendMessage(initialGreeting);
	}
	
	// 웹소켓이 종료되었을때 호출되는 메서드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

	}
}
