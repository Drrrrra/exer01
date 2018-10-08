<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*" %>
<% 
	
	
%>
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
			비회원 로그인 시 예매 및 예매확인/취소 메뉴만 이용 가능하며 입력한 정보로만 확인가능합니다.<br /> 
			입력한 내용을 꼭 확인해주세요.
		</p>
		<h2>비회원로그인</h2>
		<c:url value="/ticket/auto.do" var="t"/>
		<form action="${t}" method="post">
			<p>
				<input type="text" placeholder="예약자이름" name="name"/>
			</p>
			<p>
				<input type="tel" placeholder="예약자연락처" name="phone"/>
			</p>
			<p>
				
			</p>
			<p>
				<span style="font-size: smaller;">
				비회원 예매서비스 제공을 위한 최소한의 개인정보이며 동의하지 않을 경우 서비스 이용이 제한됩니다.<br/>
				</span>
				<input type="checkbox" style="width: auto;" required/>동의함
			</p>
			<p>
				<button type="submit">로그인</button>
			</p>
		</form>
	</div>
</body>
</html>