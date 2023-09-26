package ems.icemile.handler;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.HashSet;
import java.util.Set;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/chat")
@Slf4j
public class ChatHandler extends TextWebSocketHandler {
	
	private static Set<WebSocketSession> sessions = new HashSet<>();
    
	// 웹소켓 커넥션이 연결되었을때 호출되는 메서드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.debug("{} 연결됨", session.getId());
		sessions.add(session);
	}
	
	// 클라이언트로 부터 텍스트 메시지를 받았을때 호출되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		log.debug("{}로 부터 {} 받음", session.getId(), message.getPayload());
        // 메세지 받기
		String msg = message.getPayload();
		for (WebSocketSession s : sessions) {
            if (s.isOpen()) {
                s.sendMessage(new TextMessage(msg));
            }
        }
		
	}
	
	// 웹소켓이 종료되었을때 호출되는 메서드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.debug("{} 연결 끊김.", session.getId());
	}
}
