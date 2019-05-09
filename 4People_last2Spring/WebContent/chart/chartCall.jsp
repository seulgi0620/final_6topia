<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.3/FileSaver.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-colorschemes@latest/dist/chartjs-plugin-colorschemes.min.js"></script>
<script src="https://unpkg.com/chartjs-plugin-colorschemes@latest/dist/chartjs-plugin-colorschemes.min.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
//선택된 차트 번호, 사용자 아이디를 전역변수로 선언
$(document).ready(function(){ 
	//차트 넘버 로 구분하여 생성 시작
	<c:forEach items="${chartCall}" var="chartCall">
    var ctx = document.getElementById("${chartCall.no}").getContext('2d');  
    var myChart1  = new Chart(ctx, {
        type: "${chartCall.charttype}", 
        data: {
        	labels:  
	        	[${chartCall.label}],   
    		datasets: [
    			{
    				label:"${chartCall.chartname}", 
    				backgroundColor:["red","orange","yellow","green","blue"],  
    				data: [${chartCall.data}]    
    			}
    		]
            
        },
        options: {
        	 legend: {
	        // 이 값이 false일때 차트 크기 작게 조정됨. true일때는 차트 크기 크게 보임.
        	 responsive: false,
        	 //상단 타이틀 부분 안보이게 함.
                 display: false
                 },
             scales: { //X,Y축 옵션
            	 yAxes: [{
                     ticks: {
                         beginAtZero:true,  //Y축의 값이 0부터 시작
                         fontColor:"blacks"
                     }
                 }],
                 xAxes: [{
                	 ticks: {
                	 fontColor:"blacks"
                	 }
                 }]
          } 
            } 
    }); 
    </c:forEach>
});

</script>
<body>
<c:forEach items="${chartCall}" var="chartCall">
<button type="button" id="btn_myChart${chartCall.no}" name="btn_myChart" class="btn btn-default" style="width:250px; height:150px" 
	value="${chartCall.no}">
	<!-- 스크립트문에서 이 넘버와 일치하는 차트 생성됨-->
	<canvas id="${chartCall.no}" ></canvas> 
	 <h4><strong>${chartCall.chartname}</strong></h4>
	</button>
	</c:forEach>
</body>
