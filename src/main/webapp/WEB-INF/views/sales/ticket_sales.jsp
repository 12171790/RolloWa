<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>이용권 매출관리</title>
	
	<!-- 이용권 매출관리 스타일 -->
	<link href="${ contextPath }/resources/css/sales/ticket_sales.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">

	<!-- Google Chart API -->
	<script src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>

	<!-- side bar -->
	<jsp:include page="/WEB-INF/views/common/sidebarHeader.jsp" />
	
	<!-- content 추가 -->
    <div class="content p-5">

        <!-- management page start -->
        <div class="sales-management-page">

            <div class="d-flex justify-content-between">
            	<h1 class="page-title">이용권 매출관리</h1>
            	<span class="mt-4 me-5">매출액 단위 : (원)</span>
            </div>

            <!-- main top start(filter) -->
            <div class="main-top">

                <!-- year filter area start -->
                <div class="filter-div year-filter-div">

                    <!-- year select -->
                    <select class="filter-select form-control form-select py-2 fw-bold" id="year-select"></select> 

                    <!-- year sales info -->
                    <div class="filter-table year-sales-table">
                       
                        <div class="d-flex mb-2">
                            <b class="filter-table-title">총 매출액</b>
                            <span class="filter-table-content sum-sales"></span>
                        </div>
                        <div class="d-flex mb-2">
                            <b class="filter-table-title">평균 매출액</b>
                            <span class="filter-table-content avg-sales"></span>
                        </div>
                        <div class="d-flex mb-2">
                            <b class="filter-table-title">최고 매출액</b>
                            <span class="filter-table-content max-sales"></span>
                        </div>
                        <div class="d-flex mb-2">
                            <b class="filter-table-title">최저 매출액</b>
                            <span class="filter-table-content min-sales"></span>
                        </div>
                        
                    </div>

                </div>
                <!-- year filter area end -->

                <!-- month filter area start -->
                <div class="filter-div year-filter-div">

                    <!-- month select -->
                    <select class="filter-select form-control form-select py-2 fw-bold" id="month-select"></select> 

                    <!-- month sales info -->
                    <div class="filter-table month-sales-table">
                        
                        <div class="d-flex mb-2">
                            <b class="filter-table-title">총 매출액</b>
                            <span class="filter-table-content sum-sales"></span>
                        </div>
                        <div class="d-flex mb-2">
                            <b class="filter-table-title">평균 매출액</b>
                            <span class="filter-table-content avg-sales"></span>
                        </div>
                        <div class="d-flex mb-2">
                            <b class="filter-table-title">최고 매출액</b>
                            <span class="filter-table-content max-sales"></span>
                        </div>
                        <div class="d-flex mb-2">
                            <b class="filter-table-title">최저 매출액</b>
                            <span class="filter-table-content min-sales"></span>
                        </div>
                        
                    </div>

                </div>
                <!-- month filter area end -->

                <!-- date filter area start -->
                <div class="filter-div day-filter-div">

                    <!-- date select -->
                    <select class="filter-select form-control form-select py-2 fw-bold" id="date-select"></select> 

                    <!-- date sales info -->
                    <div class="filter-table date-sales-table">
                        
                        <div class="d-flex mb-2">
                            <b class="filter-table-title">총 매출액</b>
                            <span class="filter-table-content sum-sales"></span>
                        </div>
                        <div class="d-flex mb-2">
                            <b class="filter-table-title">평균 매출액</b>
                            <span class="filter-table-content avg-sales"></span>
                        </div>
                        <div class="d-flex mb-2">
                            <b class="filter-table-title">최고 매출액</b>
                            <span class="filter-table-content max-sales"></span>
                        </div>
                        <div class="d-flex mb-2">
                            <b class="filter-table-title">최저 매출액</b>
                            <span class="filter-table-content min-sales"></span>
                        </div>
                        
                    </div>

                </div>
                <!-- date filter area end -->

            </div>
            <!-- main top end(filter) -->

            <!-- main bottom start (chart) -->
            <button type="button" class="btn btn-secondary mb-3 py-2.5 fs-6 fw-bold d-none" id="showMonthlyChart">월별 차트</button>
            <div class="main-bottom d-flex flex-direction-column">
            	
                <div class="sales-chart d-flex justify-content-center" id="sales-chart-div"></div>
                
            </div>
            <!-- main bottom end (chart) -->
        
        </div>
        <!-- mangement page end -->
    
    </div>
    <!-- content 끝 -->
	
	<!-- chat floating -->
	<jsp:include page="/WEB-INF/views/common/sidebarFooter.jsp" />
	
</body>

<!-- 이용권 매출관리 스크립트 -->
<script>
	var today = new Date();
	var sysYear = today.getFullYear();
	var sysMonth = today.getMonth() + 1;
	var sysDate = today.getDate();
	$(document).ready(function(){
		// "년", "월", "일" 옵션값 생성 ==============================================================
		for(let y=sysYear ; y>=2000 ; y--){
			$("#year-select").append("<option value='" + y + "'>" + y + "년</option>");
		}
		
		for(let m=1 ; m<=sysMonth ; m++){
			$("#month-select").append("<option value='" + ((m < 10) ? '0' + m : m ) + "'>" + m + "월</option>");
		}
		for(let d=1 ; d<=sysDate ; d++){
			$("#date-select").append("<option value='" + ((d < 10) ? '0' + d : d ) + "'>" + d + "일</option>");
		}
		
		// 오늘날짜로 선택값 초기화 ====================================================================
		$("#year-select").children("option").each(function(){
			$(this).val() == sysYear && $(this).attr("selected", true);
		});
		$("#month-select").children("option").each(function(){
			$(this).val() == sysMonth && $(this).attr("selected", true);
		});
		$("#date-select").children("option").each(function(){
			$(this).val() == sysDate && $(this).attr("selected", true);
		});
		
		// "년" 선택값이 바뀌었을 경우 ==================================================================
		$("#year-select").on("change", function(){
			let month = ($(this).val() == sysYear) ? sysMonth : 12;
			let oldMonth = $("#month-select").val();
			
			$("#month-select").empty();
			
			for(let m=1 ; m<=month ; m++){
				$("#month-select").append("<option value='" + ((m < 10) ? '0' + m : m ) + "'>" + m + "월</option>");
			}
			
			$("#month-select").children("option").each(function(){
				$(this).val() == oldMonth && $(this).attr("selected", true);
			});
			
			ajaxSelectTicketSalesByTicketType({	// 년도별 매출 데이터 조회
				year: $("#year-select").val(),
				month: '',
				date: '',
			}, $(".year-sales-table"));	
			
			ajaxSelectTicketSalesByTicketType({	// 월별 매출 데이터 조회
				year: $("#year-select").val(),
				month: $("#month-select").val(),
				date: '',
			}, $(".month-sales-table"));
			
			ajaxSelectTicketSalesByTicketType({	// 일별 매출 데이터 조회
				year: $("#year-select").val(),
				month: $("#month-select").val(),
				date:  $("#date-select").val(),
			}, $(".date-sales-table"));	
			
			drawSalesChart(ajaxSelectSalesListForChart({  // 차트생성
				year: $("#year-select").val(),
				chart: 'year',
			}), 'year');
			
		});
		
		// "월" 선택값이 바뀌었을 경우 ==================================================================
		$(document).on("change", "#year-select, #month-select", function(){
			let year = (sysYear - $("#year-select").val() <= 0) ? sysYear :  (sysYear - (sysYear - $("#year-select").val()));
			let month = $("#month-select").val();
			let oldDate = $("#date-select").val();
			let lastDate = (new Date(year, month, 0)).getDate();
			if(year == sysYear && month == sysMonth){
				lastDate = sysDate;
			}
			
			$("#date-select").empty();
			
			for(let d=1 ; d<=lastDate ; d++){
				$("#date-select").append("<option value='" + ((d < 10) ? '0' + d : d ) + "'>" + d + "일</option>");
			}
			
			$("#date-select").children("option").each(function(){
				$(this).val() == oldDate && $(this).attr("selected", true);
			});
			
			ajaxSelectTicketSalesByTicketType({	// 월별 매출 데이터 조회
				year: $("#year-select").val(),
				month: $("#month-select").val(),
				date:  '',
			}, $(".month-sales-table"));	
			
			ajaxSelectTicketSalesByTicketType({	// 일별 매출 데이터 조회
				year: $("#year-select").val(),
				month: $("#month-select").val(),
				date:  $("#date-select").val(),
			}, $(".date-sales-table"));
		});
		
		// "일" 선택값이 바뀌었을 경우
		$("#date-select").on("change", function(){
			ajaxSelectTicketSalesByTicketType({	// 일별 매출 데이터 조회
				year: $("#year-select").val(),
				month: $("#month-select").val(),
				date:  $("#date-select").val(),
			}, $(".date-sales-table"));	
		});
	});
	
	// 이용권 매출정보 관련 ===============================================================================================
	$(document).ready(function(){
		ajaxSelectTicketSalesByTicketType({	// 년도별 매출 데이터 조회
			year: $("#year-select").val(),
			month: '',
			date: '',
		}, $(".year-sales-table"));	
		
		ajaxSelectTicketSalesByTicketType({	// 월별 매출 데이터 조회
			year: $("#year-select").val(),
			month: $("#month-select").val(),
			date: '',
		}, $(".month-sales-table"));
		
		ajaxSelectTicketSalesByTicketType({	// 일별 매출 데이터 조회
			year: $("#year-select").val(),
			month: $("#month-select").val(),
			date:  $("#date-select").val(),
		}, $(".date-sales-table"));	
	});
	
	// 년, 월, 일별 이용권 매출정보 조회 AJAX
	function ajaxSelectTicketSalesByTicketType(params, table){
		$.ajax({
			url: "${ contextPath }/sales/ticket/table.ajax",
			method: "get",
			data: params,
			success: function(salesList){
				let sumSales = 0;
				let avgSales = 0;
				let maxSales = 0;
				let minSales = 0;
				
				for(let i=0 ; i<salesList.length ; i++){
					sumSales += salesList[i].sumSales;
					avgSales += salesList[i].avgSales;
					maxSales += salesList[i].maxSales;
					minSales += salesList[i].minSales;
				}
			
				table.find('.sum-sales').text(sumSales.toLocaleString());
				table.find('.avg-sales').text(avgSales.toLocaleString());
				table.find('.max-sales').text(maxSales.toLocaleString());
				table.find('.min-sales').text(minSales.toLocaleString());
			},error: function(){
				console.log("SELECT TICKET SALES FOR TABLE AJAX FAILED");
			}
		});
	}
	
	// 차트 관련 ==================================================================================================
	$(document).ready(function(){
		// 월별 차트 생성 (default)
		drawSalesChart(ajaxSelectSalesListForChart({	
			year: $("#year-select").val(),
			chart: 'year',
		}), 'year');
		
		// 일별 차트에서 월별 차트로 이동
		$("#showMonthlyChart").on("click", function(){
			drawSalesChart(ajaxSelectSalesListForChart({	
				year: $("#year-select").val(),
				chart: 'year',
			}), 'year');
			
			$(this).addClass('d-none');
		});h
	});
	
	// 매출금액별 차트
	function drawSalesChart(chartData, chartType, month){
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawChart);
		
		function drawChart(){
			// 차트 데이터 설정 (컬럼명, 셀값)
			data = new google.visualization.DataTable();
			data.addColumn('string', '기간');
			data.addColumn('number', chartType == 'year' ? '일반이용권 월별 매출' : '일반이용권 일별 매출');
			data.addColumn('number', chartType == 'year' ? '정기이용권 월별 매출' : '정기이용권 일별 매출');
			data.addColumn('number', chartType == 'year' ? '일반이용권 연평균 매출' : '일반이용권 월평균 매출');
			data.addColumn('number', chartType == 'year' ? '정기이용권 연평균 매출' : '정기이용권 월평균 매출');			
			for(let i=0 ; i<chartData.length ; i+=2){
				nSales = chartData[i];
				sSales = chartData[i+1];
				data.addRow([nSales.period + (chartType == 'year' ? '월' : '일'), nSales.sumSales, sSales.sumSales, nSales.yearAvgSales, sSales.yearAvgSales]);
			}
			
			// 차트 옵션 설정 (제목, 범례 등)
			let options = {
					title: (chartType == 'year') ? '연간 이용권 매출' : month + '월 이용권 매출',
					colors: ['#FFA7A7', '#FFDD73', '#FFA7A7', '#FFDD73'],
					chartArea: {
						right: '50',
						width: '80%',
						height: '80%',
					},
					legend: { 
						position: 'bottom', 
						alignment: 'center', 
					},
					animation:{
						startup:true,
						duration: 1000,
						easing: 'out',
					},
					vAxis: {
						title: '매출액 (단위 : 원)',
						minValue: 0,
						maxValue: 18000
					},
					hAxis: {title: ''},
					seriesType: 'bars',
					series: {
						2: {type: 'line'},
						3: {type: 'line'},
					}
			};
			
			// 차트 그리기
			chart = new google.visualization.ComboChart(document.getElementById('sales-chart-div'));
			chart.draw(data, options);
			
			// 연간 매출차트일 경우에만 부여될 이벤트
			if(chartType == 'year'){
				google.visualization.events.addListener(chart, 'select', selectHandler);
			}
		}
		
		function selectHandler(e){
			let selectedItem = chart.getSelection()[0];
			let selectedValue = data.getValue(selectedItem.row, 0);
			let month = selectedValue.replace('월', '');
			
			drawSalesChart(ajaxSelectSalesListForChart({
				year: $("#year-select").val(),
				chart: 'month',
				month: month,
			}), 'month', month);
			
			$("#showMonthlyChart").removeClass('d-none');
		}
	}
	
	// 월|일 이용권별 총매출액, 평균매출액 조회 AJAX (차트)
	function ajaxSelectSalesListForChart(params){
		let chartData = [];
		$.ajax({
			url: "${ contextPath }/sales/ticket/chart.ajax",
			method: "get",
			data: params,
			async: false,
			success: function(salesList){
				for(let i=0 ; i<salesList.length ; i++){
					chartData.push(salesList[i]);
				}
			},error: function(){
				console.log("SELECT TICKET SALES FOR CHART AJAX FAILED");
			}
		});
		
		return chartData;
	}
	
</script>

</html>