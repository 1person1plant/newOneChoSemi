<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
		</script>

		<!-- 부트스트랩 스크립트 -->
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
		</script>

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
			.ara-label-text {
				padding-top: 6px;
				text-align: left;
			}

		/* 텍스트 스타일 적용 */
			.ara_text {
				margin-left: -25px;
			}

		/* 아코디언 스타일 적용 (약관동의) */
			#accordionMenu { /* 아코디언 속 내용 */
				font: 12px/20px; /* 글씨체작성하면 크기 작아짐 */
				color: black;
				text-align: left;
			}
		</style>

	</head>
	
	<body>		
		<%@ include file="../common/header.jsp"%>	
		
		<!-- 아라_ 회원가입 페이지 -->
		<form id="joinForm" action="<%=request.getContextPath()%>/insertMember.me" method="post" name="joinForm">
			<div class="container-fluid" style="margin-top: 80px;">
			<!-- 공백 : 내용 : 공백  -->
				
				<div class="row">
				
					<!-- 왼쪽공백 -->
					<div class="test col-2"></div>
					
					<div class="test col-8" style="padding: 0px;">
						<div class="test col-12">
							<div class="test col-12">
								<h1 style="text-align-last: center;">회 원 가 입</h1>
							</div>
							<div class="test col-12" style="text-align: center;">
								<a href="<%=request.getContextPath()%>/index.jsp">HOME</a>
							</div>
							<hr>
							<br>
							<div class="test col-12">
								<tbody>
									<tr class="user-id">
										<th>
											<div class="row">
												<div class="test col-2 ara-label-text">
													아이디
													<!-- bootstrap 4.4.1 버전에서 icon api 찾아보기 -->
													<svg class="bi bi-check-circle" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="color: red">
                          								<path fill-rule="evenodd" d="M15.354 2.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3-3a.5.5 0 11.708-.708L8 9.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd" />
                          								<path fill-rule="evenodd" d="M8 2.5A5.5 5.5 0 1013.5 8a.5.5 0 011 0 6.5 6.5 0 11-3.25-5.63.5.5 0 11-.5.865A5.472 5.472 0 008 2.5z" clip-rule="evenodd" />
                        							</svg>
												</div>
												<div class="test col-4">
													<input type="text" class="form-control" placeholder="아이디를 입력하세요" autofocus required aria-describedby="basic-addon1" maxlength="16" name="memberId" id="userid">
												</div>
												<div class="test col-3" style="text-align: left;">
													<p class="ara_text ara-label-text">
														(영문소문자/숫자, 4~16자)<label id="userIdresult"></label>
													</p>
												</div>
												<div class="test col-2" style="margin-left: -70px">
													<button type="button" class="btn btn-default" id="check_id" style="background: #1f598c; color: white;" onclick="joinIdChk();">중복확인</button>
													<input type="hidden" name="idCheck" value="idUnchk"> <!-- 중복체크 안누른 상태 -->
												</div>
											</div>
										</th>
									</tr>
									<br>
									<tr class="user-pwd">
										<th>
											<div class="row">
												<div class="test col-2 ara-label-text">
													비밀번호
													<svg class="bi bi-check-circle" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="color: red">
                          								<path fill-rule="evenodd" d="M15.354 2.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3-3a.5.5 0 11.708-.708L8 9.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd" />
                          								<path fill-rule="evenodd" d="M8 2.5A5.5 5.5 0 1013.5 8a.5.5 0 011 0 6.5 6.5 0 11-3.25-5.63.5.5 0 11-.5.865A5.472 5.472 0 008 2.5z" clip-rule="evenodd" />
                        							</svg>
												</div>
												<div class="test col-4">
													<input type="password" class="form-control" name="memberPwd" id="pwd" placeholder="비밀번호를 입력하세요" required aria-describedby="basic-addon1" maxlength="12">
												</div>
												<div class="test col-6" style="text-align: left;">
													<p class="ara_text ara-label-text">(숫자와 문자 포함 형태의 6~12자리 이내)</p>
												</div>
											</div>
										</th>
									</tr>
									<br>
									<tr class="user-pwdChk">
										<th>
											<div class="row">
												<div class="test col-2 ara-label-text">
													비밀번호 확인
													<svg class="bi bi-check-circle" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="color: red">
                         								<path fill-rule="evenodd" d="M15.354 2.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3-3a.5.5 0 11.708-.708L8 9.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd" />
                          								<path fill-rule="evenodd" d="M8 2.5A5.5 5.5 0 1013.5 8a.5.5 0 011 0 6.5 6.5 0 11-3.25-5.63.5.5 0 11-.5.865A5.472 5.472 0 008 2.5z" clip-rule="evenodd" />
                        							</svg>
												</div>
												<div class="test col-4">
													<input type="password" class="form-control" name="pwdChk" id="pwdChk" placeholder="비밀번호를 확인하세요" required aria-describedby="basic-addon1" maxlength="12">
												</div>
												<div class="test col-6 ara-label-text">
													<label id="pwdresult"></label>
												</div>
											</div>
										</th>
									</tr>
									<br>
									<tr class="user-name">
										<th>
											<div class="row">
												<div class="test col-2 ara-label-text">
													이&nbsp;&nbsp;름
													<svg class="bi bi-check-circle" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="color: red">
                          								<path fill-rule="evenodd" d="M15.354 2.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3-3a.5.5 0 11.708-.708L8 9.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd" />
                          								<path fill-rule="evenodd" d="M8 2.5A5.5 5.5 0 1013.5 8a.5.5 0 011 0 6.5 6.5 0 11-3.25-5.63.5.5 0 11-.5.865A5.472 5.472 0 008 2.5z" clip-rule="evenodd" />
                        							</svg>
												</div>
												<div class="test col-4">
													<input type="text" class="form-control" placeholder="이름을 입력하세요" maxlength="12" required aria-describedby="basic-addon1" name="memberName" id="name">
												</div>
												<div class="test col-6 ara-label-text">
													<label id="nameresult"></label>
												</div>
											</div>
										</th>
									</tr>
									<br>
									<tr class="user-phone">
										<th>
											<div class="row">
												<div class="test col-2 ara-label-text">
													휴대폰 번호
													<svg class="bi bi-check-circle" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="color: red">
                         								<path fill-rule="evenodd" d="M15.354 2.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3-3a.5.5 0 11.708-.708L8 9.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd" />
                          								<path fill-rule="evenodd" d="M8 2.5A5.5 5.5 0 1013.5 8a.5.5 0 011 0 6.5 6.5 0 11-3.25-5.63.5.5 0 11-.5.865A5.472 5.472 0 008 2.5z" clip-rule="evenodd" />
                        							</svg>
												</div>
												<div class="test col-8">
													<div class="test col-8">
														<div class="row">
															<select id="phone1" name="memberPhone1" class="form-control" aria-describedby="basic-addon1" style="width: 20%;">
																<option value="010">010</option>
																<option value="011">011</option>
																<option value="016">016</option>
																<option value="017">017</option>
																<option value="018">018</option>
																<option value="019">019</option>
															</select>
															<p class="ara-label-text">&nbsp;-&nbsp;</p>
															<input id="phone2" name="memberPhone2" type="tel" maxlength="4" class="form-control" aria-describedby="basic-addon1" style="width: 20%;" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
															<p class="ara-label-text">&nbsp;-&nbsp;</p>
															<input id="phone3" name="memberPhone3" type="tel" maxlength="4" class="form-control" aria-describedby="basic-addon1" style="width: 20%;" required oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
														</div>
													</div>
												</div>
												<div class="test col-2"></div>
											</div>
										</th>
									</tr>
									<br>
									<tr class="user-email">
										<th>
											<div class="row">
												<div class="test col-2 ara-label-text">
													이메일
													<svg class="bi bi-check-circle" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="color: red">
                          								<path fill-rule="evenodd" d="M15.354 2.646a.5.5 0 010 .708l-7 7a.5.5 0 01-.708 0l-3-3a.5.5 0 11.708-.708L8 9.293l6.646-6.647a.5.5 0 01.708 0z" clip-rule="evenodd" />
                         	 							<path fill-rule="evenodd" d="M8 2.5A5.5 5.5 0 1013.5 8a.5.5 0 011 0 6.5 6.5 0 11-3.25-5.63.5.5 0 11-.5.865A5.472 5.472 0 008 2.5z" clip-rule="evenodd" />
                        							</svg>
												</div>
												<div class="test col-8">
													<div class="test col-8">
														<div class="row">
															<input id="email1" name="memberEmail1" type="text" class="form-control" aria-describedby="basic-addon1" required style="width: 150px;" maxlength="16">
															<p class="ara-label-text">&nbsp;@&nbsp;</p>
															<select id="email2" name="memberEmail2" class="form-control" aria-describedby="basic-addon1" style="width: 150px;">
																<option value="@naver.com">naver.com</option>
																<option value="@gmail.com">gmail.com</option>
																<option value="@nate.com">nate.com</option>
																<option value="@hanmail.net">hanmail.net</option>
															</select>
														</div>
													</div>
												</div>
												<div class="test col-2"></div>
											</div>
										</th>
									</tr>
									<br>
									<tr class="user-address1">
										<th>
											<div class="row">
												<div class="test col-2 ara-label-text">우편번호</div>
												<div class="test col-2">
													<input type="text" name="memberPostcode" id="address1" class="form-control" aria-describedby="basic-addon1">
												</div>
												<div class="test col-8">
													<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 검색" class="btn btn-default" style="background: #1f598c; color: white;">
												</div>
											</div>
										</th>
									
										<!-- 다음 주소 api-->
										<div id="wrap" style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 0; position: relative;">
											<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1" onclick="foldDaumPostcode()" alt="접기 버튼">
										</div>
									</tr>
									<br>
									<tr class="user-address2">
										<th>
											<div class="row">
												<div class="test col-2 ara-label-text">주&nbsp;&nbsp;소</div>
												<div class="test col-6">
													<input type="text" name="memberAddress1" id="address2" class="form-control" aria-describedby="basic-addon1">
												</div>
												<div class="test col-4"></div>
											</div>
										</th>
									</tr>
									<br>
									<tr class="user-address3">
										<th>
											<div class="row">
												<div class="test col-2 ara-label-text">상세주소</div>
												<div class="test col-6">
													<input type="text" name="memberAddress2" id="address3" class="form-control" aria-describedby="basic-addon1" required>
												</div>
												<div class="test col-4"></div>
											</div>
										</th>
									</tr>
									<br>
								</tbody>
							</div>

							<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
						</div>
						
						<hr>
						<br>
						<h4><strong>전체 동의</strong></h4>
		
						<div class="test col-12">
							<input onclick="chkAll();" class="allChk" type="checkbox" id="allChk" name="allChk"> <label for="allChk"><strong>이용약관 및 개인정보수집 및 이용, 쇼핑정보 수신(선택)에 모두 동의합니다.</strong></label>
						</div>
						<br><br>

						<!-- 아코디언 메뉴-->
						<div class="test col-12" id="accordionMenu" style="padding: 0px;">

							<div class="accordion" id="accordionExample">
								<div class="card">
									<div class="card-header" style="background: #1f598c; cursor: pointer; font-weight: bold; font-size: 20px; color: white;">
										<div class="row">
											<div align="left" class="test col-10" id="headingOne" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">[필수] 이용약관 동의</div>
											<div align="right" class="test col-2">
												<label for="checkbox1"><span class="chkText">동의 안함</span></label> <input class="input_chk chkbox" type="checkbox" onclick="chkAction();" id="checkbox1" name="chkBox">
											</div>
										</div>
									</div>

									<div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
										<div class="card-body">
											<p>
												제1조(목적)<br>이 약관은 OO 회사(전자상거래 사업자)가 운영하는 OO 사이버 몰(이하 “몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리?의무 및 책임사항을 규정함을 목적으로 합니다.<br>※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」<br> <br>제2조(정의)<br>① “몰”이란 OO 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.<br>② “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.<br>③ ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.<br>④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.<br> <br>제3조 (약관 등의 명시와 설명 및 개정) <br>① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호?모사전송번호?전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보보호책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.<br>② “몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회?배송책임?환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의
												확인을 구하여야 합니다.<br>③ “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.<br>④ “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 “몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. <br>⑤ “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.<br>⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.<br> <br>제4조(서비스의 제공 및 변경) <br>① “몰”은 다음과 같은 업무를 수행합니다.<br>&nbsp; 1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결<br>&nbsp; 2. 구매계약이 체결된 재화 또는 용역의 배송<br>&nbsp; 3. 기타 “몰”이 정하는 업무<br>② “몰”은 재화 또는
												용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.<br>③ “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.<br>④ 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br> <br>제5조(서비스의 중단) <br>① “몰”은 컴퓨터 등 정보통신설비의 보수점검?교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.<br>② “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.<br>③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.<br> <br>제6조(회원가입) <br>① 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br>② “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에
												해당하지 않는 한 회원으로 등록합니다.<br>&nbsp; 1. 가입신청자가 이 약관 <br> <br>제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.<br>&nbsp; 2. 등록 내용에 허위, 기재누락, 오기가 있는 경우<br>&nbsp; 3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우<br>③ 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.<br>④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.제7조(회원 탈퇴 및 자격 상실 등) <br>① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를 처리합니다.<br>② 회원이 다음 각 호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다.<br>&nbsp; 1. 가입 신청 시에 허위 내용을 등록한 경우<br>&nbsp; 2. “몰”을 이용하여 구입한 재화 등의 대금, 기타 “몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우<br>&nbsp; 3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우<br>&nbsp; 4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우<br>③ “몰”이 회원 자격을 제한?정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다.<br>④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우
												회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.<br> <br>제8조(회원에 대한 통지)<br>① “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.<br>② “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.<br> <br>제9조(구매신청) <br>① “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.<br>&nbsp; 1. 재화 등의 검색 및 선택<br>&nbsp; 2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력<br>&nbsp; 3. 약관내용, 청약철회권이 제한되는 서비스, 배송료?설치비 등의 비용부담과 관련한 내용에 대한 확인<br>&nbsp; 4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)<br>&nbsp; 5. 재화등의 구매신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의<br>&nbsp; 6. 결제방법의 선택<br>② “몰”이 제3자에게 구매자 개인정보를 제공?위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “몰”은 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유?이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 처리위탁의 경우 등
												관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.<br> <br>제10조 (계약의 성립)<br>① “몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.<br>&nbsp; 1. 신청 내용에 허위, 기재누락, 오기가 있는 경우<br>&nbsp; 2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우<br>&nbsp; 3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우<br>② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.<br>③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.<br> <br>제11조(지급방법)<br>“몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.<br>1. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 <br>2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제<br>3. 온라인무통장입금<br>4. 전자화폐에 의한 결제<br>5. 수령 시 대금지급<br>6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제<br>7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제 <br>8. 기타 전자적 지급 방법에 의한 대금 지급 등<br> <br>제12조(수신확인통지?구매신청
												변경 및 취소)<br>① “몰”은 이용자의 구매신청이 있는 경우 이용자에게 수신확인통지를 합니다.<br>② 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.<br> <br>제13조(재화 등의 공급)<br>① “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.<br>② “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의?과실이 없음을 입증한 경우에는 그러하지 아니합니다.<br> <br>제14조(환급)<br>“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.<br> <br>제15조(청약철회 등)<br>① “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한
												서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다. <br>② 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.<br>&nbsp; 1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)<br>&nbsp; 2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우<br>&nbsp; 3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우<br>&nbsp; 4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우<br>③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.<br>④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시?광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.<br> <br>제16조(청약철회 등의 효과)<br>① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래
												등에서의 소비자보호에 관한 법률 시행령」제21조의2에서 정하는 지연이자율(괄호 부분 삭제)을 곱하여 산정한 지연이자를 지급합니다.<br>② “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.<br>③ 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시?광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.<br>④ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.<br> <br>제17조(개인정보보호)<br>① “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다. <br>② “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.<br>③ “몰”은 이용자의 개인정보를 수집?이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. <br>④ “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용?제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.<br>⑤ “몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야
												하는 경우에는 개인정보보호 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조제2항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.<br>⑥ 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.<br>⑦ “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 처리하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.<br>⑧ “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.<br>⑨ “몰”은 개인정보의 수집?이용?제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집?이용?제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집?이용?제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.<br> <br>제18조(“몰“의 의무)<br>① “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화?용역을 제공하는데 최선을 다하여야 합니다.<br>② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의
												개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.<br>③ “몰”이 상품이나 용역에 대하여 「표시?광고의 공정화에 관한 법률」 <br>제3조 소정의 부당한 표시?광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.<br>④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.<br> <br>제19조(회원의 ID 및 비밀번호에 대한 의무)<br>① 제17조의 경우를 제외한 ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.<br>② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.<br>③ 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.<br> <br>제20조(이용자의 의무)<br>이용자는 다음 행위를 하여서는 안 됩니다.<br>1. 신청 또는 변경시 허위 내용의 등록<br>2. 타인의 정보 도용<br>3. “몰”에 게시된 정보의 변경<br>4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시<br>5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해<br>6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위<br>7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위<br> <br>제21조(연결“몰”과 피연결“몰” 간의 관계)<br>① 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.<br>②
												연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.<br> <br>제22조(저작권의 귀속 및 이용제한)<br>① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.<br>② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.<br>③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.<br> <br>제23조(분쟁해결)<br>① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치?운영합니다.<br>② “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.<br>③ “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시?도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.<br> <br>제24조(재판권 및 준거법)<br>① “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.<br>② “몰”과 이용자 간에 제기된 전자상거래
												소송에는 한국법을 적용합니다.<br> <br>부 칙(시행일) 이 약관은 년 월 일부터 시행합니다. 부 칙(시행일) 이 약관은 년 월 일부터 시행합니다.
											</p>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" style="background: #1f598c; cursor: pointer; font-weight: bold; font-size: 20px; color: white;" id="headingTwo">
										<div class="row">
											<div align="left" class="test col-10" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">[필수] 개인정보 수집 및 이용 동의</div>
											<div align="right" class="test col-2">
												<label for="checkbox2"><span class="chkText">동의 안함</span></label> <input class="input_chk chkbox" type="checkbox" onclick="chkAction();" id="checkbox2" name="chkBox">
											</div>
										</div>
									</div>
									
									<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
										<div class="card-body">
											<p>
												1. 개인정보 수집목적 및 이용목적<br>가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산<br>콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 , 금융거래 본인 인증 및 금융 서비스<br>나. 회원 관리<br>회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달<br> <br>2. 수집하는 개인정보 항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보<br> <br>3. 개인정보의 보유기간 및 이용기간<br>원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다.<br>가. 회사 내부 방침에 의한 정보 보유 사유<br>o 부정거래 방지 및 쇼핑몰 운영방침에 따른 보관 : OO년<br>나. 관련 법령에 의한 정보보유 사유<br>o 계약 또는 청약철회 등에 관한 기록<br>-보존이유 : 전자상거래등에서의소비자보호에관한법률<br>-보존기간 : 5년<br>o 대금 결제 및 재화 등의 공급에 관한 기록<br>-보존이유: 전자상거래등에서의소비자보호에관한법률<br>-보존기간 : 5년&nbsp;<br>o 소비자 불만 또는 분쟁처리에 관한 기록<br>-보존이유 : 전자상거래등에서의소비자보호에관한법률<br>-보존기간 : 3년&nbsp;<br>o 로그 기록&nbsp;<br>-보존이유: 통신비밀보호법<br>-보존기간 : 3개월<br>
												<br>※ 동의를 거부할 수 있으나 거부시 회원 가입이 불가능합니다.
											</p>
										</div>
									</div>
								</div>
								<div class="card">
									<div class="card-header" style="background: #1f598c; cursor: pointer; font-weight: bold; font-size: 20px; color: white;" id="headingThree">
										<div class="row">
											<div align="left" class="test col-10" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">[선택] 쇼핑정보 수신 동의</div>
											<div align="right" class="test col-2">
												<label for="checkbox3"><span class="chkText">동의 안함</span></label> <input class="input_chk chkbox" type="checkbox" onclick="chkAction();" id="checkbox3" name="chkBox">
											</div>
										</div>
									</div>
							
									<div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
										<div class="card-body">
											<p>
												할인쿠폰 및 혜택, 이벤트, 신상품 소식 등 쇼핑몰에서 제공하는 유익한 쇼핑정보를 SMS와 이메일로 받아보실 수 있습니다.<br> 단, 주문/거래 정보 및 주요 정책과 관련된 내용은 수신동의 여부와 관계없이 발송됩니다.<br> 선택 약관에 동의하지 않으셔도 회원가입은 가능하며, 회원가입 후 회원정보수정 페이지에서 언제든지 수신여부를 변경하실 수 있습니다.<br>
											</p>
										</div>
									</div>
								</div>
			</div>
						</div>
						<!-- 아코디언 메뉴-->
						<br><br>
					</div>
					
					<!-- 오른쪽 공백 -->
					<div class="test col-2"></div>
				
				</div>		
			</div>
		</form>
		<div class="test col-12" align="center">
			<button type="button" id="insertMember" class="btn btn-default col-3" style="background: #1f598c; color: white;" onclick="joinSubmit();">회 원 가 입</button>&nbsp; 
			<input type="reset" value="회 원 가 입 취소" class="btn btn-default col-3" onclick="goMain();" style="background: #F2F1DF; color: black;">
		</div>
		
		<!-- ------------------------- 스 크 립 트 구문  -->

		<script>
  			// 우편번호 찾기 찾기 화면을 넣을 element
  			var element_wrap = document.getElementById('wrap');

 		 	function foldDaumPostcode() {
    		// iframe을 넣은 element를 안보이게 한다.
    			element_wrap.style.display = 'none';
 			}

  			function sample3_execDaumPostcode() {
    		// 현재 scroll 위치를 저장해놓는다.
    			var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
    			new daum.Postcode({
      				oncomplete: function (data) {
        			// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
        			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        			var addr = ''; // 주소 변수
        			var extraAddr = ''; // 참고항목 변수

        				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
          					addr = data.roadAddress;
        				} else { // 사용자가 지번 주소를 선택했을 경우(J)
         					addr = data.jibunAddress;
        				}

        				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        				if (data.userSelectedType === 'R') {
          				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
          				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            					extraAddr += data.bname;
          					}
          					// 건물명이 있고, 공동주택일 경우 추가한다.
          					if (data.buildingName !== '' && data.apartment === 'Y') {
            					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          					}
          					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
          					if (extraAddr !== '') {
           	 					extraAddr = ' (' + extraAddr + ')';
          					}
          					// 조합된 참고항목을 해당 필드에 넣는다.
          					// document.getElementById("sample3_extraAddress").value = extraAddr;
	
        				} else {
          				// document.getElementById("sample3_extraAddress").value = '';
        				}

        					// 우편번호와 주소 정보를 해당 필드에 넣는다.
        					document.getElementById('address1').value = data.zonecode;
        					document.getElementById("address2").value = addr + extraAddr;
        					// 커서를 상세주소 필드로 이동한다.
        					document.getElementById("address3");

        					// iframe을 넣은 element를 안보이게 한다.
       						// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
        					element_wrap.style.display = 'none';
      				},
      				// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
      				onresize: function (size) {
        				element_wrap.style.height = size.height + 'px';
      				},
      				width: '100%',
      				height: '100%'
    			}).embed(element_wrap);

    			// iframe을 넣은 element를 보이게 한다.
    			element_wrap.style.display = 'block';
  			}
		</script>

		<!-- 체크박스 클릭 이벤트 리스너 -->
		<script>
		function oneCheck(a){
	    		var allChkBox = $("[name=allChk]");
	    		var chkBoxName = $(a).attr("name");
	 
	    		if($(a).prop("checked")){
	        		checkBoxLength = $("[name="+ chkBoxName +"]").length;
	         		//전체체크박스 수(모두동의하기 체크박스 제외)
	        		checkedLength = $("[name="+ chkBoxName +"]:checked").length;
	        		//체크된 체크박스 수 
	        		if(checkBoxLength == checkedLength){
						allChkBox.prop("checked", true);
	            		//전체체크박스수 == 체크된 체크박스 수 같다면 모두체크
	 				} else {
	            	allChkBox.prop("checked", false);
					}
	    		} else {
	        		allChkBox.prop("checked", false);
	    		}
			}
	 
			$(function(){
	    		$("[name=allChk]").click(function(){
	        		allCheck(this);
	        		//모두동의하기 체크박스 클릭시
	    		});
	    		$("[name=chkBox]").each(function(){
	        		$(this).click(function(){
	           	 		oneCheck(this);
	        		});
	    		});
			});


			// 동의함 체크박스 
			function chkAction() {

        		var chk = $(".chkbox");

				for (var i = 0; i < chk.length; i++) {
					if (chk[i].checked == true) {
						chk[i].previousElementSibling.innerText = '동의함';
					} else {
       	    	     	chk[i].previousElementSibling.innerText = '동의 안함';
					}
				}
			}

			// 전체 선택 체크박스
			function chkAll() {
      	  		var chkAll = $(".allChk");
        		var chk = $(".chkbox");

    	   		if (chkAll[0].checked == true) {
					for (var i = 0; i < chk.length; i++) {
						chk[i].checked = true;
        	            chk[i].previousElementSibling.innerText = '동의함';
					}
				} else {
					for (var i = 0; i < chk.length; i++) {
       	             	chk[i].checked = false;
        	            chk[i].previousElementSibling.innerText = '동의 안함';
					}
				}
			}   
		</script>
		<!-- 체크박스 클릭 이벤트 리스너 -->

		<!-- 정규 표현식 스크립트 -->
		<script>
			$(function () {
				// 이름 정규 표현식
				$("#name").change(function () {
					var regExp = /^[가-힣]{2,}$/;

					if (!regExp.test($(this).val())) {
						// 사용자가 잘 못 입력했을때
						$("#nameresult").html("한글로 2자 이상 입력하세요").css("color", "red");
               		 	$(this).val(''); // 지움
                		$(this).focus().css("background", "skyblue");
					} else {
						$("#nameresult").html("정상 입력").css("color", "blue");
						$(this).css("background", "white");
					}
				});

				// 비밀번호 일치 여부
				$('#pwd').keyup(function(){
					$('#pwdresult').html('');
				});
				
				$('#pwdChk').keyup(function(){
					if($('#pwd').val() != $('#pwdChk').val()){
						$('#pwdresult').html('비밀번호가 일치하지 않습니다.');
						$('#pwdresult').attr('color', 'red');
					} else{
						$('#pwdresult').html('비밀번호가 일치합니다.');
						$('#pwdresult').attr('color', 'blue');
					}
				});
                
				// 비밀번호 정규표현식
				$("#pwd").on('change', function () {
					var regex = /(?=.*\d)(?=.*[a-z]).{6,12}/;
                     
					if (!regex.test($(this).val())) {
						$("#pwdresult").html("숫자와 문자 포함 형태의 6~12자리 이내로 입력해주세요").css("color", "red");
						$(this).val('');
						$(this).focus().css("background", "skyblue");
					} else {
						$("#pwdresult").html("정상 입력").css("color", "blue");
						$(this).css("background", "white");
					}
				});

				// 아이디 정규표현식
				$("#userid").change(function () {
					var regExp = /(?=.*\d)(?=.*[a-z]).{4,16}/;

					if (!regExp.test($(this).val())) {
						// 사용자가 잘 못 입력했을때
						$("#userIdresult").html("영문소문자/숫자, 4~16자로 <br>입력하세요.").css("color", "red");
						$(this).val(''); // 지움
						$(this).focus().css("background", "skyblue");
					} else {
						$("#userIdresult").html("정상 입력  ※중복확인필수→").css("color", "blue");
						$(this).css("background", "white");
					}
				});   
			});
		</script>
		<!-- 정규 표현식 스크립트 -->

		<script>
			// 회원가입 폼에 빈칸이 있을 시 submit 안되게 하고 알림창으로 알려주기
			function joinSubmit() {
			//	var chkAll = $(".allChk");
			//	var chk = $(".chkbox");
				var form = document.joinForm;
	
				if( $("#userid").val() == null || $("#userid").val() == ""){
  					alert('아이디를 입력해주세요');
  					$("#userid").focus();
				} else if( $("#pwd").val() == null || $("#pwd").val() == "" ){
					alert('비밀번호를 입력해주세요');
					$("#pwd").focus();
				}else if( $("#pwdChk").val() == null || $("#pwdChk").val() == "" ){
					alert('비밀번호를 다시 한번 더 입력해주세요');
					$("#pwdChk").focus();
				} else if( $("#name").val() == null || $("#name").val() == "" ){
					alert('이름을 입력해주세요');
					$("#name").focus();
				} else if( $("#phone2").val() == null || $("#phone2").val() == "" ){
					alert('핸드폰 번호를 입력해주세요');
					$("#phone2").focus();
				} else if( $("#phone3").val() == null || $("#phone3").val() == "" ){
					alert('핸드폰 번호를 입력해주세요');
					$("#phone3").focus();
				} else if( $("#email1").val() == null || $("#email1").val() == "" ){
					alert('이메일을 입력해주세요');
					$("#email1").focus();
				} else if( checkbox1.checked != true || checkbox2.checked != true ){
					alert('약관에 동의를 해주세요');
				} else if(form.idCheck.value == "idUnchk"){
					alert('중복확인을 해주세요');
  					$("#check_id").focus();
				} else{
					if(window.checkDu){
  						$('#joinForm').submit();
					}
				}
			}
		
			// 입력폼 엔터키 눌렀을때 submit 막기
			document.addEventListener('keydown', function(event) {
				if (event.keyCode === 13) {
					event.preventDefault();
				}
			}, true);

			// 회원가입 취소
			function goMain() {
				var result = confirm("입력하신 회원정보가 지워집니다. 회원가입을 취소하시겠습니까?");
				if (result) {
					location.href = "<%=request.getContextPath()%>/index.jsp";
				}
			}
				
			var checkDu=false;
			
			// 아이디 중복체크
        	function joinIdChk(){
				var userId = $("#joinForm input[name='memberId']");
			
				if(userId.val().length<4){
					alert("최소 영문소문자/숫자 4자 이상이어야 합니다.");
					userId.focus();
				}else{
					$.ajax({
						url:"<%=request.getContextPath()%>/joinIdChk.me",
						type:"post",
						data:{userId:userId.val()},
						success:function(data){
							if(data=="permit"){
								alert("아이디를 사용 하실 수 있습니다.");
								document.joinForm.idCheck.value = "idChk";
								window.checkDu=true;
							}else{
								alert("아이디가 중복됩니다. 다시 입력해주세요");
								userId.focus();
								$("input[name='memberId']").val('');	// 입력값 초기화
								window.checkDu=false;
							}
						},
						error:function(request,status,error){
					    	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						}
					});
				}
			}
		</script>
		
		<%@ include file="../common/footer.jsp"%>
		
	</body>
</html>