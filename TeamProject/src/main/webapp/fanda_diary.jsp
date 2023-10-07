<%@page import="dao.PageTotal"%>
<%@page import="dto.FandaDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ page import="java.sql.*" %>
<%	
	ArrayList<FandaDto> diaryList = (ArrayList<FandaDto>)request.getAttribute("fandalist");
	int totalPage = (int)request.getAttribute("totalPage");
	int pageNum = (int)request.getAttribute("pageNum");
	int idx;
	try{
		idx = (int)session.getAttribute("idx");
	}catch(Exception e){
		idx = 0;
	}	
%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="resources/css/fanda.css">
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
			<div class="customer_sub_title">자주하는질문</div>
             <div style="clear:both"></div>
			</div>
		
        
         <div class="customer_nav_box">
	       	<ul class="customer_nav">
	        	<li><button class="goNotice ">공지사항</button></li>
	        	<li><button class="goFanda action">자주하는 질문</button></li>
	        	<li><button class="goQanda ">문의하기</button></li>
	       	</ul>
	         <div style="clear:both"></div>
        </div>
        
        <a href="#top" id="top_go" class="scroll_top" style="display:none"><i></i></a>
         <div style="clear:both"></div>
        
        <div class="category_box">
	        <ul>
		       <li><button id = "signup" class="category" >회원가입</button></li>
		        <li><button id = "diary" class="category active">여행기 작성</button></li>
		        <li><button id = "plan" class="category">여행 일정 작성</button></li>
		        <li><button id = "except" class="category">기타</button></li>
	        </ul>
	         <div style="clear:both"></div>
  		</div>
        
        
      <div id = "fanda_signup" class="show" >
        <%
	       for(int i = 0; i < diaryList.size(); i++){
        %>
	        <div class="fanda_main_box">
	        	<div class="fanda_title_box">
	        	<div class="fanda_icon_q fl"><img src="resources/images/Qicon.png"></div>
	        	<div class="fanda_title fl"><%=diaryList.get(i).getFa()%></div>
	        	<div class="fanda_ud_icon fr"></div>
	         	<div style="clear:both"></div>
	        	</div>
	        	
	         	<div class="fanda_content_box" style="display:none">
	         		<div class="fanda_icon_a fl"><img src="resources/images/Aicon.png"></div>
	         	<%
	         		if(idx == 1){
	         	%>
	         		<div class="fanda_content_btn_box fr">
	         			<span class="fanda_menu_btn fr"></span>
		         		<div class="fanda_content_btn fl">
		         			<button id = "<%=diaryList.get(i).getFno()%>" class="fanda_update">수정</button>
		         			<button id = "<%=diaryList.get(i).getFno()%>" class="fanda_delete">삭제</button>
		         		</div>
	         		</div>
	         	<%
	         		} 
	         	%>
	         		<div class="fanda_content"><%=diaryList.get(i).getFq()%></div>
	         	</div>
	 		</div>
	         	<div style="clear:both"></div>
	        <%}; %>
      </div> 
      
      		<%if(idx == 1){ %>
      		<div class="write_btn">
				<button class="fanda_write" onclick="location.href='fanda_write.jsp'">글쓰기</button>
			</div>
      		<%}; %>
		          <div class="page_btn">
		         	<div class="fl"><a href="Controller?command=fanda_diary_list"><img src="resources/images/double_left.png"/></a></div>
		         	<%if(pageNum == 1){%>
		         	<div class="fl"><a href="Controller?command=fanda_diary_list"><img src="resources/images/left_page.png"/></a></div>
		         	<% 
		         	}else{%>
		         	<div class="fl"><a href="Controller?command=fanda_diary_list&pageNum=<%=pageNum-1%>"><img src="resources/images/left_page.png"/></a></div>
				    <% };
				    for(int i = 1; i <= totalPage; i++){
						if(i == pageNum){
					%>
					<span><%=i%></span>
					<%
						}else{
					%>
					<a href= "Controller?command=fanda_diary_list&pageNum=<%=i%>"><%=i%></a>	
					<%
						}
				    };
				    if(pageNum == totalPage){%>
		         	<div class="fl"><a href="Controller?command=fanda_diary_list&pageNum=<%=pageNum%>"><img src="resources/images/right_page.png"/></a></div>
				   	<%}else{%>
		         	<div class="fl"><a href="Controller?command=fanda_diary_list&pageNum=<%=pageNum+1%>"><img src="resources/images/right_page.png"/></a></div>
		         	<%}; %>
		         	<div class="fl"><a href="Controller?command=fanda_diary_list&pageNum=<%=totalPage%>"><img src="resources/images/double_right.png"/></a></div>
			        <div style="clear:both"></div>
		         </div>
		 <div style="clear:both"></div>
		</div> 

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