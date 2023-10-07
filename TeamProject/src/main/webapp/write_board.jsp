<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    int idx = 0;
	try{
// 		idx=Integer.parseInt(request.getParameter("idx"));
		idx=(int)session.getAttribute("idx");
	} catch(Exception e){
	}
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="resources/js/jquery-3.7.0.min.js"></script>
	<link rel="stylesheet" href="resources/css/header_footer.css">
	<link rel="stylesheet" href="resources/css/write_board.css">
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src="resources/js/jquery-3.7.0.min.js"></script>
	<script src="resources/js/summernote/summernote-lite.js"></script>
	<link href="resources/css/summernote/summernote-lite.css" rel="stylesheet">
	<script src="resources/js/summernote/lang/summernote-ko-KR.js"></script>
	<style>
		body{
		margin:0;
		}
	</style>
</head>
<body>
 <header>
    <div class="head_box">
      <div class="head_content">
        <div class="head_title">
          <h1><a href="Controller?command=MainPage"><img src="resources/images/stu_logo.png" alt=""></a></h1>
        </div>
         <%
      			if (session.getAttribute("userEmail") == null) {
     		%> 
         <div class="gnb_box">
           <div class="gnb_content">
             <ul>
               <li><a href="Controller?command=notice_list">고객센터</a></li>
               <li><a href="Login.jsp">로그인</a></li>
               <li><a href="Signup.jsp">회원가입</a></li>
             </ul> 
           </div>
         </div> 
         <%
            } else { 
         %> 
        <div class="gnb_box">
          <div class="gnb_content">
            <ul>
              <li><a href="Controller?command=notice_list">고객센터</a></li>
              <li class="profil"><img src="resources/images/img_pfnull.jpg"></li>
            </ul>
          </div>
	        <div class="profil_box">
	        	<ul>
	        		<li>
	        			<img src="resources/images/img_pfnull.jpg">
	        			<p>
	        			${userNickname}님 <br><span class="hi">안녕하세요.</span></p>
	        		</li>
	        		<li><a href="Controller?command=mypage">마이페이지</a></li>
	        		<li><a href="Controller?command=logout&page=1">로그아웃</a></li>
	        	</ul>
	        </div>
        </div>
        <%
           }
          %>
      </div>
    </div>
    <div class="lnb_box">
      <div class="lnb_content">
        <ul>
          <li><a href="Controller?command=MainPage">홈</a></li>
          <li><a href="Controller?command=natlist">탐색</a></li>
          <li><a href="Controller?command=tour_main">유럽투어</a></li>
          <li><a href="Controller?command=HotelMain">숙소</a></li>
          <li><a href="Controller?command=diary" class="on">여행기</a></li>
        </ul>        
      </div>
    </div>
  </header>
<div id="write_body">
	<form action="UploadServlet" id="add_diary" enctype="multipart/form-data" method="POST">
		<div id="write_title_box">
			<h2>제목 *</h2>
			<input id="user_title" name="title" type="text" placeholder="제목을 입력해 주세요">
			<div class="title_check hide"> 제목은 필수입니다.</div>
		</div>
	<div id="write_ctt_box">
		<h2>내용 *</h2>
		<textarea id="summernote" name="editordata"></textarea>
		 <div id="image_container" style="margin-top: 50px;"></div>
		 <label for="image">
		 	<div id="upload_box">
		 		<div id="btn_upload">썸네일 이미지 등록하기</div>
				<input type="file" id="image" name="file" accept="image/*" onchange="setThumbnail(event);">
		 	</div>
		 </label>
	</div>
		<div id="list_btn">
			<input type="submit" onclick="test();" id="save_btn" value="저장">
			<input type="button" id="cancel_btn" value="취소">
		</div>
	</form>
</div>
</body>
  <footer>
    <div class="util_Box">
      <div class="util_contain">
        <div class="util_content">
          <ul>
            <li><a href="#">광고/제휴문의</a></li>
            <li><a href="#">서비스문의</a></li>
            <li><a href="#">개인정보 취급방침</a></li>
            <li><a href="#">이용약관</a></li>
            <li><a href="#">여행자약관</a></li>
            <li><a href="#">가이드약관</a></li>
          </ul>
        </div>
        <div class="util_sns">
          <ul>
            <li class="stu_sns facebook"><a href="#"></a></li>
            <li class="stu_sns instagram"><a href="#"></a></li>
            <li class="stu_sns kakao"><a href="#"></a></li>
            <li class="stu_sns email"><a href="#"></a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="coInfo_Box">
      <div class="coInfo_contain">
        <div class="footer_logo"></div>
        <div class="business_info">
          <p>상상속 여행을 현실로, 스투비플래너</p>
          <address> contact: apple9568@naver.com</address>
        </div>
      </div>
    </div>
  </footer>
<script>
		/* let diary = document.getElementById("add_diary");
		function onSubmit(event){
			event.preventDefault();
			console.log(event);
		}
		diary.addEventListener("submit",onSubmit); */
		
		function test(){
			let title =$("#user_title").val();
			let ctt = $("#summernote").val();
			if(usertitle.value.length==0){
				alert("제목이 없습니다.");
			} else if(userctt.value.length==0){
				alert("내용이 없습니다.");
			} else {
				let answer = confirm("여행기를 저장하시겠습니까?");
				if(answer){
					alert("저장되었습니다.");
				};
			};
		};
	function setThumbnail(event) {
    	var reader = new FileReader();
    	reader.onload = function(event) {
      	var img = document.createElement("img");
      	img.setAttribute("src", event.target.result);
      	$("#image_container").children().remove();
      	document.querySelector("div#image_container").appendChild(img);
   
    	};
    reader.readAsDataURL(event.target.files[0]);
  }
	let usertitle = document.querySelector("#user_title");
	let userctt = document.querySelector("#summernote");
	let failureMessage = document.querySelector(".title_check");
	usertitle.addEventListener('keyup',()=>{
		if(usertitle.value.length===0){
			failureMessage.classList.remove('hide');
		}
		else if(checklength(usertitle.value)){
			failureMessage.classList.add('hide');
		}
	});
	function checklength(value){
		return value.length>=1;
	}
	$(function(){
		$(document).on("click",".note-editable",function(){
		if(usertitle.value.length===0){
			failureMessage.classList.remove('hide');
		}
		});
		$(document).on("click","#cancel_btn",function(){
			let answer=confirm("저장하지 않은 내용은 잃게 됩니다.\n커뮤니티 글쓰기 페이지에서 나가시겠습니까?")
			if(answer){
				location.href="Controller?command=diary";
			} else {
			}
			
		});
	});
	// SummerNote 에디터
	$(document).ready(function() {
		$('#summernote').summernote({
			toolbar: [
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'underline','strikethrough']],
			    ['color', ['forecolor','color']],
			    ['height', ['height']]
// 			    ['insert',['picture']],
			  ],
			  fontNames: ['맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			  height: 800,                 // 에디터 높이
			  width: 900,
			  minHeight: 800,             // 최소 높이
			  maxHeight: 800,             // 최대 높이
			  lang: "ko-KR",			// 한글 설정
			  placeholder: '내용을 입력해주세요',
			  callbacks: {
	              onImageUpload: function(image) {
	                 
		                     var file = image[0];
		                     var reader = new FileReader();
	                    	reader.onloadend = function() {
	                        var image = $('<img>').attr('src',  reader.result);
	                           image.attr('width','50%');
	                        $('#summernote').summernote("insertNode", image[0]);
	                    }
	                   reader.readAsDataURL(file);
	              }
	          }
		});
	});
</script>
</html>