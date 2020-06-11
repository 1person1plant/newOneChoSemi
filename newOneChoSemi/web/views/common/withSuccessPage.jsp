<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String msg = (String)session.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("다시 가입하세요.");
		document.location.href="<%=request.getContextPath()%>/index.jsp";
	</script>

	
</body>
</html>