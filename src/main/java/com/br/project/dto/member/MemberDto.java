package com.br.project.dto.member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class MemberDto {
	
	private int userNo;
	private String userName;
	private String userId;
	private String userPwd;
	private String phone;
	private String postCode;
	private String address;
	private String detailAddress;
	private String totalAddress;
	private String bankAccount;
	private String bank;
	private String email;
	private String profileURL;
	private int countFail;
	private String enrollDate;
	private int enrollUserNo;
	private String modifyDate;
	private int modifyUserNo;
	private String status;
	private int authLevel;
	private int salary;
	private String teamCode;
	private String positionCode;

  	// 호관 작성
	private String department;
	private String team;
	private String position;
	
	private String clockIn;
	private String clockOut;
	private String serviceDate;
	
	private int vacationCount;
	private String vaGivenDate;
	private String vaYearLabor;
	private String vaUsingDate;
	
}
