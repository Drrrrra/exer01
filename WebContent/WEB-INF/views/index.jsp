<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring MVC</title>
<style type="text/css">
	select, input, option  {
		font-size: 13px;
		width: 30%;
		padding: 5pt;
		font-family: 맑은 고딕;	
	}
</style>
</head>
<body>
	<div align="center">
		<h1 style="text-decoration: underline;">Spring MVC Theater</h1>
		<p style="font-size: smaller;">
			예매확인/취소 메뉴만 이용 가능하며 입력한 정보로만 확인가능합니다.<br /> 
			입력한 내용을 꼭 확인해주세요.
		</p>
		<h2>현재상영작</h2>
		<form action="${pageContext.request.contextPath}/ticket/seat.do" id="f">
			<p>
				<select name="movie" onchange="timetableAjax(this);" id="movie">
					<option value="movie">영화를 먼저 선택해주세요.</option>
					<c:forEach var="m" items="${movies }">
						<option value="${m}">${m }</option>
					</c:forEach>		
				</select>
			</p>
			<p>
				<select name="time" id="t">
					<option value="">영화를 먼저 선택해주세요.</option>
				</select>
			</p>
			<p>
				<select name="person" id="">
					<option value="person">예약 인원을 선택해주세요.</option>
					<c:forEach var="p" begin="1" end="3" step="1">
						<option value="${p }">${p }명</option>
					</c:forEach>		
				</select>
			</p>
			<p>
				<button type="submit">예약진행</button>
			</p>
		</form>
		<script>
		document.getElementById("f").onsubmit=function() {
			var m = document.getElemntById("movie").value;
			var t = document.getElemntById("time").value;
			var p = document.getElemntById("person").value;
			if(t=="" || m=="" || c=="")
				return false;	// 이벤트 무효화
		}
		
		/*
			var timetableAjax = function(target) {
				var req = new XMLHttpRequest();
				console.log(target.value);
				req.open("post", "${pageContext.servletContext.contextPath}/ticket/timeAjaxPost.do", true);
				req.onreadystatechange = function() {
					if (this.readyState == 4) {
						var obj = JSON.parse(this.responseText);
						var html = "";
						for (var i = 0; i < obj.length; i++) {
							var f = obj[i] < 10 ? "0" + obj[i] : obj[i];
							html += "<option value=\"h" + f +"\">" + f
									+ ":00</option>";
						}
						document.getElementById("time").innerHTML = html;
					}
				}
				var data = {"title" : target.value };
				req.send(JSON.stringify(data));
			}
		*/	
		
			var timetableAjax = function(target) {
				var req = new XMLHttpRequest();
				console.log(target.value);
				req.open("get","${pageContext.servletContext.contextPath}/ticket/timeAjaxGet.do?title="+target.value,true);
				req.onreadystatechange==function(){
					if(this.readyState==4){
						var resp = JSON.parse(this.responseText);
						var html="";
						for(var i=0; i<resp.length; i++){
							var h = obj[i].TIME/100;
							var m = obj[i].TIME%100;
							html += "<option value=\""+obj[i].TIME+"\">" + h + ":" + m + "</option>";
						}
						document.getElementById("time").innerHTMl = html;
					}
				}
				req.send();
		}
		/* 
			var timetableAjax = function(target){
				var req = new XMLHttpRequest();
				console.log(target.value);
				req.open("get", "${pageContext.servletContext.contextPath}/ticket/part.do?title="+target.value, true);
				req.onreadystatechange=function(){
					if(this.readyState==4){
						var obj = JSON.parse(this.responseText);
						var html="";
						for(var i =0; i<obj.length; i++) {
							/* var f = obj[i] <10 ? "0"+obj[i] :obj[i];  
							html += "<option value=\"h" + obj[i].TIME +"\">"+ obj[i].TIME+":00</option>";
						}
						document.getElementById("time").innerHTML = html;
					}
				}
				req.send();
			}
		*/
		 
		 </script>
	</div>
</body>
</html>