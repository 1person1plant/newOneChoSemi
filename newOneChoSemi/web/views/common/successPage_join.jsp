<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String)request.getAttribute("msg");    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("회원가입이 완료되었습니다. 로그인을 해주세요");
		document.location.href="<%=request.getContextPath()%>/index.jsp";
	</script>
</body>
</html>