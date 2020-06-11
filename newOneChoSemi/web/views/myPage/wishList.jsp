<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.MyWishList, java.util.ArrayList"%>
<% ArrayList<MyWishList> mwl = (ArrayList<MyWishList>)request.getAttribute("mwl"); 
	String mwlNo = mwl.get(0).getWishlistNo();
	String mwlMemo = mwl.get(0).getWishlistMemo();
	String mwlItemNo = mwl.get(0).getItemNo();
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
		.container {
			padding-top: 2%;
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
		
		/* 테이블 가운데 정렬 */
		.table td, table th {
			vertical-align: middle !important;
		}
		
		/* 버튼 CSS */
		.button1 {
			padding: 8px 18px;
			margin: 5px;
			border-radius: 8px;
			color: black;
			border: 1px solid #115D8C;
			background-color: white;
			width: 105px;
			height: 42px;
		}
		
		.button1 :hover {
			border-radius: 8px !important;
			background: #6AAED9 !important;
			color: white !important;
			transition: 0.2s !important;
		}
		
		.button1 :active {
			border-radius: 8px !important;
			background: #012340 !important;
		}
		
		#countp {
			text-align: right;
			font-size: 14px;
			padding-right: 10%;
		}
		
		textarea:focus {
			outline: 2px solid #6AAED9;
		}
		
		p {
			margin-bottom: 0px !important;
		}
	</style>
</head>
<body>

	<%@ include file="../common/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<%@include file="myPageCategory.jsp"%>
			</div>
			<!-- 9단길이의 첫번째 열 -->
			<div class='col-md-9'>
				<fieldset>
					<form>
						<table class="table">
							<thead>
								<tr>
									<br>
									<th colspan="9" scope="col" style='border-bottom: 2px solid black'>
										<input style="display: none;" type="text" value="<%=loginUser.getMemberNo()%>" id="memberNo" name="memberNo">
										<h1>위시리스트</h1>
									</th>
								</tr>
							</thead>
							<tbody class='bodycss'>
								<tr style='border-bottom: 2px solid black'>
									<th colspan='1'>번호</th>
									<th colspan="2" class='wishmenu'>상품이미지</th>
									<th scope="row" colspan='2' class="wishmenu">상품명</th>
									<th colspan="2" class='wishmenu'>메모</th>
									<th colspan="2" class='wishmenu'>기타</th>
								</tr>
								<tr style='border-bottom: 2px solid black'>
									<td colspan='1' class="mt-2"><%=mwlNo%></td>
									<td colspan="2" class='mt-2'><a href='<%=mwlItemNo%>'><img src='#' width='150px' height='150px'></a></td>
									<td scope="row" colspan='2' class="mt-2">???</td>
									<td colspan="2" class='mt-2'><textarea id="memo1" class='textA' cols='25' rows='5' maxlength='150' disabled><%=mwlMemo%></textarea><br>
										<p id='countp'><span id='counter1'><%=mwlMemo.length()%></span>/100</p>
									</td>
									<td id='orderbutton' colspan="2">
										<input type='button' class='button1' id='changeM' value="메모수정"><br>
										<a href='main.jsp' id='delete1'><button type='button' class='button1'>상품구매</button></a><br>
										<a href='main.jsp' id='delete2'><button type='button' class='button1'>상품삭제</button></a>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</fieldset>
			</div>
		</div>
	</div>
	<script>
		$(function(){
		    $('#memo1').keyup(function(){
		    	var minL = "<%=mwlMemo%>";
		        minL = $(this).val().length;
		        $('#counter1').text(minL);
		        var maxL = 100-minL;
		        if(maxL>=0){
		            $('#counter1').parent().css('color','black');
		        }else{
		            $('#counter1').parent().css('color','red');
		            alert('입력 가능한 글자수를 초과하였습니다.');
		        }
		    });
		    
		    $('#changeM').click(function(){
		        if($('.textA').prop('disabled')==true){
		            $('.textA').attr('disabled',false);
		        }else if($('.textA').prop('disabled')==false){
		            $('.textA').attr('disabled',true);
		        }
		    });
		    
		});
	</script>
	<script>
		$(function(){
			$(".button1").mouseenter(function(){
				$(this).css({"background":"#6AAED9","color":"white","transition":"0.2s","border-radius":"8px"});
			}).mouseout(function(){
				$(this).css({"padding":"8px 18px","border-radius":"8px","color":"black","border":"1px solid #11538C","background-color":"white", "width":"105px", "height":"42px"});
			});
		});
	</script>

	<%@ include file="../common/footer.jsp"%>
</body>
</html>