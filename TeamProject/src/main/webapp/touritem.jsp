<%@page import="java.util.ArrayList"%>
<%@page import="dto.TourPackageDto"%>
<%@page import="dao.TourPackageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%
   	
	int score = (int)request.getAttribute("score");
   	int tourId = (int)request.getAttribute("tourId");
	TourPackageDto tourDto = (TourPackageDto)request.getAttribute("tourDetail");
	TourPackageDto reviewTotal = (TourPackageDto)request.getAttribute("reviewTotal");
	ArrayList<TourPackageDto> reiveList = (ArrayList<TourPackageDto>)request.getAttribute("reviewList");
	ArrayList<TourPackageDto> itemList = (ArrayList<TourPackageDto>)request.getAttribute("tourList");
	
	double userRating = tourDto.getUserRating();
	int reviewCount = reviewTotal.getReviewTotal();
	
	int idx = 0;
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
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/tour_item.css">
<link rel="stylesheet" href="resources/css/header_footer.css">
<script src="resources/js/jquery-3.7.0.min.js"></script>
<script src="resources/js/tour_item.js"></script>
<script src="resources/js/Stubby.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script defer src ="resources/js/index.js"></script>
<script src="resources/js/bxslider.js"></script>
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js" integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>
<script defer src="
https://maps.googleapis.com/maps/api/js?key=AIzaSyAhvjByd4DO-mwq3NHgPcqjaMr7867Ao9I&callback=initMap"></script>

<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.2.0/kakao.min.js"
  integrity="sha384-x+WG2i7pOR+oWb6O5GV5f1KN2Ko6N7PTGPS7UlasYWNxZMKQA63Cj/B2lbUmUfuC" crossorigin="anonymous"></script>
<script>
  Kakao.init('96c2eb99a55e69baf99d8888a6742d39'); // 사용하려는 앱의 JavaScript 키 입력
</script>
<script src="https://js.tosspayments.com/v1/payment"></script>
<script type="text/javascript" src="resources/js/header_footer.js"></script>

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
          <li><a href="Controller?command=tour_main" class="on">유럽투어</a></li>
          <li><a href="Controller?command=HotelMain">숙소</a></li>
          <li><a href="Controller?command=diary">여행기</a></li>
        </ul>        
      </div>
    </div>
  </header>
        
		<div id="haeder_background">
			<div class="item_top_content">
				<div class="item_imgbox fl">
					<img  class="item_img " src="<%=tourDto.getImg()%>"/>
					<button class="tour_like"></button>
					 <div style="clear:both"></div>
				</div>
				<div class="top_content_box fl">
					<div class="item_title_box">
						<a href="#" onclick="history.back()"><%=tourDto.getNatName() %></a>
						<h2><%=tourDto.getTourTitle()%></h2>
						<div style="clear:both"></div>
					</div>
					
					<div class="item_tag_box">
						<ul><li><%=tourDto.getTourTitle()%></li></ul>
						<div style="clear:both"></div>
					</div>
											
					<div class="date_choice fl">
						날짜 선택 : <input type="text" id='date'/>	
					</div>
					<div style="clear:both"></div>
					
					<div class="item_rating_price_box">
						<div class="item_score fl ">
						<div class="score_img fl" style="width:<%=score%>%"></div>
						</div>
						<div class="fl score"><%=userRating%></div>
						<div class="item_price fr"><strong>￦<%=tourDto.getMoney()%> 원</strong></div>
						<div style="clear:both"></div>
					</div>
					
					<div class="btn_box">
						<div class="item_inquiry fl">
						<div class="item_inquiry_img fl"></div>
						<div  class="item_inquiry_text">문의하기</div>
						<div style="clear:both"></div>
						</div>
						
						<div class="item_pay fl">
						<div class="pay_img fl" ></div>
						<div class="pay_text">결제하기</div>
						<div style="clear:both"></div>
						</div>
						
						<div class="naver_pay">
							<div class="naver_pay_img fl"></div>
							<div class="naver_pay_text fl">결제하기</div>
							<div style="clear:both"></div>
						</div>
						
						<div class="kakao_pay">
							<div class="kakao_pay_img fl"></div>
							<div class="kakao_pay_text">결제하기</div>
							<div style="clear:both"></div>
						</div><br/>
					</div>
				</div>
			</div>
		</div>
		
		<div id="nav">
			<div class="nav_bar">
				<a href="#p1" id="s1" class="scroll active">상품소개</a>
				<a href="#p2" id="s2" class="scroll">투어코스</a>
				<a href="#p3" id="s3" class="scroll">유의사항</a>
				<a href="#p4" id="s4" class="scroll">후기</a>
				<a href="#p5" id="s5" class="scroll">문의</a>
			</div>
		</div>
				<div style="clear:both"></div>			
				
		<div id="main_background">
			<a href="#top" id="top_go" class="scroll_top" style="display:none">
			<i></i>
			</a>
				<div id ="p1" class="content_box">
					<div class="content_title">상품소개</div>
					<div class="description"><%=tourDto.getDescription()%></div>
					<img src="<%=tourDto.getDescriptionImg()%>">
				<div style="clear:both"></div>
				</div><br/>
				
					<div id="p2" class="content_box">
						<div class="content_title">미팅장소</div>
						<div id="map">
							<div id="tourLat" data-lat="<%=tourDto.getTourLat()%>"></div>
							<div id="tourLng" data-lng="<%=tourDto.getTourLon()%>"></div>
						</div>
						<div class="mt_text">미팅포인트<br/><%=tourDto.getTourPoint()%></div><br/>
						<div class="mt_text">미팅시간<br/><%=tourDto.getTourTime() %></div>
					</div>
				<div style="clear:both"></div>
				
					<div id ="p3" class="content_box">
						<div class="content_title">꼭! 확인하세요</div>
						<div class="caution_box">
							<div class="caution_box_A">
							<%=tourDto.getCaution1()%>
							<%=tourDto.getCaution2()%>
							</div>
							
							<div class="caution_box_B">
							<%=tourDto.getCaution3()%>
							</div>
							<div style="clear:both"></div>
							<div class="caution_box_C"><%=tourDto.getCaution4()%></div>
						</div>
						<div style="clear:both"></div>
					</div>
					<div style="clear:both"></div>
					
					
					<div id = "p4" class="content_box">
						<div  class="content_title">이용후기</div>
							<div class="tour_score_box">
								<div class="tour_score_bg"><div class="tour_star_ico" style="width:<%=score%>%;"></div></div>
								<div class="tour_score">
								<strong><%=userRating%></strong>
								 / 5.0
								</div>
								<%if(reviewCount != 0 ){ %>
								<div class="score_box_text"><strong><%=reviewCount%></strong>개의 이용후기가 있습니다.</div>
								<%}else{ %>
								<div class="score_box_text"><strong>등록된 후기가 없습니다.</strong></div>
								<%} %>
								<div style="clear:both"></div>
							</div>
<%
	for(int i = 0; i < reiveList.size(); i++){
double userScore = reiveList.get(i).getUserRating();
	if(userScore == 5.0){
		score = 100;
	}else if(userScore == 4.0){
		score = 80;
	}else if(userScore == 3.0){
		score = 60;
	}else if(userScore == 2.0){
		score = 40;
	}else if(userScore == 1.0){
		score = 20;
	}else{
		score = 0;
	}
%>
						<div class="tour_review">
							<div class="user_score_bg">
								<div class="user_star_ico" style="width:<%=score%>%;"></div>
								</div>
								<div class="user_score">평점 <%=userScore%></div>
								<div class="fr">작성일 : 
								<span class="tr_date"><%=reiveList.get(i).getTrDate()%></span>
								</div>
								<div style="clear:both"></div>
								
								<div class="user_box">
								<div class="fl">작성자 :</div>
								<div id="user_id1" class="user_id fl"><%=reiveList.get(i).getNickName()%></div>
					<%if(idx == reiveList.get(i).getIdx()){ %>		
								<div class="review_btn_box fr">
	         						<span class="review_menu fr"></span>
		         					<div class="review_btn fl">
										<button id = "<%=reiveList.get(i).getTno() %>" class="review_update " name ="<%= idx%>">수정</button>
		         						<button id = "<%=reiveList.get(i).getTno() %>" class="review_delete">삭제</button>
		         					</div>
	         					</div>
					<%}; %>
								<div style="clear:both"></div>
								<div class="user_text fl"><%=reiveList.get(i).getReviewTitle()%></div>
								<div style="clear:both"></div>
								<div class="user_content" style="display:none"><%=reiveList.get(i).getReviewContent()%></div>
								<div class="indetails_box fr">
								<button class = "look_btn">자세히</button>
								</div>
								<div style="clear:both"></div>
							</div><br/>
						</div>
<%
};
%>
						<div class="look_content">
							<input type="button" value="후기 더보기" onclick = ""/>
						</div>
						<div style="clear:both"></div>
					</div>
					
					<div style="clear:both"></div>
					<div id = "p5" class="content_box">
						<div class="content_title">상품에 대한 1:1 문의를 남겨주세요.</div>
						<form action="Controller">
							<textarea class="item_qanda fl" placeholder="내용을 입력해 주세요." name = "content" required></textarea>
							<input type="hidden" name="command" value="qanda_write_input"/>
							<input type="hidden" value="<%=idx%>" name = "idx"/>
							<input type="hidden" value="<%=tourId%>" name = "tourId"/>
							<input type="hidden" value="여행 상품 문의" name = "category"/>
							<input type="hidden" value="<%=tourDto.getTourTitle()%> 문의 " name = "title"/>
							<input type="submit" value="등록완료" class="lf"/>
						</form>

						<div class="qanda_txt">등록된 문의는 고객샌터에서 확인 가능 합니다.</div>
						<div style="clear:both"></div>
					</div>	
				
			  <div class="tour_item_box">
			  <div class="slider2">
<%
	for(int i = 0;  i < itemList.size(); i ++){
%>				
				<div id = "<%=itemList.get(i).getTourId()%>"class="fl tour_item">
	                <img src="<%=itemList.get(i).getImg()%>" alt="준비중입니다.">
	                <div class="tour_item_title">
	                <p><%=itemList.get(i).getTourTitle() %></p>
	                </div>
	
	                <div class="rating_price_box">
	                  <div class="fl fb tour_item_rating">
	                    <i></i>
	                    <span><%=itemList.get(i).getUserRating() %></span>
	                  </div>
	                  <div class="fr tour_item_price">
	                  <%=itemList.get(i).getMoney() %>원
	                  </div>
	                 </div>
	             </div>
<%
	};
%>				</div>
				</div>
					<div style="clear:both"></div>
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
	
<script>
$(document).ready(function() {
	 let tourId = $("input[name='tourId']").val();
	    let likeCheck = 0;

	    $.ajax({
	        data: {tourId: tourId},
	        type: "GET",
	        url: "TourLikeCheck",
	        success: function (data) {
	            likeCheck = parseInt(data); // 서버에서 넘어온 값은 숫자이므로 파싱하여 저장
	            updateLikeUI(); // 값을 받아온 후에 UI를 업데이트하는 함수 호출
	        },
	        error: function () {
	            alert("요청 실패"); // 요청이 실패한 경우 처리
	        },
	    });

	    function updateLikeUI() {
	        if (likeCheck == 1) {
	            $(".tour_like").css("background-position", "-102px 1px");
	        } else {
	            $(".tour_like").css("background-position", "-68px 1px");
	        }
	    }
	    $(".tour_like").click(function() {
	        let tourId = $("input[name='tourId']").val();
	        let idx = $("input[name='idx']").val();

	        if (idx != 0) {
	            $.ajax({
	                url: "TourLikeUpdate",
	                type: "post",
	                data: { tourId: tourId, likeCheck: likeCheck },
	                dataType: "json",
	                success: function(response) {
	                    likeCheck = parseInt(response.updateCheck); // 서버에서 받아온 값으로 업데이트
	                    updateLikeUI(); // 값에 따라 UI 업데이트
	                    if(likeCheck === 1){
	                    	alert("찜 목록에 추가 되었습니다.");
	                    }else{
	                    	alert("찜 목록에서 삭제 되었습니다.");
	                    };
	                },
	                error: function(xhr, status, error) {
	                    console.log("오류 입니다.");
	                }
	            });
	        } else {
	            alert("로그인후 이용해주세요");
	        }
	    });
	  const date = new Date();
	  let selectedDateValue = null;
	  const year = date.getFullYear();
	  const month = String(date.getMonth() + 1).padStart(2, '0');
	  const day = String(date.getDate()).padStart(2, '0');
	  const formattedDate = `${year}-${month}-${day}`;
	  $("#date").val(formattedDate);
	  
	  $("#date").datepicker({
	    dateFormat: 'yy-mm-dd',
	    minDate: 0,
	    onSelect: function(selectedDate) {
	      selectedDateValue = selectedDate; // 선택된 날짜 값을 변수에 설정
	      console.log(selectedDateValue);
	    }
	  });
	  var oPay = Naver.Pay.create({
	    "mode": "development", // development or production
	    "clientId": "dQPaTGkl7UD9gyUVttF3", // clientId
	    "openType": "popup",
	    "onAuthorize": function (oData) {
	      if (oData.resultCode === "Success") {
	        console.log("성공");
	        handlePaymentSuccess(selectedDateValue);
	      } else {
	        console.log("실패");
	        // 필요 시 oData.resultMessage 에 따라 적절한 사용자 안내 처리
	      }
	    }
	  });

	  // 네이버페이 결제 버튼에 click 이벤트를 할당
	  $(".naver_pay").click(function () {
		  let idx = <%=idx%>;
		  if(idx != 0){
	    oPay.open({
	      "merchantUserKey": "test",
	      "merchantPayKey": "20230708000001",
	      "productName": "<%=tourDto.getTourTitle()%>",
	      "totalPayAmount": "<%=tourDto.getPrice()%>",
	      "taxScopeAmount": "<%=tourDto.getPrice()%>",
	      "taxExScopeAmount": "0",
	      "returnUrl": "http://localhost:9090/WebProject1/kakao/kakaoPay.jsp",
	      "displayItems": [
	        {
	          "category": "상품 카테고리",
	          "name": "상품 이름",
	          "qty": 1,
	          "unitPrice": "<%=tourDto.getPrice()%>",
	          "imageUrl": "<%=tourDto.getImg()%>",  // 이미지 파일의 경로
	        }
	      ]
	    });
		  }else{
			alert("로그인후 이용해주세요!");			  
		  	location.href="Login.jsp";
		  }
	  });

	  function handlePaymentSuccess(dateValue) {
		    const redirectURL = "naverPayAction.jsp?idx=<%=idx%>&tourId=<%=tourId%>&price=<%=tourDto.getPrice()%>&tourDate=" + encodeURIComponent(dateValue);
		    location.href = redirectURL;
		    alert("결제가 완료되었습니다. 감사합니다.");
		  }
		
$(".kakao_pay").click(function() {
	let idx = <%=idx%>
	if(idx != 0){
		
    const selectedDate = selectedDateValue; // 선택된 날짜 값 가져오기
    $.ajax({
      method: "POST",
      url: "https://kapi.kakao.com/v1/payment/ready",
      data: {
        cid: "TC0ONETIME", 
        partner_order_id: "<%=tourId%>",
        partner_user_id: "<%=idx%>",
        item_name: "<%=tourDto.getTourTitle()%>",
        quantity: 1,
        total_amount: <%=tourDto.getPrice()%>,
        tax_free_amount: 0,
        approval_url: "http://localhost:9090/WebProject1/kakaoPayAction.jsp?idx=<%=idx%>&tourId=<%=tourId%>&price=<%=tourDto.getPrice()%>&tourDate=" + encodeURIComponent(selectedDate),
        cancel_url: "http://localhost:9090/WebProject1/cancel_payment.jsp",
        fail_url: "http://localhost:9090/WebProject1/cancel_payment.jsp"
      },
      headers: {
        Authorization: "KakaoAK 76d6d9de40b88bc0ee6311c867494e5c"
      }
    })
    .done(function(msg) {
      window.open(msg.next_redirect_pc_url, '카카오페이QR결제', 'width: 100px, height: 200px; scrollbars=yes');
    });
	}else{
		alert("로그인후 이용해주세요!");
		location.href = "Login.jsp";
	}
  });
$(".item_pay").click(function(){
	let idx = <%=idx%>;
	if(idx !=0){
		 const selectedDate = selectedDateValue; 
		 var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
			    var tossPayments = TossPayments(clientKey) // 클라이언트 키로 초기화하기
			    tossPayments.requestPayment('카드', { // 결제수단
			    	  // 결제 정보
			    	  amount: <%=tourDto.getPrice()%>,
			    	  orderId: 'M2wD8fqDA2ZYrnuScDNM4',
			    	  orderName: '<%=tourDto.getTourTitle()%>',
			    	  customerName: '박토스',
			    	  successUrl: "http://localhost:9090/WebProject1/tossPayAction.jsp?idx=<%=idx%>&tourId=<%=tourId%>&price=<%=tourDto.getPrice()%>&tourDate=" + encodeURIComponent(selectedDate),
			    	  failUrl: 'http://localhost:8080/fail',
			    	  flowMode: 'DIRECT',
			    	  easyPay: '토스페이'
			    	})
			    	.catch(function (error) {
			    	  if (error.code === 'USER_CANCEL') {
			    	    // 결제 고객이 결제창을 닫았을 때 에러 처리
			    	  } else if (error.code === 'INVALID_CARD_COMPANY') {
			    	    // 유효하지 않은 카드 코드에 대한 에러 처리
			    	  }
			    	})
	}else{
		alert("로그인후 이용해주세요");
		location.href = "Login.jsp"
	}
	});
		$(".item_inquiry").click(function(){
			  Kakao.Channel.chat({
			      channelPublicId: '_xfxoGzG',
			    });
		});
		$("input[type=submit]").click(function(){
		    let idx = <%=idx%>;
		    if (idx === 0) {
		        alert("로그인 후 이용해주세요!");
		        return false; // 폼 제출을 중단
		    }
		    return true; // 폼 제출을 진행
		}) 
});
	
		
	
  </script>  
</body>
</html>