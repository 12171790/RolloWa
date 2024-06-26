package com.br.project.service.chat;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.br.project.dao.chat.ChatDao;
import com.br.project.dao.member.MemberDao;
import com.br.project.dto.chat.ChatMessageDto;
import com.br.project.dto.chat.ChatRoomDto;
import com.br.project.dto.member.MemberDto;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class ChatService {
	private final ChatDao chatDao;
	private final MemberDao memberDao;

	// 채팅방 생성
	public int insertChatRoom(Map<String, Object> map) {
		// 채팅방 생성
		int result1 = chatDao.insertChatRoom(map);
		
		// 채팅방 생성 회원 채팅방 참여목록에 추가
		int result2 = chatDao.insertChatParti(map);
		
		// 채팅방 번호
		if(result1 * result2 > 0) {
			return chatDao.selectSeqCurrVal();
		}		
		return result1 * result2;
	}
	
	// 채팅방 참여인원 생성
	public int insertChatParticipation(Map<String, Object> map) {
		return chatDao.insertChatParti(map);		
	}

	// 최신 채팅방 번호 조회
	public int selectLatestChatRoomNo() {
		return chatDao.selectLatestChatRoomNo();
	}

	// 로그인한 회원의 채팅방 목록 조회
	public List<ChatRoomDto> selectChatRoom(int userNo) {
		return chatDao.selectChatRoom(userNo);
	}
	
	// 채팅 메세지 삽입
	public int insertChatMsg(ChatMessageDto chatMsg) {
		return chatDao.insertChatMsg(chatMsg);
	}

	// 채팅방 참여인원 조회
	public List<MemberDto> selectParticipants(Map<String, Object> map) {
		return memberDao.selectParticipants(map);
	}

	// 채팅 메세지 조회
	public List<ChatMessageDto> selectChatMsg(String roomNo) {
		return chatDao.selectChatMsg(roomNo);
	}

	// 채팅방 접속 날짜 수정
	public int updateChatInDate(Map<String, String> map) {
		return chatDao.updateChatInDate(map);
	}

	// 읽지 않은 메세지 갯수 조회
	public int selectUnreadMsg(Map<String, String> map) {
		return chatDao.selectUnreadMsg(map);
	}

	// 채팅방 나가기
	public int quitChat(Map<String, String> map) {
		return chatDao.quitChat(map);
	}
}
