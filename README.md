#  [ Project ] RolloWa
***

## :sparkles: [ Summary ]
> 놀이공원 운영을 위한 효율적인 그룹웨어 서비스 <br>
> 출/퇴근, 매출 현황, 비품 관리부터 전자결재, 일정 및 채팅까지 다양한 기능을 통해 업무를 간편하게 관리할 수 있습니다.

## :date: [ Develop Date ]
> <p>$\large{2024.04.08\ ~ \ 2024.06.07}$</p>
> 1주 차 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 요구사항 제안 및 문서화 <br>
> 2 ~ 3주 차 : 기능 분석 및 DB설계       <br>
> 4 ~ 5주 차 : html 및 화면 구성        <br>
> 5 ~ 8주 차 : 기능 구현                <br>
> 9주 차 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 기능 테스트  <br>

[PPT : https://www.notion.so/6f82052c952b487c83cab947dab2f65f](https://docs.google.com/presentation/d/1dv7Br13IOE09YON_pPn6MN_0A58Ti5bdaWc-CMmNPjI/edit?hl=ko#slide=id.g2e2a7122927_1_230)


## 🧑🏻‍💻 [ Contribute ]
> - <p>$\bf{\color{#5882FA} 배기웅 : 로그인, 마이페이지, 알림, 채팅}$</p>
> - 이예찬 : 부서일정, 회사 일정, 휴가 신청, 휴가 결재, 이용권결제
> - 김호관 : 조직관리, 구성원관리, 예약관리
> - 유가림 : 메인페이지, 게시판, 어트랙션, 이용권매출
> - 이문희 : 전자결재, 이용권결제


## :four_leaf_clover: [ Stack ]
<div>
  <img src="https://img.shields.io/badge/HTML5-E34F26?logo=html5&logoColor=white" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/CSS3-1572B6?logo=css3&logoColor=white" height="30px"> 				&nbsp;
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=black" height="30px"> 		&nbsp;
  <img src="https://img.shields.io/badge/jQuery-0769AD?logo=jquery&logoColor=white" height="30px"> 			<br><br>
  <img src="https://img.shields.io/badge/Java11-007396?logo=OpenJDK&logoColor=white" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/Oracle-F80000?logo=oracle&logoColor=white" height="30px"> 			<br><br> 
  <img src="https://img.shields.io/badge/VScode-007ACC?logo=visualstudiocode&logoColor=white" height="30px">  &nbsp;
  <img src="https://img.shields.io/badge/spring-6DB33F?logo=spring&logoColor=white" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/github-181717?logo=github&logoColor=white" height="30px"> 			&nbsp;	<br><br> 
  <img src="https://img.shields.io/badge/bootstrap5-7952B3?logo=bootstrap&logoColor=black" height="30px"> 		&nbsp;
  <img src="https://img.shields.io/badge/maven-C71A36?logo=apachemaven&logoColor=black" height="30px"> 			&nbsp; <br><br>
</div>

***


## ⚙️ [ Functions ]

### 1. [ 로그인 ]
> fullcalendar 이용해서 부서별로 일정과 휴가를 <b>년도, 월, 주, 일별</b>로 조회가 가능합니다. 		<br>
> 각 일정의 상세 정보는 iziModal이라는 <b>외부 CSS</b> 이용하여 보여주고 있습니다. 				<br>
> 일정 등록 시에는 input의 값을 초기화 현재 날짜, 시간으로 이틀 차이가 나도록 초기화하고 있으며  	<br>
> 종일 버튼을 이용하여 <b>오늘 날짜의 12시간이</b> 차이가 나도록 되어있습니다. 				<br>
> 단, 사용자가 이전 날짜가 더욱 큰 값으로 일정 등록시 알림창을 통해 알려주며 일정이 등록되지 않습니다.  <br>
> 회월별 검색은 <b>로그인된 회원이</b> 가장 왼쪽에 배치되며 자신이 속한 팀원이 조회 됩니다.			<br>
> 조회된 회원이 일정이 없을 경우 알림창을 통해 사용자에게 알려 주고 있습니다.				<br>

#### 1-1. 아이디 찾기
> 처음 페이지 이동 시 1년 동안의 일정 정보를 ajax을 사용해서 DB에서 조회해 오며 fullcalendar의 event 속성값을 이용해 data을 		<br>
> 저장하고 있습니다. 각 저장된 data는 iziModal에서 제공하는 opening매서드를 사용하여 각 모달의 input 및 teatarea에 value값으로		<br>
> 초기화되고 있습니다.														<br>
> 모달의 정보를 수정하고 수정 버튼을 클릭 시 <b>ajax의 serialize를</b> 이용하여 데이터를 전달 및 db에 저장합니다.				<br>
> 수정 후 function에 정의해둔 ajax을 이용해 다시 한번 변경된 일정을 조회합니다.							<br>

> ![부서일정_등록수정](https://github.com/leeyechanbal/RolloWa/assets/153481748/2dac44ba-9921-4d93-8db2-b65038e44ff3)
#### 1-2 비밀번호 찾기

#### 1-3 보안

### 2. 마이페이지

#### 2-1. 프로필 이미지 변경

#### 2-3. 비밀번호 변경

### 3. 알림

#### 3-1. 부서 공지사항 등록 시 알림

#### 3-2. 부서 일정 등록 시 알림

### 4. 채팅

***

### ❔ Retrospect
- 내가 기능적으로 부족했던 부분	<br>
      
- 협업에서 부족한 부분		<br>




