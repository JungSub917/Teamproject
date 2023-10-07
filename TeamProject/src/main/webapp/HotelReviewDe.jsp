<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.HrDto"%>
<%
  HrDto hrdto = (HrDto)request.getAttribute("hotelreviewdetaillist");
 	int commnetCnt = (int)request.getAttribute("hrCommentCnt");
	ArrayList<HrDto> commentList = (ArrayList<HrDto>)request.getAttribute("hrCommnetList"); 
	int hno = Integer.parseInt(request.getParameter("hno"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>숙소 - 스투비플래너</title>
	<link rel="icon" href="resources/images/favicon.png">
	<!-- jQuery -->
  <script type="text/javascript" src="resources/js/jquery-3.7.0.min.js"></script>
	<!-- my -->
  <link rel="stylesheet" href="resources/css/reset.css">
  <link rel="stylesheet" href="resources/css/header_footer.css">
  <link rel="stylesheet" href="resources/css/hotelreviewde.css">
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
	        			<span><%=session.getAttribute("userNickname")%>님 안녕하세요.</span>
	        		</li>
	        		<li><a href="Controller?command=mypage">마이페이지</a></li>
	        		<li><a href="Controller?command=logout&page=4">로그아웃</a></li>
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
          <li><a href="Controller?command=HotelMain" class="on">숙소</a></li>
          <li><a href="Controller?command=diary">여행기</a></li>
        </ul>        
      </div>
    </div>
  </header>
  <section>
  	<div class="wrap_Box">
  		<div class="wrap_contain">
		  	<div class="tit_wrap">
		  		<p><%=hrdto.getHotelName() %></p> 
		  		<p><%=hrdto.getTitle() %></p>
		  		<p>by <%=hrdto.getNickName() %>&nbsp&nbsp&nbsp<span><%=hrdto.getHrDate() %></span></p>
		  	</div>
		  	<div class="con_wrap">
		  		<p><%=hrdto.getReview() %></p>
		  	</div>
		  	<div class="buttons">
		  		<a href="HotelReview.jsp" class="hotel_review_list">목록</a>
		  		<%
    				if (session.getAttribute("userEmail") == null) {
    			%>
          	<a href="Login.jsp" class="hotel_review_write" onclick="loginp();">호텔리뷰 쓰기</a>
          <%} else{ %>
          	<a href="HotelReviewWrite.jsp" class="hotel_review_write">호텔리뷰 쓰기</a>
          <% } %>
		  		<% if(session.getAttribute("userEmail") == null){ %>
		  		<%} else{%>	
		  		<%
    				if (session.getAttribute("userNickname").equals(hrdto.getNickName())) {
    			%>
          	<a href="HotelReviewReform.jsp?hno=<%=hrdto.getHno()%>" class="hotel_review_reform">수정</a>
          	<a href="Controller?command=HrReviewDelete&hno=<%=hrdto.getHno()%>" class="hotel_review_delete">삭제</a>
          <%} else{ }%>
		  		<%} %>
         
		  		<div style="clear:both;"></div>
		  		
		  	</div>
		  	<div class="hotel_review_comment">
		  		<p>댓글 <span class="commentCnt"> <%=commnetCnt%></span></p>
		  			<input type="text" class="commentxt" name="comment">
		  			<button type="submit" class="comment_register">등록</button>
		  	</div>
		  	<div class="comment_list" id="comment_list">
		  		<ul>
		  		<% for(HrDto dto : commentList) { %>
		  			<li>
		  				<input type="hidden" name="hrno" value="<%=dto.getHrno()%>">
	  					<div class="profil_img">
	  						<img src="resources/images/img_pfnull.jpg">
	  					</div>
	  					<div class="profil_user">
	  						<b><%=dto.getNickName() %></b>
	  						<p><%=dto.getHrComment() %></p>
	  					</div>
	  					<div class="comment_op">
	  						<span><%=dto.getHrcDate() %></span>
	  						<% if(session.getAttribute("userEmail") == null){ %>
		  					<%} else{%>	
		  					<%
    							if (session.getAttribute("userNickname").equals(dto.getNickName())) {
    						%>
	  							<img class="option_box" src="resources/images/more_vert_FILL0_wght400_GRAD0_opsz48.png">
	  							<div class="opt_box">
	  								<p class="comment_reform">수정</p>
	  								<p class="comment_delete">삭제</p>
	  							</div>
    					  <%} else{ }%>
		  				  <%} %>
	  					</div>
	  					<div style="clear:both;"></div>
			  			<div class="com_reform">
			  				<input type="text" value="<%=dto.getHrComment() %>">
			  				<button>수정</button>
			  			</div>
		  			</li>
		  		<%} %>
		  		</ul>
		  	</div>
  		</div>
  	</div>
  </section>
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
		function loginp(){
			alert("로그인 후 이용해주세요");
		}
	
		$(function(){
		  $(document).on("click", ".option_box", function() {
		    const parentItem = $(this).closest("li");
		    const optBox = parentItem.find(".opt_box");

		    if (optBox.is(":visible")) {
		      optBox.hide();
		    } else {
		      $(".opt_box").not(optBox).hide();
		      optBox.show();
		    }
		  });
		  
		  $(document).on("click", ".comment_reform", function() {
		    const parentItem = $(this).closest("li");
		    const comReform = parentItem.find(".com_reform");

		    comReform.show();
		  });
		  
			$(".comment_register").click(function(){
			  <%
   				if (session.getAttribute("userEmail") == null) {
   			%>
   				alert("로그인 후 이용해주세요.");
   			<% } else{%>
   				let comment = $("input[name =comment]").val();
   				$.ajax({
   					type: "POST",
   					url: "Controller?command=HrCommentWrite",
   				  data: {hno: <%=hno%>, comment: comment, idx: <%= session.getAttribute("idx")%> },
   				  success: function(){
   				  	$('#comment_list').load(location.href+' #comment_list');
   				  	$('.commentCnt').load(location.href+' .commentCnt');
   				  },
   				  error: function(){
   				  	console.log("실패");
   				  }
   				});
   			<%}%>
			});
			
			$(document).on("click", ".comment_delete", function() {
			  const parentItem = $(this).closest("li");
			  const hrno = parentItem.find("input[name=hrno]").val();

			  $.ajax({
			    type: "POST",
			    url: "Controller?command=HrCommentDelete",
			    data: { hrno: hrno },
			    success: function() {
			      $('#comment_list').load(location.href + ' #comment_list');
			      $('.commentCnt').load(location.href + ' .commentCnt');
			    },
			    error: function() {
			      console.log("실패");
			    }
			  });
			});
		  
			$(document).on("click", ".com_reform button", function() {
			  const parentItem = $(this).closest("li");
			  const comment = parentItem.find(".com_reform input").val();
			  const hrno = parentItem.find("input[name=hrno]").val();
				
				$.ajax({
					type: "POST",
					url: "Controller?command=HrCommentUpdate",
					data: { hrno: hrno, comment: comment },
					success: function(){
						$('#comment_list').load(location.href + ' #comment_list');
				    $('.commentCnt').load(location.href + ' .commentCnt');
					},
					error: function(){
						console.log("실패");
					}
				});
			});

		});
		
	
  </script>
</body>
</html>