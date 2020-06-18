<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, member.model.vo.admin.*,order.model.vo.admin.*"%>
    
 <%
 ArrayList<AdminMember> members=(ArrayList<AdminMember>)request.getAttribute("members");
 ArrayList<AdminOrder> orders=(ArrayList<AdminOrder>)request.getAttribute("orders");
 	
 	%>
<!DOCTYPE html>
<html>
<head>

<!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        
        <!--title icon-->
        <link rel="shortcut icon" type="image⁄x-icon" href="img_main/logo.png">
        <title>Cho-당신을 위한 반려식물</title>
       
         <!--icon-->
        <script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>

        <!--datatable-->
       <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
  		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.21/r-2.2.5/sc-2.0.2/datatables.min.css"/>
        
        <!--jQuery-->
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>



<style>

/* font 추가*/
    @font-face {
      font-family: 'basicFont';
      src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
      font-weight: normal;
      font-style: normal;
    }

    /* font 적용할 때는 아래와 같이*/
    * {
      font-family: "basicFont";
    }
    

.modal-body ul{
        list-style-type: none;
    }

    .modal-body ul li{
        margin-bottom: 2rem;
    }

     /*datatable css*/
     div.dataTables_wrapper {
        width: 70%;
        margin: 0 auto;
      
    }
    
    
   


</style>

</head>
<body>

<%@include file="../common/header.jsp" %>

<!--내용 시작-->

<div class="container-fluid">
    
    
    <div class="row">

        <nav class="col-md-2 d-none d-md-block bg-light sidebar">
            <div class="sidebar-sticky">
    
                <h3 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span>ADMIN</span>
                    <a class="d-flex align-items-center text-muted" href="#">
                      <span data-feather="plus-circle"></span>
                    </a>
                  </h3>
    
                  <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                    <span><i class="fas fa-gifts"></i>상품관리</span>
                    <a class="d-flex align-items-center text-muted" href="#">
                      <span data-feather="plus-circle"></span>
                    </a>
                  </h6>
    
              <ul class="nav flex-column">
                <li class="nav-item">
                  <a class="nav-link active" href="#" onclick="location.href='<%=request.getContextPath()%>/views/admin/itemInsertForm.jsp'">
                    <span data-feather="home"></span>
                    	상품등록 <span class="sr-only">(current)</span>
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#" onclick="location.href='<%=request.getContextPath()%>/list.it'">
                    <span data-feather="file"></span>
                    	상품조회/수정
                  </a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#" onclick="location.href='<%=request.getContextPath()%>/stock.it'">
                    <span data-feather="shopping-cart"></span>
                   	 재고관리
                  </a>
                </li>
                
              </ul>
      
              <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                <span><i class="fas fa-money-check-alt"></i>판매관리</span>
                <a class="d-flex align-items-center text-muted" href="#">
                  <span data-feather="plus-circle"></span>
                </a>
              </h6>
    
              <ul class="nav flex-column mb-2">
                <li class="nav-item">
                  <a class="nav-link" href="#" onclick="location.href='<%=request.getContextPath()%>/adminList.or'">
                    <span data-feather="file-text"></span>
                    	주문내역 조회
                  </a>
                </li>
              </ul>
    
              <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                <span><i class="fas fa-users"></i>고객관리</span>
                <a class="d-flex align-items-center text-muted" href="#" >
                  <span data-feather="plus-circle"></span>
                </a>
              </h6>
    
              <ul class="nav flex-column mb-2">
                <li class="nav-item">
                  <a class="nav-link" href="#" onclick="location.href='<%=request.getContextPath()%>/adminList.me'">
                    <span data-feather="file-text"></span>
                   	 고객계정 관리
                  </a>
                </li>
              </ul>
    
              <h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
                <span><i class="far fa-question-circle"></i>고객센터</span>
                <a class="d-flex align-items-center text-muted" href="#">
                  <span data-feather="plus-circle"></span>
                </a>
              </h6>
    
             <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link active" href="#" onclick="location.href='<%=request.getContextPath()%>/adminList.re'">
                <span data-feather="home"></span>
                	리뷰관리 <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" onclick="location.href='<%=request.getContextPath()%>/adminList.qna'">
                <span data-feather="file"></span>
                	Q&A
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#" onclick="location.href='<%=request.getContextPath()%>/adminList.no'">
                <span data-feather="shopping-cart"></span>
                	공지사항
              </a>
            </li>
            
          </ul>
            </div>
          </nav>
    
        
    
    <!--vertical nav 끝-->
    
    
    <!--form 시작-->
    
    <div class="col-10">
        <h1 style="margin-top: 30px;margin-bottom: 80px;">고객관리</h1>
        
        <div class="row">    
            
            <form class="mx-auto" style="margin-bottom: 10rem; width: 60rem;" method="post" action="<%=request.getContextPath()%>/adminSearch.me">
                
                <table class="mx-auto" style="border: double black; width: 100%;" id="searchTable">
                        <tr>
                        <th colspan="5" style="text-align: center;height: 7rem;">검색</th>
                        
                        </tr>
                        <tr style="height: 3rem;">
                        <th style="text-align: center; width: 10rem;">기간</th>
                        <td>
                            <select style="position: relative;margin-left: 6px; width: 7rem;right: 9px;height: 2rem;" id="searchDate" name="searchDate">
                            	<option value="">전체</option>
                                <option value="MEMBER_JOINDATE">가입일</option>
                            </select>
                        </td>
                        <td>
                            <button type="button" id="today" class="btn btn-outline-dark btn-sm">오늘</button>
                            <button type="button" id="aweek" class="btn btn-outline-dark btn-sm">1주일</button>
                            <button type="button" id="amonth" class="btn btn-outline-dark btn-sm">1개월</button>
                        </td>
                        <td colspan="2" style="position: relative;top:2px;"><input type="date" id="date1" name="date1"><label>~</label><input type="date" id="date2" name="date2"></td>
                        
                        </tr>
                        <tr style="height: 3rem;">
                        <th style="text-align: center; width: 10rem;">활동상태</th>
                        <td colspan="4" style="text-align: left;">
                            <input type="radio" name="active" value="Y" id="available"><label for="available">탈퇴</label>
                            <input type="radio" name="active" value="N" id="inavailable"><label for="inavailable">활동중</label></td>
                            
                        </tr>
                        <tr style="height: 3rem;">
                        <th style="text-align: center; width: 10rem;">회원분류</th>
                        <td colspan="4" style="text-align: left;">
                            <input type="radio" name="memberType" value="Y" id="available"><label for="available">관리자</label>
                            <input type="radio" name="memberType" value="N" id="inavailable"><label for="inavailable">일반회원</label></td>
                            
                        </tr>
                        
               
                        <tr>
                            
                            <td colspan="5" style="text-align: right; height: 5rem;">
                                <button type="submit" style="background-color: #1f598c;color: white;width: 7rem;" class="btn btn-dark" style="width: 7rem;margin-right: 2rem;">조회</button>
                                <button type="reset" class="btn btn-outline-dark" style="width: 7rem;margin-right: 2rem;">초기화</button>
                                
                            </td>
                                
                            </tr>
                        </table>
                    </form>
                </div>
                
                <div class="row">
                   
                   <%if(!members.isEmpty()){ %>
                        
                        <table id="memberlist" class="display" style="width:100%;text-align: center;">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>누적구매액</th>
                                    <th>누적구매수</th>
                                    <th>포인트</th>
                                    <th>등급</th>
                                    <th>가입일</th>
                                    <th>회원상태</th>
                                    <th>관리자여부</th>
                                    <th>회원관리</th>
                                </tr>
                     
                            </thead>
                            <tbody>
                               <%if(!members.isEmpty()){ %>
                               		<%for(int i=0;i<members.size();i++){
                               			
                               			String statusTerm="";
                               			String status=members.get(i).getMemberStatus();
                               			switch(status){
                               			case "Y":statusTerm="탈퇴";break;
                               			case "N":statusTerm="활동중";break;
                               			}
                               			
                               			String adminTerm="";
                               			String admin=members.get(i).getMemberAdmin();
                               			switch(admin){
                               			case "Y":adminTerm="관리자";break;
                               			case "N":adminTerm="일반회원";break;
                               			}
                               			
                               			
                               			%>
                               		
                               			<tr id="row<%=i%>">
                               			<%if(members.get(i).getMemberStatus().equals("N")){ %>
                               			<td><%=members.get(i).getMemberNo() %></td>
                                		<td><%=members.get(i).getMemberId()%></td>
                                		<td><%=members.get(i).getMemberName()%></td>
                                		<td><%=members.get(i).getAccumPaid() %></td>
                                		<td><%=members.get(i).getAccumCount()%></td>
                                		<td><%=members.get(i).getMemberPoint()%></td>
                                		<td><%=members.get(i).getRankName()%></td>
                                		<td><%=members.get(i).getMemberJoinDate()%></td>
                                		<td><%=statusTerm%></td>
                                		<td><%=adminTerm%></td>
                                		<td><button>포인트주기</button></td>
                                		<%}else{ %>
                                		
                                		<td><%=members.get(i).getMemberNo() %></td>
                                		<td><%=members.get(i).getMemberId()%></td>
                                		<td>null</td>
                                		<td>null</td>
                                		<td>null</td>
                                		<td>null</td>
                                		<td>null</td>
                                		<td>null</td>
                                		<td>탈퇴</td>
                                		<td>null</td>
                                		<td><button>탈퇴사유</button></td>
                                		
                                		
                                		<%} %>
                               			</tr>
                               		
                               		<%} %>
                               <%} %>
                               		
                               
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>번호</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>누적구매액</th>
                                    <th>누적구매수</th>
                                    <th>포인트</th>
                                    <th>등급</th>
                                    <th>가입일</th>
                                    <th>회원상태</th>
                                    <th>관리자여부</th>
                                    <th>회원관리</th>
                                </tr>
                            </tfoot>
                        </table>

                       <%}else{ %> 
                       		<div class="container">
                       		<div class="mx-auto" style="text-align:center;width:60rem;height:20rem; background:lightgray;">
         
                       		<p style="padding-top:8rem;">검색 결과가 존재하지 않아요.<br><br>
                       		<button class="btn btn-dark" onclick="location.href='<%=request.getContextPath()%>/adminList.me'">새로고침</button></p>
                       		
                      
                       		</div>
                       		</div>
                       <%} %>
                        
                        
                
            
                 </div>
                    <!--상세 내용 Modal-->
                    
                    <!-- The Modal -->
                    
                    <div class="modal" id="myModal">
                        <div class="modal-dialog modal-xl">
                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title">회원 정보</h4>
                            
                            <button type="button" class="close" data-dismiss="modal" id="modalClose">&times;</button>
                            </div>
                    
                            <!-- Modal body -->
                            <div class="modal-body">
                           
                                
                    			<form id="memberForm" method="post" action="<%=request.getContextPath()%>/adminUpdate.me"  onsubmit="return memValidate();">
                                <ul>
                                
                                	   
                                   <li style="margin-top:30px"><h5>기본정보</h5></li>
                                   <hr>
                                   <li>
                                   <div class="form-inline">
                                   <div class="col-md-12 form-group">
  								   <label class="col-sm-2 col-form-label">회원번호</label>
                                   <input  class="form-control" type="text" readonly id="modal-memNo" name="moMemNum" style="width:70%; margin: 0 auto;" >
                                   </div>
                                   </div>
                                   </li>
                                   <li>
                                   
                                   <div class="form-inline">
                                   <div class="col-md-12 form-group">
  								   <label class="col-sm-2 col-form-label">아이디</label>
                                   <input  class="form-control" type="text" readonly id="modal-memId" name="moMemId"  style="width:70%; margin: 0 auto;" >
                                   </div>
                                   </div>
                                   </li>
                                   
                                   <li>
                                  
                                   <div class="form-inline">
                                   <div class="col-md-12 form-group">
  								   <label class="col-sm-2 col-form-label">이름</label>
                                   <input  class="form-control" type="text" readonly id="modal-memName" name="moMemName"  style="width:70%; margin: 0 auto;" >
                                   </div>
                                   </div>
                                   </li>
                                   
                                   <li>
                                   
                                   <div class="form-inline">
                                   <div class="col-md-12 form-group">
                                   <label class="col-sm-2 col-form-label">EMAIL</label> 
                                   <input  class="form-control" type="text" readonly id="modal-memEmail" name="moMemEmail" style="width:70%; margin: 0 auto;">
                                  	</div>
                                  	</div>
                                   </li>
                                   
                                   
                                   <li>
                                   <div class="form-inline">
                                   <div class="col-md-12 form-group">
                                   <label class="col-sm-2 col-form-label">PHONE</label>
                                   <input  class="form-control" type="text" readonly id="modal-memPhone" name="moMemPhone" style="width:70%; margin: 0 auto;">
                                   </div>
                                   </div>
                                   </li>
                                   
                                    
                                   <li style="margin-top:50px"><h5>포인트관리</h5></li>
                                   <hr>
                                    <li>
                                    <div class="form-inline">
                                   <div class="col-md-12 form-group">
                                    <label class="col-sm-2 col-form-label">회원등급</label>
                                    <div class="input-group"  style="width:70%; margin: 0 auto;">
									  <input type="text" id="modal-memRank" name="moMemRank" class="form-control" aria-label="Text input with dropdown button">
									  <div class="input-group-append">
									    <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">등급수정</button>
									    <div class="dropdown-menu">
									      <a class="dropdown-item" onclick="modifyRank(1);">씨앗</a>
									      <a class="dropdown-item" onclick="modifyRank(2);">새싹</a>
									      <a class="dropdown-item" onclick="modifyRank(3);">가지</a>
									      <a class="dropdown-item" onclick="modifyRank(4);">열매</a>
									      <a class="dropdown-item" onclick="modifyRank(5);">나무</a>
									    </div>
									  </div>
									</div>
									</div>
                                   </div>
									
                                   </li>
                                   <li>
                                   <div class="form-inline">
                                   <div class="col-md-12 form-group">
                                   <label class="col-sm-2 col-form-label">누적구매금액</label><input  class="form-control" type="text" id="modal-memAccumPaid" name="moMemAccumPaid" readonly style="width:70%; margin: 0 auto;">
                                   </div>
                                   </div>
                                   </li>
  								   <li>
  								    <div class="form-inline">
                                   <div class="col-md-12 form-group">
  								   <label class="col-sm-2 col-form-label">누적구매회수</label><input  class="form-control" type="text" id="modal-memAccumCount" name="moMemAccumCount" readonly style="width:70%; margin: 0 auto;">
  								   </div>
                                   </div>
  								   </li>
  								   
  								   <li>
  								   <div class="form-inline">
                                   <div class="col-md-12 form-group">
                                   <label class="col-sm-2 col-form-label">주문내역</label>
  								   
  								   <table id="modalOrderlist" class="display nowrap">
		  								    <thead>
		                                <tr>
		                                	
		                                    <th>주문번호</th>
		                                    <th>주문일시</th>
		                                    <th>상품번호</th>
		                                    <th>상품명</th>
		                                    <th>입금상태</th>
		                                    <th>배송상태</th>
		                                    <th>구매수량</th>
		                                    
		                                </tr>
		                     
		                            </thead>
		                            <tbody>
		                             
		                               			<tr>
		                               				
		                               				<td id="moOrderNo"></td>
		                               				<td id="moOrderDate"></td>
		                               				<td id="moOrderItemNo"></td>
		                               				<td id="moOrderItemName"></td>
		                               				<td id="moPaymentStat"></td>
		                               				<td id="moDeliveryStat"></td>
		                               				<td id="moOrderCount"></td>
		                               				
		                               			</tr>
		                               		  		
		                               
		                            </tbody>
		                            
		  								   
  								   
  								   </table>
  								   
  								   </div>
                                   </div>
  								   
  								   </li>
  								   
  								   
                                   <li>
                                   <div class="form-inline">
                                   <div class="col-md-12 form-group">
                                   <label class="col-sm-2 col-form-label">포인트</label><input  class="form-control" type="number" id="modal-memPoint" name="moMemPoint" readonly style="width:70%; margin: 0 auto;">
                                   </div>
                                   </div>
                                   </li>
                                   
                                   <li>
                                   <div class="form-inline">
                                   <div class="col-md-12 form-group">
                                   <label class="col-sm-2 col-form-label"></label>
                                   <div class="input-group" style="width:70%; margin: 0 auto;">
                    			   <input type="number" class="form-control" id="calPoint" name="calPoint" placeholder="추가할 포인트" style="display: inline;">
								   <div class="input-group-append">
                    			   <button class="btn btn-outline-secondary" id="addPoint"  type="button" style="background-color: #1f598c;color: white;">추가하기</button>
                    			   <button class="btn btn-outline-secondary" id="resetPoint" type="button" style="background-color: #1f598c;color: white;">되돌리기</button>
                   				   </div>
                    			   </div>
                    			   </div>
                                   </div>
                                   </li>
                                </ul> 
                                
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            <button type="submit" class="btn btn-outline-success" >수정하기</button>
                            <button type="button" id="modifyAdmin" class="btn btn-danger" data-dismiss="modal">관리자전환</button>
                            </div>
                    		</form>
                            
                           
                        </div>
                        </div>
                    </div>
                    <!-- 활동중인 회원 모달 끝 -->
                    
                    <!-- 탈퇴 회원 모달 -->
                    <!-- The Modal -->
                    <div class="modal" id="dropOutModal">
                        <div class="modal-dialog">
                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title">회원 정보</h4>
                            
                            <button type="button" class="close" data-dismiss="modal" id="modalClose">&times;</button>
                            </div>
                    
                            <!-- Modal body -->
                            <div class="modal-body">
                           
                                
                                <ul>
                                
                                	   
                                   <li style="margin-top:30px"><h5>탈퇴사유</h5></li>
                                   <hr>
                                   <li><label>가입일시</label><br><input  class="form-control" type="date" readonly id="modal-memSignDate" name="moMemSignDate" style="width:80%"></li>
                                   <li><label>탈퇴사유</label><br><textArea class="form-control" readonly id="modal-memDropReason" name="moMemDropReason" style="width:80%"></textArea></li>
                                   
                                  
                                </ul> 
                                
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            
                            </div>
                            
                           
                        </div>
                        </div>

                 </div>
        
        
        
    </div>  
       
</div>

<div class="container-fluid" >
    <div class="jumbotron text-center" style="background-image:url('<%=request.getContextPath()%>/images/admin/head.jpg'); margin-top:100px;height: 300px;">
        
    </div>
</div>


<!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
    integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
    integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
    integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
    crossorigin="anonymous"></script>


<!--datatable 관련 script-->
 
 <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/r-2.2.5/sc-2.0.2/datatables.min.js"></script>
 <script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/3.3.1/js/dataTables.fixedColumns.min.js"></script>
 <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
 
 
 <script>
     $(document).ready(function(){
    	 
    	 
    	$('#memberlist thead tr').clone(true).appendTo('#memberlist thead');
     	$('#memberlist thead tr:eq(1) th').each(function(i){
     		
     		var title=$(this).text();
     		$(this).html('<input type="text" placeholder="search '+title+'"/>');
     		
     		$('input',this).on('keyup change',function(){
     			
     			if(table.column(i).search()!==this.value){
     				table
     					.column(i)
     					.search(this.value)
     					.draw();
     			}
     			
     		});
     		
     	}); 
     	
     	
     	$('#modalOrderlist thead tr').clone(true).appendTo('#modalOrderlist thead');
     	$('#modalOrderlist thead tr:eq(1) th').each(function(i){
     		
     		var title=$(this).text();
     		$(this).html('<input type="text" placeholder="search '+title+'"/>');
     		
     		$('input',this).on('keyup change',function(){
     			
     			if(table.column(i).search()!==this.value){
     				table
     					.column(i)
     					.search(this.value)
     					.draw();
     			}
     			
     		});
     		
     	}); 
    	 
       var table=$('#memberlist').DataTable({
       
    	  	orderCellsTop:true,
	   		fixedHeader:true,
	   		scrollX:true
        	
         });
       
      $('#modalOrderlist').DataTable({
           
    	  
    	  orderCellsTop:true,
	   	  fixedHeader:true,
    	  scrollY: 200,
          scrollX: true,
          bFilter: false
       	
        });
       
       
     
       
       var flag=true;
       
      
       
         
         $("#memberlist tbody").on('click','tr',function(){
        	 
        	
        	 
        	
        	 console.log("행 클릭 안 플래그"+flag);
        	 
        	 var memberNum=$(this).children().eq(0).text();
        	 var memberStatus=$(this).children().eq(8).text();
        	 var memberId=$(this).children().eq(1).text();
        	 console.log(memberStatus);
        	 
        	 
       	 
             <%for(int i=0;i<members.size();i++){%>
             
             
             if(memberStatus=='활동중'){
        	 
        	 console.log("행에 토글달기");
        	 
        	if(flag){
        	
        	 $(this).attr({"data-toggle":"modal","data-target":"#myModal"});
        	 
        	}
        	 
        	
        	
        	 console.log("memberNum:"+memberNum);
         	
             $("#modal-memNo").val(memberNum);
         	
             if(memberNum=='<%=members.get(i).getMemberNo()%>'){
             	
             	$("#modal-memId").val('<%=members.get(i).getMemberId()%>');
             	$("#modal-memName").val('<%=members.get(i).getMemberName()%>');
             	$("#modal-memEmail").val('<%=members.get(i).getMemberEmail()%>');
             	$("#modal-memPhone").val('<%=members.get(i).getMemberPhone()%>');
             	
             	$("#modal-memRank").val('<%=members.get(i).getRankName()%>');
             	$("#modal-memAccumPaid").val('<%=members.get(i).getAccumPaid()%>');
             	$("#modal-memAccumCount").val('<%=members.get(i).getAccumCount()%>');
             	$("#modal-memPoint").val('<%=members.get(i).getMemberPoint()%>');
             	
             	
             	
             	<%for(int j=0;j<orders.size();j++){%>
             	
             	if(memberId=='<%=orders.get(j).getMemberId()%>'){
             		
             		var orderNo='<%=orders.get(j).getOrderNo()%>'
             		var orderDate='<%=orders.get(j).getOrderDate()%>'
             		var orderItemNo='<%=orders.get(j).getItemNo()%>'
             		var orderItemName='<%=orders.get(j).getItemName()%>'
             		var orderPayment='<%=orders.get(j).getPaymentStatus()%>'
             		var orderDelivery='<%=orders.get(j).getDeliveryStatus()%>'
             		var orderCount='<%=orders.get(j).getOrderCount()%>'
             		
             		$("#moOrderNo").text(orderNo);
             		$("#moOrderDate").text(orderDate);
             		$("#moOrderItemNo").text(orderItemNo);
             		$("#moOrderItemName").text(orderItemName);
             		$("#moPaymentStat").text(orderPayment);
             		$("#moDeliveryStat").text(orderDelivery);
             		$("#moOrderCount").text(orderCount);
             		
             		
             	}
             	
             	
             	
             	<%}%>
             	
             	
             	
             	
             	var adminChk='<%=members.get(i).getMemberAdmin()%>';
             	console.log("관리자?"+adminChk)
             	
             	if(adminChk=='Y'){
             		
             		$("#modifyAdmin").text("권한박탈");
             		
             		
             	}else{
             		$("#modifyAdmin").text("관리자권한");
             	}
             	
             	
             }
             
             }else{
            	 
            	 if(flag){
                 	
                	 $(this).attr({"data-toggle":"modal","data-target":"#dropOutModal"});
                	 
                	}
                	 
            	 
            	 if(memberNum=='<%=members.get(i).getMemberNo()%>'){
                   	
                   	$("#modal-memSignDate").val('<%=members.get(i).getMemberJoinDate()%>');
                   	$("#modal-memDropReason").val('<%=members.get(i).getMemberExit()%>');
                   	
                   	
                   }
             	 
            	 
            	 
             }
             
             
             
             <%}%>
             
             
             
             
             
            
            
              
         })
         
         
         
         
         
         
         
         
         	
       	
       	
         

          
            
           
               
        });
        
        
        </script>
       
         <script>
        
			function memValidate(){
        	
			console.log("submit 전 잠시 멈춤!")
        	
        	var selectedMem=$("#modal-memNo").val();
        	var usedPo=0;
        	var usedRan="";
        	var changedPo=parseInt($("#modal-memPoint").val());
        	var changedRan=$("#modal-memRank").val();
        	
        	
        	
      
        	<%for(int i=0;i<members.size();i++){%>
        	
        	if(selectedMem=='<%=members.get(i).getMemberNo()%>'){
        		
        		usedPo=<%=members.get(i).getMemberPoint()%>
        		usedRan='<%=members.get(i).getRankName()%>'
        		
        	}
        	
        	<%}%>
        	
        	console.log(selectedMem);
        	console.log(changedPo);
        	console.log(changedRan);
        	console.log(usedPo);
        	console.log(usedRan);
        	
        	
			if(usedPo!=changedPo&&usedRan!=changedRan){
        		
        		var last=confirm("기존의 포인트:"+usedPo+"\n변경된 포인트:"+changedPo+"\n기존의 등급:"+usedRan+
        				"\n변경된 등급:"+changedRan+"\n수정하시겠습니까?");
        		
        		if(last){
        			
        			return true;
        		}else{
        			return false;
        		}
        		
        	}else if(usedPo!=changedPo){
        		
        		var last=confirm("기존의 포인트:"+usedPo+"\n변경된 포인트:"+changedPo+"\n수정하시겠습니까?");
        		
        		if(last){
        			
        			return true;
        		}else{
        			return false;
        		}
        		
        		
        		
        	}else if(usedRan!=changedRan){
        		
        		
        		var last=confirm("기존의 등급:"+usedRan+"\n변경된 등급:"+changedRan+"\n수정하시겠습니까?");
        		
        		if(last){
        			
        			return true;
        		}else{
        			return false;
        		}
        		
        		
        	}else if(usedPo==changedPo&&usedRan==changedRan){
        		
        		
        		alert("변경된 사항이 없습니다.");
        		
        		return false;
        		
        	}else{
        		
        		alert("확인좀해봐");
        		return false;
        	}
        	
        	

        	
			
        	
        	
        	}
        
			
			$("#modifyAdmin").click(function(){
			
				
				var adminChkValue=$(this).text();
				var adminMemNo=$("#modal-memNo").val();
				
				
				
				var adminChange="";
				
				if(adminChkValue=="권한박탈"){
					
					adminChange="N";
					
				}else{
					
					adminChange="Y";
				}
				
				
				console.log(adminChange);
				
				var agree=confirm("권한을 수정하시겠습니까?");
				
				if(agree){
				location.href="<%=request.getContextPath()%>/adminGrant.me?adminChange="+adminChange+"&memberNo="+adminMemNo;
				}
				
				
			})
			
			
        
        
        </script>
       
        
        <script>
        
        function modifyRank(num){
        	
        	var rank="";
        	if(num==1){
        		rank="씨앗";
        	}
        	
        	if(num==2){
        		rank="새싹";
        	}
        	
        	if(num==3){
        		rank="가지";
        	}
        	
        	if(num==4){
        		rank="열매";
        	}
        	
        	if(num==5){
        		rank="나무";
        	}
        	
        	$("#modal-memRank").val(rank);
        	
        }
        
        
        
        $("#addPoint").click(function(){
        
        	var calPoint=$("#calPoint").val();
        	var before=parseInt($("#modal-memPoint").val());
        	
        	var after=0;
        	if(calPoint!=""){
        		after=parseInt(calPoint)+before;
        	}
        	console.log(calPoint);
        	console.log(before);
        	console.log(after);
        	
        	if(calPoint!=""){
        	$("#modal-memPoint").val(after);
        	$("#calPoint").val(0);
        	
        	}
        	
        });
        
        
        $("#resetPoint").click(function(){
        
        	var thismemNum=$("#modal-memNo").val();
        	var usedto=0;
        	
        	<%for(int i=0; i<members.size();i++){%>
        		
        		if(thismemNum=='<%=members.get(i).getMemberNo()%>'){
        			
        			usedto=<%=members.get(i).getMemberPoint()%>	
        			
        		}
        	
        	
        		<%}%>
        	
        	$("#modal-memPoint").val(usedto);
        	
        });
        
        
       
        </script>


        <!--date 관련-->
        <script>

            $(function(){
            	
            	var date= new Date();
                var month=date.getMonth()+1;
                var day=date.getDate();
                var today=date.getFullYear()+"-"+(month<10? '0':'')+month+"-"+(day<10? '0':'')+day;

                $("#today").click(function(){

                    
                    
                    $("#date1").val(today);
                    $("#date2").val(today);

                   
                })


                $("#aweek").click(function(){

                    var date=new Date();
                    date.setDate(date.getDate()-7);
                    var month=date.getMonth()+1;
                    var day=date.getDate();
                    var aweek=date.getFullYear()+"-"+(month<10? '0':'')+month+"-"+(day<10? '0':'')+day;
                    

                    
                    $("#date1").val(aweek);
                    $("#date2").val(today);

                })

                $("#amonth").click(function(){

                    var date=new Date();
                    date.setMonth(date.getMonth()-1);
                    var month=date.getMonth()+1;
                    var day=date.getDate();
                    var amonth=date.getFullYear()+"-"+(month<10? '0':'')+month+"-"+(day<10? '0':'')+day;

                    $("#date1").val(amonth);
                    $("#date2").val(today);

                    
                })


                
            })
       
        </script>
       
        
        <%@ include file="../common/footer.jsp" %>

</body>
</html>