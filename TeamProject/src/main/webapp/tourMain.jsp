<%@page import="dto.TourPackageDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.google.gson.Gson"%>

<%
   	ArrayList<TourPackageDto> natList = (ArrayList<TourPackageDto>)request.getAttribute("natList");
   	TourPackageDto nation = (TourPackageDto)request.getAttribute("nation");
   	String background = nation.getBackgroundImg();
   	String flag = nation.getFlag();
   	String natName = nation.getNatName();
   	String category1 = nation.getCategory1();
   	String category2 = nation.getCategory2();
   	String category3 = nation.getCategory3();
   	ArrayList<TourPackageDto> tourItemList1 = (ArrayList<TourPackageDto>)request.getAttribute("tourItemList1");
   	ArrayList<TourPackageDto> tourItemList2 = (ArrayList<TourPackageDto>)request.getAttribute("tourItemList2");
   	ArrayList<TourPackageDto> tourItemList3= (ArrayList<TourPackageDto>)request.getAttribute("tourItemList3");
	
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
<title>투어 메인</title>
	<link rel="stylesheet" href="resources/css/header_footer.css">
	<link rel="stylesheet" href="resources/css/tour_main.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
	<script src="resources/js/jquery-3.7.0.min.js"></script>
	<script src="resources/js/tour_main.js"></script>
	<script src="resources/js/Stubby.js"></script>
	<script src="resources/js/bxslider.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
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
          <li><a href="Controller?command=tour_main" class="on">유럽투어</a></li>
          <li><a href="Controller?command=HotelMain">숙소</a></li>
          <li><a href="Controller?command=diary">여행기</a></li>
        </ul>        
      </div>
    </div>
  </header>
        <div id= "nation_img_box"  class = "backImg"style="background-image:url(<%=background%>)">
            <div class="innerbox" >
            <img class = "flag" src="<%=flag%>" alt="">
            </div>
            <div style="clear: both;"></div>
            <a href="#top" id="top_go" class="scroll_top" style="display:none"><i></i></a>
	        <div style="clear:both"></div>
        </div>
         
        <div id="nation_choice_box">
            <%
           	for(int i = 0; i < natList.size(); i++){ 
            %>
            <div id = "<%=natList.get(i).getNatId()%>"class="fl naticon">
                    <img src="<%=natList.get(i).getNatIcon() %>" alt="">
                    <div><%=natList.get(i).getNatName()%></div>
            </div>
           <% 
           	};
           %> 
       		 </div>
            <div style="clear:both"></div>
            
        <div class = "tour_none_item">
			<div class="none_package">
			등록된 페키지가 없습니다. 빠른 시일 내에 준비 하도록 하겠습니다. 감사합니다.
			</div>
		</div>		
		
		<%if(category1 ==null && category2 ==null && category3 ==null){%>
			<div id = tour_item_box>
			<div class="none_package">
			등록된 페키지가 없습니다. 빠른 시일 내에 준비 하도록 하겠습니다. 감사합니다.
			</div>
			</div>			
			<%}
			if(category1 !=null){
			%>
			<div id="tour_item_box">
		    	<div class="category category1">
		    		<div class="title"><%= category1 %></div>
		    	</div>
		 	  <div style="clear:both"></div>
		<div class= "list_A">
			<div class="slider1">
				
    <%
    for(int i = 0; i < tourItemList1.size(); i++){
    %>	
            <div id ="<%=tourItemList1.get(i).getTourId() %>" class="fl top_item">
                    <img class = "tourImg" src="<%=tourItemList1.get(i).getImg()%>" alt="준비중입니다!!">
                    <div class="nation"><%=natName %></div>
                    <div class="text">＃<%=tourItemList1.get(i).getHash()%></div>
                    <div class="price"><%=tourItemList1.get(i).getMoney()%>원</div>
            </div>
            <%
            };
		};
            %>
         	</div>   
   		 </div>
            <div style="clear:both"></div>
   		 
            <%
            if(category2 !=null){
            %>
                <div class="category category2">
                    <div class="title"><%=category2%></div>
                </div>
                
            <div class="list_B">
 				<div class="slider2">
            <% 
            for(int i = 0; i < tourItemList2.size(); i++){
            %>
                <div id ="<%=tourItemList2.get(i).getTourId()%>" class="fl tour_item">
                        <img src="<%=tourItemList2.get(i).getImg() %>" alt="">
                        <div class="tour_item_title">
                            <p><%=tourItemList2.get(i).getTourTitle()%></p>
                        </div>
                        <div class="rating_price_box">
                            <div class="fl fb tour_item_rating">
                                 <i></i>
                                 <span><%=tourItemList2.get(i).getUserRating()%></span>
                            </div>
                            <div class="fr tour_item_price">
                                <%=tourItemList2.get(i).getMoney() %>원
                            </div>
                    </div>
                </div>
                <%
                };
            };
                %>
				</div>
			</div>
                <div style="clear: both;"></div>
			<%
			if(category3 !=null){
			   %>
                <div class="category category3">
                    <div class="title"><%=category3%></div>
                </div>
                
           <div class ="list_C">     
 				<div class="slider3">
            <% 
            for(int i = 0; i < tourItemList3.size(); i++){
            %>
                 <div id ="<%=tourItemList3.get(i).getTourId()%>" class="fl tour_item">
                        <img src="<%=tourItemList3.get(i).getImg() %>" alt="">
                        <div class="tour_item_title">
                            <p><%=tourItemList3.get(i).getTourTitle()%></p>
                        </div>
                        <div class="rating_price_box">
                            <div class="fl fb tour_item_rating">
                                 <i></i>
                                 <span><%=tourItemList3.get(i).getUserRating()%></span>
                            </div>
                            <div class="fr tour_item_price">
                                <%=tourItemList3.get(i).getMoney() %>원
                            </div>
                    </div>
                </div>
                <%
                };
			};
				%>
            	</div>
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
<script>
</script>
</html>