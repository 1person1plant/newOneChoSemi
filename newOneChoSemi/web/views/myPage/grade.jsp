<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.*"%>
	<%
	Grade grade = (Grade)request.getAttribute("grade");
	String rank = "";
	String price = "";
	int point = 0;
	String seed = "";
	String sprout = "";
	String branch = "";
	String fruit = "";
	String tree = "";
	String rankImg = "";
	if(grade != null){
		rank = grade.getMemberRank();
		price = String.valueOf(grade.getMemberTotalpurchasemount());
		point = grade.getMemberPoint();
		seed = "images/rank/seed1.png";
		sprout = "images/rank/sprout2.png";
		branch = "images/rank/branch3.png";
		fruit = "images/rank/fruit4.png";
		tree = "images/rank/tree5.png";

		switch(rank){
		case "R1" : rank = "1단계";
		break;
		case "R2" : rank = "2단계";
		break;
		case "R3" : rank = "3단계";
		break;
		case "R4" : rank = "4단계";
		break;
		case "R5" : rank = "5단계";
		break;
		}
		
		switch(rank){
		case "1단계" : rankImg = seed;
		break;
		case "2단계" : rankImg = sprout;
		break;
		case "3단계" : rankImg = branch;
		break;
		case "4단계" : rankImg = fruit;
		break;
		case "5단계" : rankImg = tree;
		break;
		}
	}
	%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<title>Cho-당신을 위한 반려식물</title>
	<!--타이틀 아이콘-->
	<link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath()%>/images/logo.png">
	<!-- 아이콘 -->
	<script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>
	<!-- 제이쿼리 -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<!-- popper 툴팁 -->
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<!-- 부트스트랩 스크립트(jQuery보다 아래 있어야함) -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
	<style>
		/* font start */
		@font-face {
			font-family: 'basicFont';
			src:
				url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff')
				format('woff');
			font-weight: normal;
			font-style: normal;
		}
		
		* {
			font-family: "basicFont";
		}
		/* font end */
	</style>
	<style>
		.container{
			padding-top:2%;
		}
		
		fieldset {
            height: auto;
            margin: 5px;
            margin-bottom: 50px;
            background: white;
            padding-left: 50px;
            padding-right: 50px;
            text-align: center;
        }
        input[type=text],
        input[type=password],
        input[type=email] {
            padding: 5px 10px;
            margin: 5px 0;
            display: inline-block;
            border: 1px solid #ccc;
        }
        td{
          text-align:left;
        }
        td.mt-2{
        	text-align:right;
        	margin:0% !important;
        	vertical-align: middle !important;
        }
        
        /* 등급별 혜택 */
        .gradecolor{
          border-top:1px solid gray !important;
          border-bottom:1px solid gray;
          background:lightgray;
          text-align:center;
        }
        .aaa{
          width:20%;
          text-align:center;
        }

        .bbb{
          text-align:center;
          width:25%;
        }

        .ccc{
          text-align:center;
          width:20%;
        }

        .ddd{
          text-align:center;
        }
        .lasttr{
          border-bottom:1px solid lightgray;
        }
        label{
        	margin-bottom:0 !important;
        	padding:3%;
        	padding-left:0% !important;
        }
        h1{
        margin:0 !important;
        }
	</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<%if(loginUser.getMemberStatus() == "K" || loginUser.getMemberStatus().equals("K")){ %>
					<%@include file="kakaoCategory.jsp" %>
				<%} else {%>
					<%@include file="myPageCategory.jsp" %>
				<%} %>
			</div>
			<!-- 9단길이의 첫번째 열 -->
			<div class='col-md-9'>
				<fieldset>
					<form>
						<table class="table">
							<thead>
								<tr>
									<th colspan="5" scope="col"><h1><%=loginUser.getMemberName()%>님의 등급은 <%=rank%>
									<img style="width:50px;height:50px" src="<%=request.getContextPath()%>/<%=rankImg%>"></h1></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td scope="row" class="mt-2"><label>누적 구매 금액 : </label></td>
									<td colspan="3"><label id='gradelb'><%=price %>원</label></td>
								</tr>
								<tr>
									<td></td>
									<td scope="row" class="mt-2"><label>보유 포인트 : </label></td>
									<td colspan="3"><label id='gradelb'><%=point%>P</label></td>
								</tr>
								<tr>
									<td scope="row" colspan='3' class="mt-2"><label><h1>
												<br>등급별 혜택
											</h1></label></td>
								</tr>
							</tbody>
							<tbody class='reward' text-align='center'>
								<tr class='gradecolor'>
									<td class='aaa'>단계</td>
									<td class='bbb'>등급</td>
									<td class='ccc'>포인트 적립률</td>
									<td class='ddd'>포인트 사용한도</td>
								</tr>
								<tr>
									<td class='aaa'>1단계</td>
									<td class='bbb'>씨앗</td>
									<td class='ccc'>1%</td>
									<td class='ddd'>1000P</td>
								</tr>
								<tr>
									<td class='aaa'>2단계</td>
									<td class='bbb'>새싹</td>
									<td class='ccc'>2%</td>
									<td class='ddd'>3000P</td>
								</tr>
								<tr>
									<td class='aaa'>3단계</td>
									<td class='bbb'>가지</td>
									<td class='ccc'>3%</td>
									<td class='ddd'>5000P</td>
								</tr>
								<tr>
									<td class='aaa'>4단계</td>
									<td class='bbb'>열매</td>
									<td class='ccc'>4%</td>
									<td class='ddd'>10000P</td>
								</tr>
								<tr class='lasttr'>
									<td class='aaa'>5단계</td>
									<td class='bbb'>나무</td>
									<td class='ccc'>5%</td>
									<td class='ddd'>15000P</td>
								</tr>
							</tbody>
						</table>
					</form>
				</fieldset>
			</div>
		</div>
	</div>
	<script>
	 	<%-- switch("<%=loginUser.getMemberRank()%>"){
		 	case "R1" : <%=loginUser.getMemberRank()%>="1단계"; break;
		 	case "R2" : <%=loginUser.getMemberRank()%>="2단계"; break;
		 	case "R3" : <%=loginUser.getMemberRank()%>="3단계"; break;
		 	case "R4" : <%=loginUser.getMemberRank()%>="4단계"; break;
		 	case "R5" : <%=loginUser.getMemberRank()%>="5단계"; break;
	 	} --%>
	 	
	 	
	 	<%-- <%
	 	String memberRank = (String)loginUser.getMemberRank();
	 	switch(memberRank){
		 	case "R1" : memberRank="1단계"; break;
		 	case "R2" : memberRank="2단계"; break;
		 	case "R3" : memberRank="3단계"; break;
		 	case "R4" : memberRank="4단계"; break;
		 	case "R5" : memberRank="5단계"; break;
	 	}
	 	%> --%>
	</script>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>