<%@page import="com.util.HangulConversion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 구현 - [WEB-INF]</title>
</head>
<body>
	게시판 목록 페이지입니다.
	<br /> 
	${name1}
	<br />
	입력한 이름(mem_name)은 
	<%
		out.println("한번 "+request.getAttribute("mem_name"));
		out.println("1.5번 "+HangulConversion.toUTF((String)request.getParameter("mem_name")));
	%>	
	<br/>두번 ${mem_name}
</body>
</html>