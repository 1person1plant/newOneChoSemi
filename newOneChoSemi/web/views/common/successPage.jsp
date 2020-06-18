<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String msg = (String)request.getAttribute("msg");    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Cho-당신을 위한 반려식물</title>
	<!--타이틀 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath() %>/images/logo.png">

</head>
<body>
	<script>
		alert("정보 수정이 되어 다시 로그인이 필요합니다.");
		document.location.href="<%=request.getContextPath()%>/index.jsp";
	</script>
</body>
</html>