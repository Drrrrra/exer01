<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring MVC</title>
</head>
<body>
	<h1>예 약 완 료 !</h1>

	<p>
		${movie} / ${time} / ${seat} / ${person}명
	</p>
	<p style="color:blue">
		예약이 완료되었습니다.
	</p>
</body>
</html>