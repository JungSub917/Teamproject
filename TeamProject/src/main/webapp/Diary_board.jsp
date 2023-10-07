<%@page import="dao.DiaryLikeDao"%>
<%@page import="dto.DiaryCmtDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DiaryCmtDao"%>
<%@page import="dto.DiaryDto"%>
<%@page import="dao.DiaryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	int idx=0;
	try{
	idx=(int)session.getAttribute("idx");
	} catch(Exception e){
	}
// 	int dno=Integer.parseInt(request.getParameter("dno"));
	int check = (int)request.getAttribute("check");
	DiaryDto diary = (DiaryDto)request.getAttribute("diary");
	ArrayList<DiaryCmtDto> cmtList = (ArrayList<DiaryCmtDto>)request.getAttribute("cmt");
%>
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<title>여행기</title>
	<link rel="stylesheet" href="resources/css/header_footer.css">
	<link rel="stylesheet" href="resources/css/diary_board.css">
	<script src="resources/js/jquery-3.7.0.min.js"></script>
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
	<div class="titwrap">
		<div class="title"><%=diary.getTitle()%></div>
		<div class="info">
			<ul id="header_cnt" class="ul1">
				<li class="fl">
					<span>by <%=diary.getNickName()%></span>
				</li>
				<li class="fl date"><%=diary.getDiaryDate()%>
				</li>
				<li class="fr list2">
					<span><img src="resources/images/icn_cmt.png"/><span><%=diary.getCmtCnt()%></span></span>
				</li>
				<li class="fr list2">
					<span id="heart"><img src="resources/images/icn_heart.svg" style="width:16px;"/><span id="heart_cnt"><%=diary.getLikeCnt()%></span></span>
				</li>
				<li class="fr list2">
					<span><img src="resources/images/icn_view.svg" style="width:16px;"/><span><%=diary.getViewCnt()%></span></span>
				</li>
			</ul>
			<div style="clear:both"></div>
		</div>	
	</div>
	<div class="brd_content">
		<%=diary.getContent()%>
	</div>
	<div class="like_wrap">
		<button id="heart_btn" class="<%if(check==0){%>emtheart<%}else{%> fullheart<%}%>"> <!-- 좋아요버튼 -->
		</button>
	</div>
	<div class="brd_btn">
		<div class="fr list"><button id="list_btn">목록</button></div>
		<%if(idx==diary.getIdx()){ %><div class="fr list"><button id="delete_btn">삭제</button></div><%} %>
		<div style="clear:both"></div>
	</div>
	<div class="cmt_wrap">
		<div class="cmt_header"><span>댓글</span> <span id="cmt_cnt" style="color:red;"><%=diary.getCmtCnt()%></span></div>
		
		<%if(idx!=0) { %>	<!-- 댓글INSERT 창 -->
		<div class="cmt_insert">
			<input id="cmt_val" type="text" class="fl">
			<button id="addcmt" class="fl">등록
			</button>
		</div>
		<% } %>
		
		<div style="clear:both"></div>
		<div id="cmt_box">
		<%for(int i = 0; i<=cmtList.size()-1;i++){
			%>
			<div cno=<%=cmtList.get(i).getCno() %>>
				<div class="nickname_box">
					<div class="fl"> <%=cmtList.get(i).getNick()%>
					</div>
					<%if(idx==cmtList.get(i).getIdx()){%>
					<div class="fr cmt_btn" idx=<%=cmtList.get(i).getIdx()%>>
						<button class="more_open">
						</button>
					</div>
					<div class="more_popup">
						<button class="correction_cmt">수정</button>
						<button class="delete_cmt">삭제</button>
					</div>
					<%} else{}%>
					<div class="fr cmt_time"><%=cmtList.get(i).getDate()%>
					</div>
				</div>
				<div style="clear:both"></div>
					<div class="cmt_ctt" cno=<%=cmtList.get(i).getCno()%>>
					<%=cmtList.get(i).getCmt()%>
					</div>
				</div>
				<%
				}%>
		</div>
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
<script>
	$(function(){
		$(document).on("click",".fullheart",function(){
			let cnt = $("#heart_cnt").text();
			let idx=<%=idx%>;
			$.ajax({
				type:"POST",
				url : "Controller",
				data:{idx:idx,dno:${dno},check:0,command:"diarylike"},
				success :function(){
					$("#heart_btn").attr("class","emtheart");
					$("#heart_cnt").text(cnt-1);
					console.log("성공");
				}, error:function(){
				}
			});
		});
		$(document).on("click",".emtheart",function(){
			let cnt = parseInt($("#heart_cnt").text());
			if(<%=idx%>==0){
				alert("로그인 후 이용가능합니다.")
			} else {
			let idx=<%=idx%>;
			$.ajax({
				type:"POST",
				url: "Controller",
				data:{idx:idx,dno:${dno},check:1,command:"diarylike"},
				success :function(){
					$("#heart_btn").attr("class","fullheart");
					$("#heart_cnt").text(cnt+1);
					console.log("성공");
				}, error:function(){
				}
			});
			};
		});
		$(document).on("keyup","#cmt_val",function(e){
			if(e.keyCode=='13'){
				$("#addcmt").click();
			};
		});
		$(document).on("keyup",".correction_input",function(e){
			if(e.keyCode=='13'){
				$(".correction_enter").click();
			};
		});
		$(document).on("click",".correction_cmt",function(){
			let ctt=$(this).closest("div[cno]").children(".cmt_ctt").text().trim();
			let correction = '<input class="correction_input" type="text" value='+ctt+'>'
			+'<input class="correction_enter" type="submit" value="확인">'
			+'<input class="correction_cancel" type="submit" value="취소">';
			$(this).closest("div[cno]").children(".cmt_ctt").html(correction);
		});
		$(document).on("click",".correction_enter",function(){
			let cno = $(this).parent().attr("cno");
			let ctt = $(this).prev().val();
			$.ajax({
				type:"POST",
				url : "Controller",
				data:{ctt:ctt,cno:cno,command:"updatecmt"},
				success :function(){
					$("#cmt_box").load("${contextPath} #cmt_box");
					console.log("성공");
				}, error:function(){
					alert("실패");
				}
			});
		});
		$(document).on("click",".correction_cancel",function(){
			$("#cmt_box").load("${contextPath} #cmt_box");
		});
		$("#delete_btn").click(function(){
			let answer = confirm("정말 삭제하시겠습니까?")
			if(answer){
			alert("해당글이 삭제되었습니다.");	
			location.href="Controller?command=diarydelete&dno=${dno}";
			}
		});
		$("#list_btn").click(function(){
			location.href="Controller?command=diary";
		});
		$("#addcmt").click(function(){
			let val = $("#cmt_val").val();
			if(val==""){
				alert("내용을 입력해주세요")
			} else{
			$("#cmt_val").val(null);
			$.ajax({
				type:"POST",
				url: "Controller",
				data:{cmt:val,idx:<%=idx%>,dno:${dno},command:"addcmt"},
				success :function(){
					$("#cmt_box").load("${contextPath} #cmt_box");
					$("#cmt_cnt").load("${contextPath} #cmt_cnt");
					$("#header_cnt").load("${contextPath} #header_cnt");
					console.log("성공");
				}, error:function(e){
					alert(e);
					}
				});
			};
		});
		$(document).on("click",".delete_cmt",function(){
			let cno1 = $(this).parents("div[cno]").attr("cno");
			let answer = confirm("정말 삭제하시겠습니까?");
			if(answer){
				$.ajax({
					type:"POST",
					url: "Controller",
					data:{cno:cno1,command:"deletecmt"},
					success :function(){
						console.log("성공");
						$("#cmt_box").load("${contextPath} #cmt_box");
						$("#cmt_cnt").load("${contextPath} #cmt_cnt");
						$("#header_cnt").load("${contextPath} #header_cnt");
					}, error:function(e){
						alert(e);
					}
				});
			};
		});
			$(document).on("click",".more_open",function(){
			$(this).parent().parent().children('.more_popup').show();
			});
		$(document).mouseup(function(){
			$('.more_popup').hide();
			});
		});
</script>
</html>