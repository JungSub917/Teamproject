<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/notice.css">
<link rel="stylesheet" href="resources/css/header_footer.css">
<script src="resources/js/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="resources/js/Stubby.js"></script>
<script type="text/javascript" src="resources/js/header_footer.js"></script>
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
          <li><a href="Controller?command=diary">여행기</a></li>
        </ul>        
      </div>
    </div>
  </header>
        
        <div id="customer_box">
			<div class="customer_img">
			<div class="customer_main_title">고객지원</div>
			<div class="customer_sub_title">공지사항</div>
             <div style="clear:both"></div>
			</div>
        </div>
        
        <div class="customer_nav_box">
       	<ul class="customer_nav">
       	 	<li><button class="goNotice action">공지사항</button></li>
	        	<li><button class="goFanda ">자주하는 질문</button></li>
	        	<li><button class="goQanda ">문의하기</button></li>
       	</ul>
         <div style="clear:both"></div>
        </div>
        
        <a href="#top" id="top_go" class="scroll_top" style="display:none"><i></i></a>
         <div style="clear:both"></div>
        
<form action="Controller" method="get">
  <div class="notice_write_box">
    <div>제목<sup>*</sup></div>
    <div class="notice_write_title">
      <input id = "title" type="text" placeholder="제목을 입력해주세요" name="title">
   	  <input type="hidden" name ="command" value="notice_input"/>	
    </div>
    <div style="clear:both"></div>

    <div class="notice_write_content">
      <div>내용<sup>*</sup></div>
      <div style="clear:both"></div>
      <textarea id="txtContent" rows="10" cols="100" name="content"></textarea>
      <script type="text/javascript">
        var oEditors = [];
        nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "txtContent",
          sSkinURI: "resources/smarteditor/SmartEditor2Skin.html",
          fCreator: "createSEditor2",
          htParams: {
            bUseToolbar: true,
            bUseVerticalResizer: false,
            bUseModeChanger: false
          }
        });

        function save() {
          oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);
          let content = document.getElementById("txtContent").value;
          let title = document.getElementById("title").value;
          location.href = "Controller?command=notice_write_input&title="+title+"&content="+content;
          alert("공지사항 글이 등록되었습니다.");
          return;
        }
      </script>
      <div style="clear:both"></div>
    </div>

    <div class="notice_writeBtn_box fr">
      <input type="button" value="취소" onclick="location.href='Controller?command=notice_list'" />
      <input type="button" value="저장" onclick="save()" />
    </div>
    <div style="clear:both"></div>
  </div>
</form>
       
	        
	      
        
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

</body>
</html>