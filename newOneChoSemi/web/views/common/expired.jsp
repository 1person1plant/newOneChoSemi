<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>Cho-당신을 위한 반려식물</title>
   <!--타이틀 아이콘-->
   <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath() %>/images/logo.png">
   <style type="text/css">
   body{
       background: #33cc99;
       color:#fff;
       max-height:700px;
       overflow: hidden;
   }
   .c{
       text-align: center;
       display: block;
       position: relative;
       width:80%;
       margin:100px auto;
   }
   .btn{
       background-color: rgb( 255, 255, 255 );
       position: relative;
       display: inline-block;
       width: 158px;
       padding: 5px;
       z-index: 5;
       font-size: 25px;
       margin:0 auto;
       color:#33cc99;
       text-decoration: none;
       margin-right: 10px
   }
   </style>
</head>
<body>
   <div class='c'>
       <h1>정상적인 접근이 아닙니다.</h1>
       <hr>
       <a class='btn' href="<%=request.getContextPath()%>/index.jsp">Home</a>
   </div>
</body>
</html>