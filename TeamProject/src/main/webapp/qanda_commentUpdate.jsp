<%@page import="dto.QandaDto"%>
<%@page import="dao.QandaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int qno = Integer.parseInt(request.getParameter("qno"));
	QandaDao qDao = new QandaDao();
	QandaDto qDto = qDao.getQandaDetail(qno);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="resources/css/qanda.css">
<link rel="stylesheet" href="resources/css/header_footer.css">
<script src="resources/js/jquery-3.7.0.min.js"></script>
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
			<div class="customer_sub_title">문의하기</div>
             <div style="clear:both"></div>
			</div>
        </div>
        
         <div class="customer_nav_box">
       	<ul class="customer_nav">
	        <li><button class="goNotice">공지사항</button></li>
	        <li><button class="goFanda">자주하는 질문</button></li>
	        <li><button class="goQanda action">문의하기</button></li>
       	</ul>
         <div style="clear:both"></div>
        </div>
        
        <a href="#top" id="top_go" class="scroll_top" style="display:none"><i></i></a>
         <div style="clear:both"></div>
        
        	<div class="qandaDetail_box">
				<div class= "qandaDetail_title_box">
					<div class="qandaDetail_title fl">제목 : <%=qDto.getTitle() %></div>  
	        		<div class="qandaDetail_check fr"><%=qDto.getStatus() %></div>
	    	     	<div style="clear:both"></div>
					<div class="qandaDetail_category fl"><%=qDto.getCategory() %></div>      
	        		<div class="qandaDetail_date fr"><%=qDto.getqDate()%> 등록</div>
	    	     	<div style="clear:both"></div>
				</div>
				
				<div class = "qandaDetail_qBox">
        			<div class="qandaDetail_Q"><p>문의 내용</p><%=qDto.getContent()%></div>
	    	     	<div style="clear:both"></div>
				</div>
				
				<div class= "qandaDetail_aBox">
					<div class="qandaDetail_A">
	    	     		<div style="clear:both"></div>
						<p>답변 수정</p>
						<form action="Controller">
							<input type="hidden" value="<%=qno%>" name = "qno"/>
							<input type="hidden" value="qanda_comment_update_input" name = "command"/>
							<textarea name = "comment"><%=qDto.getComment()%></textarea>
							<input type="submit" value="수정완료"/>
						</form>
					
					</div>    
	    	     	<div style="clear:both"></div>
				</div>
				
				<div class="qandaDetail_btnBox fr">
			       	<button class="qandaDetail_back_btn fr" onclick="qanda.jsp">목록</button>
					<button id = "<%=qDto.getQno()%>" class="qandaDetail_update_btn fl">수정</button> 
					<button id = "<%=qDto.getQno()%>" class="qandaDetail_delete_btn fr">삭제</button> 
				    <div style="clear:both"></div>
			    </div>
       		</div>
			    	
			    <div style="clear:both"></div>
    
        
        
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