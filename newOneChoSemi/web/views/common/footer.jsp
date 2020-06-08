<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
</head>
<body>
    <!-- footer start -->
    <div class="container py-5">
        <div class="row">
            <div class="col-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor"
                    stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="d-block mb-2" role="img"
                    viewBox="0 0 24 24" focusable="false">
                    <title>일분일초</title>
                    <circle cx="12" cy="12" r="10" />
                    <path d="M14.31 8l5.74 9.94M9.69 8h11.48M7.38 12l5.74-9.94M9.69 16L3.95 6.06M14.31 16H2.83m13.79-4l-5.74 9.94" />
                </svg>
                <p>일분일초</p>
                <small class="d-block mb-3 text-muted">&copy; 2020-2022</small>
            </div>
            <div class="col-5">
                <h5>Features</h5>
                <ul class="list-unstyled text-small">
                    <li><a class="text-muted" href="#">Cool stuff</a></li>
                    <li><a class="text-muted" href="#">Random feature</a></li>
                    <li><a class="text-muted" href="#">Team feature</a></li>
                    <li><a class="text-muted" href="#">Stuff for developers</a></li>
                    <li><a class="text-muted" href="#">Another one</a></li>
                    <li><a class="text-muted" href="#">Last time</a></li>
                </ul>
            </div>

            <div class="col-4">
                <h5>Site Map</h5>
                <ul class="list-unstyled text-small">
                    <li><a class="text-muted" href="#">Hanging</a></li>
                    <li><a class="text-muted" href="#">Plant</a></li>
                    <li><a class="text-muted" href="#">FAQ</a></li>
                </ul>
            </div>
            <div class="col-1">
                <h5>About</h5>
                <ul class="list-unstyled text-small">
                    <li><a class="text-muted" href="<%=request.getContextPath() %>/views/aboutus/aboutUs.jsp">Team</a></li>
                    <li><a class="text-muted" href="#">Notice</a></li>
                </ul>
            </div>
        </div>
    </div><!-- footer end -->
</body>
</html>