<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "stubby";
	String pw = "123456";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="../CSS/header_footer.css">
	<link rel="stylesheet" href="../CSS/mypage.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<%
	Connection conn = null;
	// 1. Connection 객체
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, id, pw);
	} catch (Exception e) {
		e.printStackTrace();
		out.println("<h1>오라클 접속 실패</h1>");
	}
	// 2.PreparedStatement 객체.
	String sql = "SELECT * FROM my_plan WHERE idx=?";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,1);
	
	//3. ResultSet 객체.
	ResultSet rs = pstmt.executeQuery();
	%>
<body>
  <header>
    <div class="head_box">
      <div class="head_content">
        <div class="head_title">
          <h1><a href="./Main.html"><img src="../Images/stu_logo.png" alt=""></a></h1>
        </div>
        <div class="gnb_box">
        
          <div class="gnb_content">
            <ul>
              <li><a href="">고객센터</a></li>
              <li><a href="./Login.html">로그인</a></li>
              <li><a href="./Signup.html">회원가입</a></li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <div class="lnb_box">
      <div class="lnb_content">
        <ul>
          <li><a href="./Main.html">홈</a></li>
          <li><a href="./SearchMain.html">탐색</a></li>
          <li><a href="">유럽투어</a></li>
          <li><a href="./HotelMain.html">숙소</a></li>
          <li><a href="#">여행기</a></li>
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
				<span id="user_id">kosang5653</span><span id="hello">님 안녕하세요!</span>
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
		<%while(rs.next()){
			String name=rs.getString("name");			
			Date now=rs.getDate("p_date");
			Date start=rs.getDate("p_start");
			Date end=rs.getDate("p_end");
			int pcnt=rs.getInt("p_cnt");
			%>
				<div class="plan_box">
					<div class="plan_img fl"></div>
					<div class="ctt_right fl">
						<div class="fl">
							<div class="small_title">
								여행이름<input type="text" class="my_plan_title" name="plan_name" placeholder=<%=name%>>
								<button class="edit fr"></button>
							</div>
							<div class="small_title">
								생성일자<span><%=start%>~<%=end%></span>
							</div>
						</div>
						<div class="fr">
							<div class="small_title">
								최종수정<span><%=now%></span>
							</div>
							<div class="small_title">
								선택장소<span><%=pcnt%></span>
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
			sql = "SELECT t.title, t.price, t.hash, t.tour_id, t.user_rating"
					+ " FROM tour_package t, tour_like l"
					+ " WHERE t.tour_id = l.tour_id AND l.idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,1);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String title=rs.getString("title");
				int price=rs.getInt("price");
				String hash=rs.getString("hash");
				int t_idx=rs.getInt("tour_id");
				int rating=rs.getInt("user_rating");
				DecimalFormat dc = new DecimalFormat("###,###,###");
				String money = dc.format(price);
// 				let num = new Intl.NumberFormat('ko-KR').format(price)
				%>
				<div class="plan_box">
					<div class="like_img fl" style="background-image:url(../Images/tour/t_<%=t_idx%>.jpg);">
						<button class="ico_like"></button>
					</div>
					<div class="ctt_right fl">
						<h2 class="like_title"><%=title%></h2>
						<div class="tour_hash"><%=hash%></div>
						<div class="price_info">
							<div style="margin:0 60px">
								<div class="star_img fl"></div>
								<div class="star fl">  :  <%=rating%></div>
							</div>
								<div class="price_box fl">
									<span>￦ </span><span><%=money%></span>
								</div>
								<a href="touritem.jsp?tourid=<%=rs.getInt("tour_id")%>" class="btneff">투어페이지이동</a>
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
				<%sql = "SELECT tp.tour_id, tp.img, tp.title, tp.hash, tp.price, p.pay_date"
						+" FROM tour_package tp, tour_pay p"
						+" WHERE tp.tour_id = p.tour_id AND p.idx = ? AND p.pay_check='결제완료'";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,1);
				rs = pstmt.executeQuery(); 
				while(rs.next()){
					int price=rs.getInt("price");
					DecimalFormat dc = new DecimalFormat("###,###,###");
					String money = dc.format(price);
					%>
				<div class="plan_box">
					<div class="plan_hotel_img fl" style="background-image:url(../Images/tour/t_<%=rs.getInt("tour_id") %>.jpg);"></div>
					<div class="ctt_right fl">
						<h2 class="tour_title"><%=rs.getString("title")%></h2>
						<div class="tour_hash"><%=rs.getString("hash") %></div>
						<div class="price_info">
							<div class="tour_payday fl">
								<span class="paydate"><%=rs.getDate("pay_date") %></span> <span> 결제</span>
							</div>
							<div class="hotel_price_box fl">
								<span>￦ </span><span><%=money %></span>
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
				sql = "SELECT tp.tour_id,tp.title,tp.hash,p.pay_date,p.price"
						+" FROM tour_package tp, tour_pay p"
						+" WHERE tp.tour_id = p.tour_id AND p.idx=? AND p.pay_check='결제취소'";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,1);
				rs = pstmt.executeQuery();
				while(rs.next()){
					int price=rs.getInt("price");
					DecimalFormat dc = new DecimalFormat("###,###,###");
					String money = dc.format(price);
					
				%>
				<div class="plan_box">
					<div class="cancel_pay_img fl">
					</div>
					<div class="fl ctt_right">
						<h2 class="tour_title"><%=rs.getString("title")%></h2>
						<div class="tour_hash"><%=rs.getString("hash") %></div>
						<div class="price_info tour">
							<div class="payday fl">
							</div>
							<div class="hotel_price_box fl">
								<span>￦ </span><span><%=money %></span>
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
					<div class="hotel_img fl"></div>
					<div class="fl ctt_right">
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
			$("#list li").on("click", function() {
				let menu = $(this).attr("menu");
				$(".show").hide();
				$("#" + menu + "").show();
				$("#list li").children().remove();
				$(this).append('<p class="on_check"></p>');
				$("#list li").removeClass('on');
				$(this).addClass('on');
			})
			$(".ico_like").on("click", function() {
				let answer = confirm("찜한 여행에서 삭제하시겠습니까?")
				if (answer) {
					$(this).parents(".plan_box").remove();
				}
			})
			$(".plan_delete").on("click", function() {
				let answer = confirm("정말 삭제하시겠습니까?")
				if (answer) {
					$(this).parents(".plan_box").remove();
				}
			})
			$(".edit").on("click",function(){
				let title=$(this).parent().children(".my_plan_title").val();
				$(this).parent().children(".my_plan_title").val("");
				$(this).parent().children(".my_plan_title").attr("placeholder",title);
				if(title.length==0){
				$(this).parent().children(".my_plan_title").attr("placeholder","나의 일정");
				}
			})
			$("#user_check").on("click",function(){
				let pw = $("#pw").val();
				if(pw==1234){
				location.href="changeuser.html";
				} else{
					alert("비밀번호를 확인해주세요.")
				}
			})
		})
	</script>
		<%	rs.close();
		pstmt.close();
		conn.close(); %>
</body>
</html>