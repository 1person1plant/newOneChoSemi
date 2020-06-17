<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="member.model.vo.MyWishList, java.util.ArrayList"%>
<%
	ArrayList<MyWishList> mwl = (ArrayList<MyWishList>)request.getAttribute("mwl"); 
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
		
		.fieldset {
			/* height: auto;
			margin: 5px; */
			margin-bottom: 50px;
			/* background: white; */
			padding-left: 0;
			padding-right: 0;
			text-align: center;
		}
		
		/* 테이블 가운데 정렬 */
		.table td, table th {
			vertical-align: middle !important;
			padding:6px;
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
		#wishAddBtn {
			padding: 8px 18px;
			margin: 5px;
			border-radius: 8px;
			color: black;
			border: 1px solid #115D8C;
			background-color: white;
			width: auto;
			height: auto;
			text-align:right !important;
		}
		
		#wishAddBtn :hover {
			border-radius: 8px !important;
			background: #6AAED9 !important;
			color: white !important;
			transition: 0.2s !important;
		}
		
		#wishAddBtn :active {
			border-radius: 8px !important;
			background: #012340 !important;
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
			<div class='col-md-9 fieldset'>
				<form id="wishListForm" action="#" method="post">
					<table class="table">
						<thead>
							<tr>
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
							<%if(mwl.isEmpty()||mwl.size()==0){ %>
							<tr style='border-bottom: 2px solid black'>
								<td style="padding:15px" class='mt-2' colspan="9" style="font-size:1rem">위시리스트가 존재하지 않습니다.<br>
								</td>
							</tr>
							<tr>
							<td colspan="9"><input type='button' id='wishAddBtn' value="위시리스트 추가하러 가기"></td>
							</tr>
							<%}else{%>
							<%for(int i = 0 ; i < mwl.size() ; i++) {%>
							<tr style='border-bottom: 2px solid black'>
								<td colspan='1' class="mt-2" id="wishNoTd"><%=mwl.get(i).getWishlistNo()%><input style="display: none;" type="text" value="<%=mwl.get(i).getWishlistNo()%>" id="wishNo" name="wishNo"></td>
								<td colspan="2" class='mt-2'><input type="text" style="display:none;" value="<%=mwl.get(i).getItemNo()%>" id="itemNoT" name="<%=mwl.get(i).getItemNo()%>"><img src='<%=request.getContextPath()%>/items_uploadFiles/<%=mwl.get(i).getImageName()%>' width='150px' height='150px'></td>
								<td scope="row" colspan='2' class="mt-2"><%=mwl.get(i).getItemName() %></td>
								<td colspan="2" class='mt-2'><textarea id="<%=mwl.get(i).getWishlistNo()%>memo" class='<%=mwl.get(i).getWishlistNo()%>text' cols='25' rows='5' name="wishMemo" maxlength='150' disabled><%=mwl.get(i).getWishlistMemo()%></textarea><br>
									<p id='countp'><span id='<%=mwl.get(i).getWishlistNo()%>span'><%=mwl.get(i).getWishlistMemo().length()%></span>/100</p>
								</td>
								<td id='orderbutton' colspan="2">
									<input type='button' class='button1' id='<%=mwl.get(i).getWishlistNo()%>UpBtn' value="메모수정"><br>
									<button type='button' class='button1'>상품구매</button><br>
									<input type='button' class='button1' id="<%=mwl.get(i).getWishlistNo()%>DelBtn" value="위시삭제">
									
								</td>
							</tr>
							<%} %>
							<%} %>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
	<%for(int i=0;i<mwl.size();i++){ %>
	<script>
		$(function(){
		    $('#<%=mwl.get(i).getWishlistNo()%>memo').keyup(function(){
		    	var minL = $("#<%=mwl.get(i).getWishlistNo()%>span").text();
		        minL = $(this).val().length;
		        $('#<%=mwl.get(i).getWishlistNo()%>span').text(minL);
		        var maxL = 100-minL;
		        if(maxL>=0){
		            $('#<%=mwl.get(i).getWishlistNo()%>span').parent().css('color','black');
		        }else{
		            $('#<%=mwl.get(i).getWishlistNo()%>span').parent().css('color','red');
		            alert('입력 가능한 글자수를 초과하였습니다.');
		        }
		    });
		});
	</script>
	<%} %>
	<%for(int i=0;i<mwl.size();i++){ %>
	<script>
		$(function(){
			$("#<%=mwl.get(i).getWishlistNo()%>DelBtn").click(function(){
				var delChk = confirm("위시리스트에서 삭제하시겠습니까?");
				var wishNo = $(this).parents("tr").children("td:first").text();
				var memberNo = "<%=loginUser.getMemberNo()%>";
				var wishMemo = $(this).parents("tr").children().children("textarea").text();
				
				/* console.log(wishNo + "memberNo : " + memberNo); */
				
				if(delChk){
				$.ajax({
					url:"<%=request.getContextPath()%>/delete.wi",
					type:"post",
					data:{wishNo:wishNo, memberNo:memberNo, wishMemo:wishMemo},
					success:function(data){// data(받는 데이터)
						location.reload();
						if(data == "fail"){
							alert("실패");
						}
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
			})
		})	
	</script>
	<%} %>
	
	<%for(int i=0;i<mwl.size();i++){ %>
	<script>
		$(function(){
			$('#<%=mwl.get(i).getWishlistNo()%>UpBtn').click(function(){
		        if($('.<%=mwl.get(i).getWishlistNo()%>text').prop('disabled')==true){
		            $('.<%=mwl.get(i).getWishlistNo()%>text').attr('disabled',false);
		        }else if($('.<%=mwl.get(i).getWishlistNo()%>text').prop('disabled')==false){
					$('.<%=mwl.get(i).getWishlistNo()%>text').attr('disabled',true);
		            
		            
		            var wishNo = $(this).parents("tr").children("td:first").text();
		            var memberNo = "<%=loginUser.getMemberNo()%>";
		            var wishMemo = $(this).parents("tr").children().children("textarea").val();
		            var itemNo = $(this).parents("tr").children("td:nth-child(2)").children("input").val();
		            console.log("wishNo : " +wishMemo + "memberNo : " + memberNo + "wishMemo : " + wishMemo + "itemNo : "+itemNo);
		            $.ajax({
					url:"<%=request.getContextPath()%>/wishmemo.up",
					type:"post",
					data:{wishNo:wishNo,memberNo:memberNo,wishMemo:wishMemo,itemNo:itemNo},
					success:function(data){
						if(data == "permit"){
							alert("메모 수정이 완료되었습니다.");
							/* location.reload(); */
						}else if(data == "fail"){
							alert("실패");
						}
					},
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
		        }
		    });
		})
	</script>
	<%} %>
	
	<script>
		$(function(){
			$(".button1").mouseenter(function(){
				$(this).css({"background":"#6AAED9","color":"white","transition":"0.2s","border-radius":"8px"});
			}).mouseout(function(){
				$(this).css({"padding":"8px 18px","border-radius":"8px","color":"black","border":"1px solid #11538C","background-color":"white", "width":"105px", "height":"42px"});
			});
			$("#wishAddBtn").mouseenter(function(){
				$(this).css({"background":"#6AAED9","color":"white","transition":"0.2s","border-radius":"8px"});
			}).mouseout(function(){
				$(this).css({"padding":"8px 18px","border-radius":"8px","color":"black","border":"1px solid #11538C","background-color":"white", "width":"auto", "height":"auto"});
			});
			
		});
	</script>

<%@ include file="../common/footer.jsp"%>
</body>
</html>