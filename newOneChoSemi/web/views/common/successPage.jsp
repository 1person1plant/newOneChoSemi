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
		alert("정보 수정이 되어 다시 로그인이 필요합니다.");
		document.location.href="<%=request.getContextPath()%>/index.jsp";
	</script>
</body>
</html>