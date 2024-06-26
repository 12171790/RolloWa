package com.br.project.dto.calendar;


import java.util.List;

import com.br.project.dto.common.GroupDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class CalendarDto {
	private String calNO;
	private String calSort;
	private String calTitle;
	private String calContent;
	private String startDate;
	private String endDate;
	private String place;
	private String color;
	private String status;
	private String emp;
	private String groupCode;
	private String team;// 회사 일정을 등록한 팀
	private GroupDto group;
	private List<CoworkerDto> coworker;
	private String duraDate;
}
