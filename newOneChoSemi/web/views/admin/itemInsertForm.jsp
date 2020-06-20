<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>

  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
    integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <!--title icon-->
    <link rel="shortcut icon" type="image⁄x-icon" href="<%=request.getContextPath() %>/images/logo.png">
    <title>Cho-당신을 위한 반려식물</title>
    
    <!--icon-->
    <script src="https://kit.fontawesome.com/4b6b63d8f6.js" crossorigin="anonymous"></script>

    
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


  </style>


</head>

<body>

	<%@include file="../common/header.jsp" %>
 
 
 
  <section>
    
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
              <a class="d-flex align-items-center text-muted" href="#">
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
          
           <li class="nav-item">
            <a class="nav-link" href="#" onclick="location.href='<%=request.getContextPath()%>/list.st'">
              <span data-feather="shopping-cart"></span>
             	 통계
            </a>
          </li>
          
        </ul>
          </div>
        </nav>

          <!--vertical nav 끝-->
 

          <!--form 시작-->
          
        <div class="col-9">
            <div class="container-fluid">
            <h1 style="margin-top: 30px;margin-bottom: 80px; text-align: left;">상품등록</h1>

      
            <form class="needs-validated" id="createItem" method="post" encType="multipart/form-data" action="<%=request.getContextPath()%>/insert.it" onsubmit="return iivalidate();">

                <div class="mb-3">
                    <label for="validationServer02">카테고리&키워드</label>
                    <div class="row" style="margin: 0;">
                        <div class="col" style="padding: 0; text-align: center;">
                            <div class="input-group is-invalid">
                                <div class="input-group-prepend">
                                  <label class="input-group-text" for="category">카테고리</label>
                                </div>
                                <select class="custom-select" name="category" id="category" required>
                                  <option value="none">...</option>
                                  <option value="HANGING">HANGING</option>
                                  <option value="WATER">WATER</option>
                                  <option value="SOIL">SOIL</option>
                                 
                                </select>
                              </div>
                        </div>

                        <div class="col" style="margin-left: 10px;">
                            <div class="input-group is-invalid">
                                <div class="input-group-prepend">
                                  <label class="input-group-text" for="keyword">키워드</label>
                                </div>
                                <select class="custom-select" name="keyword" id="keyword" required>
                                  <option value="none">...</option>
                                  <option value="K1">산소뿜뿜</option>
                                  <option value="K2">반려동물 친화</option>
                                  <option value="K3">산소뿜뿜&반려동물 친화</option>
                                  
                                </select>
                              </div>
                        </div>

                    </div>
                </div>

                <div class="mb-3" style="margin-top: 40px;">
                    <label for="itemName">상품명</label>
                    <div class="input-group">
                    <input type="text" class="form-control is-invalid" id="itemName" name="itemName" placeholder="상품명을 입력하세요." required style="display: inline;">
                    <div class="input-group-append">
                    	<button class="btn btn-outline-secondary" onclick="itemNameCheck()" type="button" style="background-color: #1f598c;color: white;">중복확인</button>
                    </div>
                    <div class="invalid-feedback">
                      	한글로 3자 이상 입력하세요.
                    </div>
                    </div>
                   
                  </div>

                <script>
                
               
                
                  $(function(){
                    $("#itemName").keyup(function(){
                    
                     window.flag=false;


                      var regExp1=/^[가-힣]{3,}$/;

                      if(regExp1.test($(this).val())){
                        $("#itemName").addClass("is-valid");
                        $("#itemName").removeClass("is-invalid");

                        
                      }else{
                        $("#itemName").removeClass("is-valid");
                        $("#itemName").addClass("is-invalid");
                      }
                    })

                  })
                </script>
                <script>
                
                 var flag=true;
                 
                 function itemNameCheck(){
                	 
                	 
                	 
                	 var itemName=$("#createItem input[name='itemName']");
                	 
                	 if(itemName.val().length<3){
                		 alert("상품명이 너무 짧은거 아닌가요?ㅠㅠ")
                		 
                		 
                	 }else{
                		 
                		 console.log("ajax 구동!")
                		 
                		 
                		 $.ajax({
         					url:"<%=request.getContextPath()%>/nameCheck.it",
         					type:"POST",
         					data:{itemName:itemName.val()},
         					success:function(data){
         						
         						if(data=="permit"){
         							alert("사용 가능한 이름이에요~^^*");
         							window.flag=true;
         							
         						}else{
         							alert("중복되는 이름이에요ㅠㅠ다시 작명해봐요~");
         							window.flag=false;
         						}
         					},
         					 error:function(request,status,error){
             	                alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
             	            }
         				});
                		 
                		 
                	 }
                	 
                 }
                
                
                </script>


                  <div class="mb-3" style="margin-top: 40px;">
                    <label for="price">가격</label>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text">&#8361;</span>
                      </div>
                    <input type="number" min="0" class="form-control is-invalid" id="price" name="price" placeholder="정가를 입력하세요." required>
                    
                    <div class="invalid-feedback">
                      	숫자를 입력하세요.
                    </div>
                  </div>
                  </div>

                  <script>
                    $(function(){
                      $("#price").keyup(function(){

                        var regExp2=/^[0-9]{1,}$/;

                        if(regExp2.test($("#price").val())){
                          $("#price").addClass("is-valid");
                          $("#price").removeClass("is-invalid");
                        }else{
                          $("#price").addClass("is-invalid");
                          $("#price").removeClass("is-valid");
                        }

                        //가격을 수정하면 할인가 다시 체크..
                        var price=$("#price").val();
                        var discount=$("#discount").val();
                        if(price<=discount&&discount!=""){
                        
                        $("#discount").removeClass("is-valid");
                        $("#discount").addClass("is-invalid");
                        }

                      })
                    })
                  </script>

                  <div class="mb-3" style="margin-top: 40px;">
                    <label for="discount">할인</label>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <span class="input-group-text">&#8361;</span>
                      </div>
                    <input type="number" min="0" class="form-control is-invalid" id="discount" name="discount" placeholder="할인가를 입력하세요." required>
                    <div class="invalid-feedback">
                       	 정가보다 큰 금액은 입력할 수 없어요.
                    </div>
                   </div>
                  </div>


                  <script>



                      $("#discount").keyup(function(){

                      var discount=parseInt($("#discount").val());
                      var price=parseInt($("#price").val());

                      console.log(typeof(discount));
                      console.log(typeof(price));
                      console.log(discount);
                      console.log(price);

                      var regExp3=/^[0-9]{1,}$/;

                      if(regExp3.test($("#discount").val())){

                        if(discount<price){
                          $("#discount").addClass("is-valid");
                          $("#discount").removeClass("is-invalid");
                        }else{
                          $("#discount").addClass("is-invalid");
                          $("#discount").removeClass("is-valid");
                          $("#discount").next().text("정가보다 큰 금액은 입력할 수 없어요.");
                        }

                      }else{
                        $("#discount").addClass("is-invalid");
                        $("#discount").removeClass("is-valid");
                        $("#discount").next().text("숫자를 입력하세요.");
                      }

  
                      });

                  
                  </script>
                  
                  
               
                  
                  <div class="mb-3" style="margin-top: 40px;">
                    <label for="maxbuy">최대 구매 수량</label>
                    <div class="input-group mb-3">
                    <input type="number" min="0" class="form-control is-invalid" id="maxbuy" name="maxbuy" placeholder="최대 구매 수량을 입력하세요." required>
                    <div class="input-group-append">
                      <span class="input-group-text">개</span>
                    </div> 
                    <div class="invalid-feedback">
                      	숫자를 입력하세요.
                    </div>
                    </div>
                    
                  </div>
                  <script>

                    $(function(){

                      $("#maxbuy").keyup(function(){

                        var regExp4=/^[0-9]{1,}$/;
  
                        if(regExp4.test($("#maxbuy").val())){
                          $("#maxbuy").removeClass("is-invalid");
                          $("#maxbuy").addClass("is-valid");
                        }else{
                          $("#maxbuy").removeClass("is-valid");
                          $("#maxbuy").addClass("is-invalid");
                        }


                      })


                    });
                  </script>
                  
                  

                  <div class="mb-3" style="margin-top: 40px;">
                    <label for="stock">재고수량</label>
                    <div class="input-group mb-3">
                    <input type="number" min="0" class="form-control is-invalid" id="stock" name="stock" placeholder="재고 수량을 입력하세요." required>
                    <div class="input-group-append">
                      <span class="input-group-text">개</span>
                    </div> 
                    <div class="invalid-feedback">
                      	숫자를 입력하세요.
                    </div>
                    </div>
                    
                  </div>
                  <script>

                    $(function(){

                      $("#stock").keyup(function(){

                        var regExp4=/^[0-9]{1,}$/;
  
                        if(regExp4.test($("#stock").val())){
                          $("#stock").removeClass("is-invalid");
                          $("#stock").addClass("is-valid");
                        }else{
                          $("#stock").removeClass("is-valid");
                          $("#stock").addClass("is-invalid");
                        }


                      })


                    });
                  </script>
                  
                 

                  
                  

                <div class="mb-3" style="margin-top: 40px;">
                  <label for="validationTextarea">상세설명</label>
                  <textarea class="form-control" id="itemInfo" name="itemInfo" maxlength="1000" placeholder="제품에 대한 설명을 적으세요." required></textarea>
                </div>
                <div id="countText"><span>0</span>/<span>1000</span></div>
                <script>
                  $(function(){

                    $("#itemInfo").keyup(function(){

                      var count=$("#itemInfo").val().length;

                      $("#countText").children('span').first().text(count);

                    })

                     
                  })

                </script>

                <div class="mb-3" style="margin-top: 40px;">
                <label class="my-1 mr-2" for="inlineFormCustomSelectPref">상태</label>
                <div class="input-group is-invalid">
                    <div class="input-group-prepend">
                      <label class="input-group-text" for="display">전시유무</label>
                    </div>
                    <select class="custom-select" id="display" name="display" required>
                      <option value="none">...</option>
                      <option value="Y">전시중</option>
                      <option value="N">전시중지</option>
                    </select>
                  </div>
                  <div id="warning" style="display: none;">
                    	주의하세요! 전시중지를 할 경우, 상품이 노출되지 않아요.
                </div>
                </div>
                <script>

                  $(function(){

                    $("#display").change(function(){


                      var selected=$("#display").children("option:selected");
  
                      console.log(selected.text());
                      if(selected.text()=="전시중지"){
  
                        console.log("경고");
  
                        $("#warning").css({"display":"block","color":"#d9534f","font-size":"13px"});
                      }
                    })
                  })
                </script>
              
               
              
              <div class="mb-3" style="margin-top: 40px;">
                <label>대표이미지</label>
                
                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="fileadd01">대표이미지</span>
                  </div>
                  <div class="custom-file">
                    <input type="file" class="custom-file-input" id="mainImg" name="mainImg" aria-describedby="fileadd01" accept="image/*" onchange="loadFile(event)">
                    <label class="custom-file-label" for="mainImg">파일을 선택하세요.</label>
                  </div>
                </div>
              
              <script>
                  //img 넣으면 파일 명 뜨도록 
                  $(function(){
                  $("#mainImg").change(function(){
                    console.log($("#mainImg").val());
                    var fileName=$("#mainImg").val();

                    $("#mainImg").next().text(fileName);
                    $("#mdroplabel").text(fileName);
                  })

                  $('button[type=reset]').click(function(){

                    $("#mainImg").next().text("파일을 선택하세요.");
                    $("#mdroplabel").text("이 곳에 파일을 드랍해주세요...");
                  })
                })

              </script>
              <script>

                //버튼으로 로드했을 때 프리뷰
                function loadFile(event){

                  document.getElementById("mpreview").style.display="block";
                  var reader=new FileReader();
                  reader.onload=function(){

                    var preview=document.getElementById("mpreview");
                    preview.src=reader.result;
                  };

                  reader.readAsDataURL(event.target.files[0]);


                };
              </script>
                  
                 <input type="hidden" id="mSource" name="mSource">
                 <div id="mdropbox"  name="mdropbox" style="width: 100%px; height: 80px; border: 1px solid #aaa;display:none;">
                  <span id="mdroplabel">
                	  이곳에 파일을 드랍해 주세요...
                  </span>
                  </div>
                  <img id="mpreview" alt="[ 미리보기 ]" style="width: 500px;height: 500px; display: none;" />
                  <script type="fa3898d29a40d8110dc3b800-text/javascript">
                      function dragEnter(event) {
                        event.stopPropagation();
                        event.preventDefault();
                      }
                      function dragExit(event) {
                        event.stopPropagation();
                        event.preventDefault();
                      }
                      function dragOver(event) {
                        event.stopPropagation();
                        event.preventDefault();
                      }
                      function drop(event) {
                        event.stopPropagation();
                        event.preventDefault();
                        
                        var files = event.dataTransfer.files;
                        var count = files.length;
                        
                        // 오직 한개 이상의 파일이 드랍된 경우에만 처리기를 호출한다.
                        if (count > 0)
                          handleFiles(files);
                      }

                      function handleFiles(files) {
                        var file = files[0];
                        
                        document.getElementById("mdroplabel").innerHTML = file.name;
						$("#mainImg").val(file.name);
                        $("#mainImg").next().text(file.name);

                        
                        var reader = new FileReader();
                        
                        // 파일 리더의 이베트 핸들러 정의
                        reader.onloadend = handleReaderLoadEnd;
                        
                        // 파일을 읽는 작업 시작
                        reader.readAsDataURL(file);
                      }

                      function handleReaderLoadEnd(event) {
                        document.getElementById("mpreview").style.display="block";
                        var img = document.getElementById("mpreview");
                        img.src = event.target.result;
						$("#mSource").val(img.src);
                        
                        console.log(img.src);
                      }

                      var dropbox = document.getElementById("mdropbox")
                      
                      // 이벤트 핸들러 할당
                      dropbox.addEventListener("dragenter", dragEnter, false);
                      dropbox.addEventListener("dragexit", dragExit, false);
                      dropbox.addEventListener("dragover", dragOver, false);
                      dropbox.addEventListener("drop", drop, false);
                    </script>
                    <script src="https://ajax.cloudflare.com/cdn-cgi/scripts/7089c43e/cloudflare-static/rocket-loader.min.js" data-cf-settings="fa3898d29a40d8110dc3b800-|49" defer=""></script>
                      
                      
              
              <div class="mb-3" style="margin-top: 40px;">
                <label>세부이미지</label>

                <div class="input-group mb-3">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="fileadd02">상세이미지</span>
                  </div>
                  <div class="custom-file">
                    <input type="file" class="custom-file-input" id="subImg" name="subImg" aria-describedby="fileadd02" accept="image/*" onchange="loadSubFile(event)">
                    <label class="custom-file-label" for="subImg">파일을 선택하세요.</label>
                  </div>
                </div>
              </div>
              <script>
                $(function(){
                  $("#subImg").change(function(){
                    console.log($("#subImg").val());
                    var fileName=$("#subImg").val();

                    $("#subImg").next().text(fileName);
                    $("#sdroplabel").text(fileName);
                  })

                  $('button[type=reset]').click(function(){

                    $("#subImg").next().text("파일을 선택하세요.");
                    $("#sdroplabel").text("이 곳에 파일을 드랍해주세요...");
                  })
                })

              </script>
              <script>

                //버튼으로 로드했을 때 프리뷰
                function loadSubFile(event){

                  document.getElementById("spreview").style.display="block";
                  var reader=new FileReader();
                  reader.onload=function(){

                    var preview=document.getElementById("spreview");
                    preview.src=reader.result;
                  };

                  reader.readAsDataURL(event.target.files[0]);


                };
              </script>
				 <input type="hidden" id="sSource" name="sSource">
                 <div id="sdropbox"  name="sdropbox" style="width: 100%px; height: 80px; border: 1px solid #aaa;display:none;">
                  <span id="sdroplabel">
                  	이곳에 파일을 드랍해 주세요...
                  </span>
                  </div>
                  <img id="spreview" alt="[ 미리보기 ]" style="width: 500px;height: 500px; display: none;" />
                  <script type="fa3898d29a40d8110dc3b800-text/javascript">
                      function dragEnter(event) {
                        event.stopPropagation();
                        event.preventDefault();
                      }
                      function dragExit(event) {
                        event.stopPropagation();
                        event.preventDefault();
                      }
                      function dragOver(event) {
                        event.stopPropagation();
                        event.preventDefault();
                      }
                      function drop(event) {
                        event.stopPropagation();
                        event.preventDefault();
                        
                        var files = event.dataTransfer.files;
                        var count = files.length;
                        
                        // 오직 한개 이상의 파일이 드랍된 경우에만 처리기를 호출한다.
                        if (count > 0)
                          handleFilesS(files);
                      }

                      function handleFilesS(files) {
                        var file = files[0];
                        
                        document.getElementById("sdroplabel").innerHTML = file.name;
						$("#subImg").val(file.name);
                        $("#subImg").next().text(file.name);

                        
                        var reader = new FileReader();
                        
                        // 파일 리더의 이베트 핸들러 정의
                        reader.onloadend = handleReaderLoadEndS;
                        
                        // 파일을 읽는 작업 시작
                        reader.readAsDataURL(file);
                      }

                      function handleReaderLoadEndS(event) {
                        document.getElementById("spreview").style.display="block";
                        var img = document.getElementById("spreview");
                        img.src = event.target.result;
						$("#sSource").val(img.src);
                      }

                      var sdropbox = document.getElementById("sdropbox")
                      
                      // 이벤트 핸들러 할당
                      sdropbox.addEventListener("dragenter", dragEnter, false);
                      sdropbox.addEventListener("dragexit", dragExit, false);
                      sdropbox.addEventListener("dragover", dragOver, false);
                      sdropbox.addEventListener("drop", drop, false);
                    </script>

              
              <div class="container" style="text-align: center;">
                  <button class="btn btn-lg" type="submit" style="margin-top: 50px; margin-right: 30px; width: 200px;background-color: #1f598c;color: white;">상품등록</button>
                  <button class="btn btn-outline-secondary btn-lg" type="reset" style="margin-top: 50px;width: 200px;">초기화</button>
              </div>
                
                
              </form>
              
              
              
              
            </div>  
            
        
            
          
            



        </div>
            
         
            
       
      

        </div>


    </div>
   	
   
   
 	<!--내용 끝  -->
    <div class="container-fluid">
      <div class="jumbotron text-center" style="background-image:url('<%=request.getContextPath() %>/images/admin/head.jpg'); height: 300px;">
        
      </div>
    </div>



  </section>
  
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
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    
  
      <script>
    	function iivalidate(){
    		var category=$("#category").val();
    		var keyword=$("#keyword").val();
    		var display=$("#display").val();
    		
    		if(category=="none"){
    			alert("카테고리를 선택해주세요.");
    			return false;
    		}
    		
    		if(keyword=="none"){
    			alert("키워드를 선택해주세요.");
    			return false;
    		}
    		
    		if(display=="none"){
    			alert("전시상태를 선택해주세요.");
    			return false;
    		}
    		
    		if(!window.flag){
    			
    			alert("이름 중복 확인을 해주세요.");
    			return false;
    		}
    		
    		if($("#mainImg").val()==""){
    			
    			alert("메인이미지를 등록해주세요.");
    			return false;
    		}
    		
    		if($("#subImg").val()==""){
    			
    			alert("상세이미지를 등록해주세요.");
    			return false;
    		}
    		
    		
    	}
    
    </script>
    <script>
    
    	$('button[type=reset]').click(function(){
        $("#countText").children('span').first().text('0');
        document.getElementById("mpreview").style.display="none";
        document.getElementById("spreview").style.display="none";
        
        
      });
    
    </script>
    
    
 

  <%@ include file="../common/footer.jsp" %>
  
 

    
 
    
   

</body>
</html>