<%@page import="dto.TourDto"%>
<%@page import="dto.MyPlanDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MyPlanDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	int idx=0;
	try{
	idx=(int)session.getAttribute("idx");
	} catch(Exception e){
	}
	ArrayList<MyPlanDto> planList = (ArrayList<MyPlanDto>)request.getAttribute("myplan");
 	ArrayList<TourDto> tpList = (ArrayList<TourDto>)request.getAttribute("liketour");
 	ArrayList<TourDto> rsList = (ArrayList<TourDto>)request.getAttribute("tourrsv");
 	ArrayList<TourDto> ccList = (ArrayList<TourDto>)request.getAttribute("tourcancel");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/header_footer.css">
	<link rel="stylesheet" href="resources/css/mypage.css">
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
          <li><a href="Controller?command=diary">여행기</a></li>
        </ul>        
      </div>
    </div>
  </header>
  <div style="clear:both"></div>
	<section id="mypage_head">
	<div>
		<div id="title_box">
			<b id="title">마이페이지</b>
			<p>
				<span id="user_id"><%=session.getAttribute("userNickname")%></span><span id="hello">님 안녕하세요!</span>
			</p>
		</div>
		<div id="list" class="fl">
			<ul>
				<li menu="my_plan"class="on">나의 일정
					<p class="on_check"></p>
				</li>
				<li menu="my_like">찜한 여행</li>
				<li menu="my_hotel">투어/숙소 예약</li>
				<li menu="my_cancel">결제 취소내역</li>
				<li menu="my_act">계정관리</li>
			</ul>
		</div>
		<div id="content" class="fl">
			<div id="my_plan" class="show">
				<!-- 나의일정 -->
				<p>준비중인 여행</p>
				<%if(planList.size()==0){ %>
				<div style="margin-top: 50px; height: 50px; text-align: center;">
						<span>준비중인 여행이 없습니다</span>
					</div>
					<%} %>
		<%for(int i = 0;i<planList.size();i++){
			%>
			
				<div class="plan_box" pnum=<%=planList.get(i).getPnum()%>>
					<div class="plan_img fl"></div>
					<div class="ctt_right fl">
						<div class="fl">
							<div class="small_title">
								여행이름<input type="text" class="my_plan_title" name="plan_name" placeholder=<%=planList.get(i).getName() %>>
								<button class="edit fr"></button>
							</div>
							<div class="small_title">
								여행일정<span><%=planList.get(i).getPstart()%>~<%=planList.get(i).getPend()%></span>
							</div>
						</div>
						<div class="fr">
							<div class="small_title">
								최종수정<span><%=planList.get(i).getPdate()%></span>
							</div>
							<div class="small_title">
								선택장소<span><%=planList.get(i).getPcnt()%></span>
							</div>
						</div>
						<div style="clear: both"></div>
						<div class="btn_box">
							<button class="modify">일정수정</button>
							<button class="plan_delete">삭제</button>
						</div>
					</div>
					<div style="clear: both"></div>
				</div>
		<%}%>
			</div>
			<div id="my_like" class="show" style="display: none;">
				<!-- 찜한 여행 -->
				<p>찜한 여행</p>
			<%
			for(int i = 0; i<tpList.size();i++){
				if(tpList.size()==0){
				%>
				<div style="height: 50px; text-align: center;">
						<span>찜한 여행이 없습니다</span>
					</div>
					<%} %>
				<div class="plan_box" tourid=<%=tpList.get(i).getTourid()%>>
					<div class="like_img fl" style="background-image:url(resources/images/tour/t_<%=tpList.get(i).getTourid()%>.jpg);">
						<button class="ico_like"></button>
					</div>
					<div class="ctt_right fl">
						<h2 class="like_title"><%=tpList.get(i).getTitle()%></h2>
						<div class="tour_hash"><%=tpList.get(i).getHash()%></div>
						<div class="price_info">
							<div style="margin:0 60px">
								<div class="star_img fl"></div>
								<div class="star fl">  :  <%=tpList.get(i).getUserrating()%></div>
							</div>
								<div class="price_box fl">
									<span>￦ </span><span><%=tpList.get(i).getPrice()%></span>
								</div>
								<a href="Controller?command=tourItem_detail&tourId=<%=tpList.get(i).getTourid()%>" class="btneff">투어페이지이동</a>
								<div style="clear:both"></div>
						</div>
					</div>
					<div style="clear: both"></div>
				</div>
				<%
			}
				%>
			</div>
			<div id="my_hotel" class="show" style="display: none;">
				<!-- 투어/숙소 예약 -->
				<p>투어예약</p>
				
					<%if(rsList.size()==0){%>
					<div style="height: 50px; text-align: center;">
						<span>예약한 투어가 없습니다</span>
					</div>
				<%
				}
				
				for(int i = 0;i<rsList.size();i++){%>
				<div class="plan_box">
					<div class="plan_hotel_img fl" style="background-image:url(resources/images/tour/t_<%=rsList.get(i).getTourid()%>.jpg);"></div>
					<div class="ctt_right fl">
						<h2 class="tour_title"><%=rsList.get(i).getTitle()%></h2>
						<div class="tour_hash"><%=rsList.get(i).getHash()%></div>
						<div class="price_info">
							<div class="tour_payday fl">
								<span class="paydate"><%=rsList.get(i).getPaydate()%></span> <span> 결제</span>
							</div>
							<div class="hotel_price_box fl">
								<span>￦ </span><span><%=rsList.get(i).getPrice()%></span>
							</div>
							<button class="cancel_btn">결제취소</button>
						</div>
					</div>
					<div style="clear: both"></div>
				</div>
				<%
				}
				%>
				<p>숙소예약</p>
				<div class="plan_box">
					<div class="hotel_img fl"></div>
					<div class="ctt_right fl">
						<h2 class="hotel_title">HOTEL DE PARIS MONTPANASSE</h2>
						<div class="hotel_type">스탠다드</div>
						<div class="hotel_date">
							<span>2023-05-14 ~</span><span>2023-05-15</span>
						</div>
						<div class="price_info hotel">
							<div class="payday fl">
								<span class="paydate">2023.08.08</span> <span> 결제</span>
							</div>
							<div class="hotel_price_box fl">
								<span>￦ </span><span>132,200</span>
							</div>
							<button class="cancel_btn">결제취소</button>
						</div>
					</div>
					<div style="clear: both"></div>
				</div>
			</div>
			<div id="my_cancel" class="show" style="display: none;">
				<!-- 결제 취소내역 -->
				<p>투어 취소내역</p>
				<%
				if(ccList.size()==0){%>
				<div style="height: 50px; text-align: center;">
					<span>취소 내역이 없습니다.</span>
				</div>
				<%
				}
				for(int i = 0; i<ccList.size();i++){
				%>
				<div class="plan_box">
					<div class="cancel_pay_img fl">
					</div>
					<div class="fl ctt_right">
						<h2 class="tour_title"><%=ccList.get(i).getTitle()%></h2>
						<div class="tour_hash"><%=ccList.get(i).getHash()%></div>
						<div class="price_info tour">
							<div class="payday fl">
							</div>
							<div class="hotel_price_box fl">
								<span>￦ </span><span><%=ccList.get(i).getPrice()%></span>
							</div>
							<div class="cancel_suc fl">취소완료</div>
						</div>
					</div>
					<div style="clear: both"></div>
				</div>
				<%
				}%>
				<p>숙소 취소내역</p>
				<div class="plan_box">
					<div class="hotel_img fl" style="background-image:url(resources/images/tour/t_120.jpg);"></div>
					<div class="fl ctt_right">
						<h2 class="hotel_title">호텔 오페라 맹트농</h2>
						<div class="hotel_type">스탠다드</div>
						<div class="hotel_date">
							<span>2023-05-14 ~</span><span>2023-05-15</span>
						</div>
						<div class="price_info hotel">
							<div class="payday fl">
								<span class="paydate">2023.06.23</span> <span> 결제</span>
							</div>
							<div class="hotel_price_box fl">
								<span>￦ </span><span>103,200</span>
							</div>
							<div class="cancel_suc fl">취소완료</div>
						</div>
					</div>
					<div style="clear: both"></div>
				</div>
			</div>
			<div id="my_act" class="show" style="display: none;">
				<b>계정 관리</b>
				<div id="act_ctt">
					<div id="idntf">본인확인</div>
					<hr>
					<div id="idntf_ctt">
						회원님의 정보보안을 위해 비밀번호를 입력해주시기 바랍니다.<br /> 비밀번호는 타인에게 노출되지 않도록 주의하시기
						바랍니다.
					</div>
					<div id="idntf_pw">
						<span>비밀번호</span><input type="password" id="pw">
					</div>
					<hr>
					<div id="idntf_btn">
						<button id="user_check">확인</button>
					</div>
				</div>
			</div>
		</div>
		<div style="clear:both"></div>
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
		$(function() {
			let idx = <%=idx%>;
			let pass;
			let pass_comparison = true;
			let checkPW = RegExp(/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()_+]).{10,20}$/);
			$(document).on("keyup","#newpassword",function(){
				pass_comparison = false;
				if(checkPW.test($(this).val())){
						pass = $(this).val();
						$("#passcheck").hide();
				     } else {
				    	 $("#passcheck").show();
				    }    
			});
			$(document).on("keyup","#newpasswordcheck",function(){
				if($(this).val()== pass){
						$("#passrecheck").hide();
						pass_comparison = true;
				     } else if($(this).val()==""){
						$("#passrecheck").hide();
						pass_comparison = false;
				    } else {
				    	 $("#passrecheck").show();
						pass_comparison = false;
				    }
				
			});
			$(document).on("click","#save_user",function(){
				
				if(pass_comparison){
					alert("변경되었습니다.");
					let name = $("#name").val()
					let nickname = $("#nickname").val()
					$.ajax({
						type:"POST",
						url:"Controller",
						data:{name:name,nickname:nickname,pass:pass,command:"changeuserinfo"},
						success:function(){
							console.log("성공");
						},error:function(){
							console.log("실패");
						}
					});
					location.href="Login.jsp";
				} else if(pass==null&&checkPW==null){
						alert("!!")
					} else{
					alert("비밀번호가 다릅니다.");
				}
			});
			$(document).on("keyup",".my_plan_title",function(e){
				if(e.keyCode=='13'){
					$(this).parent().children(".edit").click();
				};
			});
			$(document).on("click",".modify",function(){
				let pnum= $(this).parents(".plan_box").attr("pnum");
				location.href = "Controller?command=planmodify&pno="+pnum
			});
			$("#list li").on("click", function() {
				let menu = $(this).attr("menu")
				$(".show").hide();
				$("#" + menu + "").show();
				$("#list li").children().remove();
				$(this).append('<p class="on_check"></p>');
				$("#list li").removeClass('on');
				$(this).addClass('on');
			})
			$(".ico_like").on("click", function() {
				let tourid = $(this).parents(".plan_box").attr("tourid");
				let answer = confirm("찜한 여행에서 삭제하시겠습니까?")
				if (answer) {
					$(this).parents(".plan_box").remove();
					$.ajax({
						type:"POST",
						url:"Controller",
						data:{tourid:tourid,command:"deletetourlike"},
						success:function(){
							console.log("성공");
						}, error:function(r, e, s){
							console.log("실패");
						}
					});
				}
			})
			$(document).on("click",".plan_delete", function() {
				let pnum = $(this).parents(".plan_box").attr("pnum");
				let url = "http://localhost:9090/WebProject1/DeleteMyPlanServlet";
				let answer = confirm("정말 삭제하시겠습니까?")
				if (answer) {
					$.ajax({
						type:"POST",
						url:"Controller",
						data:{pnum:pnum,command:"plandelete"},
						success:function(){
							console.log("성공");
							$("#my_plan").load("${contextPath} #my_plan");
						}, error :function(){
							console.log("실패");
						}
					})
				}
			})
			$(document).on("click",".edit",function(){
				let title=$(this).parent().children(".my_plan_title").val();
				let pnum1=$(this).parents(".plan_box").attr("pnum");
				if(title.length==0){
					title="나의일정";
				};
					$(this).parent().children(".my_plan_title").val("");
					$(this).parent().children(".my_plan_title").attr("placeholder",title);
				$.ajax({
					type:"POST",
					url: "Controller",
					data:{name:title,pnum:pnum1,command:"planrename"},
					success :function(){
						console.log("성공");
					}, error:function(){
						console.log("실패");
					}
				});
			});
				$(".none").text("11");
			$("#user_check").on("click",function(){
				let pw = $("#pw").val();
				
				$.ajax({
					type:"POST",
					url:"Controller",
					data:{idx:idx,pw:pw,command:"checkuser"},
					success :function(e){
						if(e=="success"){
							$("#my_act").load("changeuser.jsp");
						} else{
							alert("비밀번호를 확인해주세요.")
						}
						console.log("성공");
					}, error:function(){
						console.log("실패");
					}
				});
			});
			$(document).on("click","#delete_user_btn",function(){
				let answer = confirm("정말 탈퇴하시겠습니까?");
				if(answer){
					location.href="DeleteMemberAction.jsp";
					//DELETE MEMBER ajax -> 메인페이지로 이동
				}
			});
		});
	</script>
</body>
</html>