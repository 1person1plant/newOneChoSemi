<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width" initial-scale="1">
    <title>Cho-당신을 위한 반려식물</title>
    <!--타이틀 아이콘-->
    <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath() %>/images/logo.png">

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
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        * { font-family: "basicFont"; }
        /* font end */
    </style>
    
    <!-- 아라 스타일 적용 -->
	<style>
	  /* 버튼 스타일 적용 */
	  #ara-btn-default{
	    background: #1f598c; color:white;
	  }
	
	  .ara-label-text{
	    padding-top: 6px;
	    text-align: right;
	  }
	</style>
	<!-- 아라 스타일 적용 -->
    
</head>
<body>

  <%@ include file="../common/header.jsp"%>
  
    <!-- 아라 _ 계정찾기-->
    <div class="container-fluid" style="margin-top: 80px;">
      <!-- 공백 : 내용 : 공백 =  -->
      <div class="row">
        <!-- 왼쪽공백 -->
        <div class="test col-md-3"></div>
  
        <div class="test col-md-6" style="padding: 0px;">
          <div class="test col-md-12" style="margin-bottom: 50px;">
            <div class="test col-md-12">
              <h1 style="text-align-last: left;">아이디 찾기</h1>
            </div>
            <hr>
            <div class="test col-md-12">
              <p style="text-align-last: left;">회원가입 시, 입력하신 휴대폰 번호 *이메일로 아이디를 확인하실 수 있습니다</p>
            </div>
            <br>
            <div class="test col-md-12">
              <tbody>
                <tr class="user-phone">
                  <th>
                    <div class="row">
                      <div class="test col-md-2 ara-label-text">휴대폰 번호</div>
                      <div class="test col-md-8">
                        <div class="row">
                          <select id="phone1" name="phone" class="form-control" aria-describedby="basic-addon1" style="width: 20%;">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                            <option value="017">017</option>
                            <option value="018">018</option>
                            <option value="019">019</option>
                          </select>
                          <p class="ara-label-text">&nbsp;-&nbsp;</p>
                          <input id="phone2" name="phone" type="text" maxlength="4" class="form-control" aria-describedby="basic-addon1"
                            style="width: 20%;"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                          <p class="ara-label-text">&nbsp;-&nbsp;</p>
                          <input id="phone3" name="phone" type="text" maxlength="4" class="form-control" aria-describedby="basic-addon1"
                            style="width: 20%;"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                        </div>
                      </div>
                      <div class="test col-md-2"></div>
                    </div>
                  </th>
                </tr>
                <br>
                <tr class="user-email">
                  <th>
                    <div class="row">
                      <div class="test col-md-2 ara-label-text">이메일</div>
                      <div class="test col-md-8">
                        <div class="row">
                          <input id="email1" name="email" type="email" class="form-control" aria-describedby="basic-addon1"
                            style="width: 150px;">
                          <p class="ara-label-text">&nbsp;@&nbsp;</p>
                          <select id="email2" name="email" class="form-control" aria-describedby="basic-addon1" style="width: 150px;">
                            <option value="email">naver.com</option>
                            <option value="email">daum.net</option>
                            <option value="email">gmail.com</option>
                            <option value="email">nate.com</option>
                            <option value="email">hanmail.net</option>
                          </select>
                        </div>
                      </div>
                      <div class="test col-md-2"></div>
                    </div>
                  </th>
                </tr>
              </tbody>
            </div>
            <div class="row">
              <div class="test col-md-8"></div>
              <div class="test col-md-4">
                <button type="button" class="btn btn-default" id="ara-btn-default">아이디 찾기</button>
              </div>
            </div>
          </div>

          <div class="test col-md-12">
            <div class="test col-md-12">
              <h1 style="text-align-last: left;">비밀번호 찾기</h1>
            </div>
            <hr>
            <div class="test col-md-12">
              <p style="text-align-last: left;">가입하신 아이디 *이메일 입력, 본인 인증을 통해 이메일로 임시 비밀번호를 보내드립니다. 
                                                  <br>확인 후 로그인 하셔서 반드시 비밀번호를 변경하시기 바랍니다.</p>
            </div>
            <br>
            <div class="test col-md-12">
              <tbody>
                <tr class="user-id">
                  <th>
                    <div class="row">
                      <div class="test col-md-2 ara-label-text">아이디</div>
                      <div class="test col-md-4">
                        <div class="row">
                          <input type="text" class="form-control" placeholder="아이디를 입력하세요" aria-describedby="basic-addon1">
                        </div>
                      </div>
                      <div class="test col-md-6"></div>
                    </div>
                  </th>
                </tr>
                <br>
                <tr class="user-email">
                  <th>
                    <div class="row">
                      <div class="test col-md-2 ara-label-text">이메일</div>
                      <div class="test col-md-8">
                        <div class="row">
                          <input id="email1" name="email" type="email" class="form-control" aria-describedby="basic-addon1"
                            style="width: 150px;">
                          <p class="ara-label-text">&nbsp;@&nbsp;</p>
                          <select id="email2" name="email" class="form-control" aria-describedby="basic-addon1" style="width: 150px;">
                            <option value="email">naver.com</option>
                            <option value="email">daum.net</option>
                            <option value="email">gmail.com</option>
                            <option value="email">nate.com</option>
                            <option value="email">hanmail.net</option>
                          </select>
                        </div>
                      </div>
                      <div class="test col-md-2"></div>
                    </div>
                  </th>
                </tr>
              </tbody>
            </div>
            <div class="row">
              <div class="test col-md-8"></div>
              <div class="test col-md-4">
                <button type="button" class="btn btn-default" id="ara-btn-default">비밀번호 찾기</button>
              </div>
            </div>
          </div>

        </div>

        <!-- 오른쪽 공백 -->
        <div class="test col-md-3"></div>
      </div>
    </div>
    <div class="container-fluid"></div>
    <!-- 아라 _ 계정찾기-->

 <%@ include file="../common/footer.jsp"%>

</body>
</html>