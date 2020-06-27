package com.kh.BucketStory.main.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.BucketStory.bucket.model.vo.Alarm;
import com.kh.BucketStory.common.model.vo.Member;

@Repository
public class WebSocketHadler extends TextWebSocketHandler{
	private boolean bool;
	
	@Autowired
	SqlSession sqlSession;
	
	//로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
	
	//서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("웹소켓 연결성공");
		sessions.add(session);
		String userId = getUserId(session);
		userSessionsMap.put(userId, session);
		
	}
	//소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		WebSocketSession user2session = userSessionsMap.get("user02");
		WebSocketSession user1session = userSessionsMap.get("user01");
		
		System.out.println("웹소켓 메시지보넀을때");
		//session.sendMessage(new TextMessage("하이"));
		if(message.getPayload() != null) {
			System.out.println(message.getPayload());
			if(user2session != null) {
				user1session.sendMessage(new TextMessage("좋아요눌렀다"));
			}
		}
		
		
		
		
	}
	//연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//System.out.println("afterConnectionClosed " + session + ", " + status);
		userSessionsMap.remove(session.getId());
		sessions.remove(session);
		System.out.println("웹소켓 연결해제");
	}
	//웹소켓 email 가져오기
	private String getUserId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUser = (Member)httpSession.get("loginUser");
		
		if(loginUser != null) {
			return loginUser.getUserId();
		} else {
			return "회원로그인 정보없";
		}
	}
	
}