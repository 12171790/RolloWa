package com.br.project.service.notification;

import java.util.List;

import org.springframework.stereotype.Service;

import com.br.project.dao.notification.NotificationDao;
import com.br.project.dto.common.PageInfoDto;
import com.br.project.dto.notification.NotificationDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NotificationService {
	private final NotificationDao nDao;
	
	// 전체 알림 갯수 조회
	public int selectNotiListCount() {
		return nDao.selectNotiListCount();
	}
	
	// 전체 알림 정보 조회
	public List<NotificationDto> selectNoti(PageInfoDto pageInfo) {
		return nDao.selectNoti(pageInfo);
	}

	public int insertNoti(NotificationDto notification) {
		return nDao.insertNoti(notification);
	}

	public int deleteNoti(String notiNo) {
		return nDao.deleteNoti(notiNo);
	}
	
	
}