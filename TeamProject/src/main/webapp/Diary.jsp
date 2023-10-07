<%@page import="dto.DiaryDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DiaryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% 
	int idx = 0;
	if(session.getAttribute("idx")!=null)
		idx=(int)session.getAttribute("idx");
	
	ArrayList<DiaryDto> dList = (ArrayList<DiaryDto>)request.getAttribute("list");
	%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>STUBBY Planer 여행기</title>
	<link rel="stylesheet" href="resources/css/diary.css">
	<link rel="stylesheet" href="resources/css/header_footer.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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
          <li><a href="Controller?command=diary" class="on">여행기</a></li>
        </ul>        
      </div>
    </div>
  </header>
	<section>
		<div class="banner">
				<div class="bannerblack">
					<div class="zd">여행기
					</div>
					<div class="bannercontent"> 도시별 여행에 관련된 자유로운 커뮤니케이션을 해보세요,</br>다양한 여행팁을 얻으실 수 있습니다. 
					</div>
				</div>
			</div>
	</section>
	<div id="board_header">
		<ul id="notice">
			<li class="list3">
				<div><span id="board_notice">공지</span><span>&nbsp;·&nbsp;</span><span class="date">2022.10.19</span></div>
				<div class="title">커뮤니티 게시글 관련 안내</div>	
				<div class="info">
					<ul style="margin-right:5px;">
						<li class="fl">
							<span>by 관리자</span>
						</li>
						<li class="fl list2">
							<span ><img src="resources/images/icn_cmt.png"/><span>1</span></span>
						</li>
						<li class="fl list2">
							<span><img src="resources/images/icn_heart.svg" style="width:16px;"/><span>2</span></span>
						</li>
						<li class="fl list2">
							<span><img src="resources/images/icn_view.svg" style="width:16px;"/><span>150</span></span>
						</li>
					</ul>
					<div style="clear:both"></div>
				</div>		
			</li>
			<%	
				/* 게시물 리스트 */
				for(int i=0;i<=dList.size()-1;i++){
					%>
			<li class="list1">
			<div class="fl">
				<div><span class="date"><%=dList.get(i).getDiaryDate()%></span></div>
					<div class="title"><a class="detail" dno=<%=dList.get(i).getDno()%>><%=dList.get(i).getTitle()%></a></div>
					<div class="info">
						<ul style="margin-right:5px;">
							<li class="fl">
								<span>by <%=dList.get(i).getNickName()%></span>
							</li>
							<li class="fl list2">
								<span ><img src="resources/images/icn_cmt.png"/><span><%=dList.get(i).getCmtCnt()%></span></span>
							</li>
							<li class="fl list2">
								<span><img src="resources/images/icn_heart.svg" style="width:16px;"/><span><%=dList.get(i).getLikeCnt()%></span></span>
							</li>
							<li class="fl list2">
								<span><img src="resources/images/icn_view.svg" style="width:16px;"/><span><%=dList.get(i).getViewCnt()%></span></span>
							</li>
						</ul>
						<div style="clear:both"></div>
				</div>	
			</div>
			<div class="fr board_img"><img src="upload/<%=dList.get(i).getMainImg()%>" alt="" onerror="this.src='resources/images/logo_big.png'"></div>
						<div style="clear:both"></div>
			</li>
			<%
			}
			%>
		</ul>
	</div>
	<div class="writebt">
			<a id="write_diary" class="buttonborder">글쓰기</a></div>
	<div class="writebt" style="text-align:center;"><a id="more" class="buttonborder">더보기</a></div>
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
  $(function(){
	  $("#write_diary").click(function(){
		  let idx=<%=idx%>;
		 if(idx==0){
			alert("로그인이 필요합니다.") 
		 } else {
			location.href="write_board.jsp"
		 }
	  });
	$("a.detail").on("click",function(){
		let dno = $(this).attr("dno");
		location.href = "Controller?command=diarydetail&dno="+dno;
	});
  });
  	let cnt=1;
 	let num=$(".list1").length;
 	 for(var i=0;i<num;i++){
  			if(i>=5){
  				$(".list1:eq("+i+")").hide();
  			}
  		}
  	$("#more").on("click",function(){
  		cnt=cnt+1;
  		for(var i=0;i<num;i++){
			if(i<5*cnt){
				$(".list1:eq("+i+")").show();
			}  			
  		}
  	});
  </script>
</body>
</html>