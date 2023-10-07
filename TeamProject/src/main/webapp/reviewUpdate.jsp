<%@page import="dto.TourPackageDto"%>
<%@page import="dao.TourPackageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	TourPackageDto tourDto = (TourPackageDto)request.getAttribute("tDto");	
	int idx = Integer.parseInt(request.getParameter("idx"));
	int tno = Integer.parseInt(request.getParameter("tno"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/review.css">
<script src="resources/js/jquery-3.7.0.min.js"></script>
<script src="resources/js/Stubby.js"></script>
</head>

<body>
<div>
<div id="review_box">
	<div class="review_title">
		리뷰를 수정하겠습니다!
	</div>
	<div style="clear:both:"></div>
	<form action="Controller">
	<div class="star-rating">
	<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings"/>
	<label for="5-stars" class="star pr-4">★</label>
	<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
	<label for="4-stars" class="star">★</label>
	<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
	<label for="3-stars" class="star">★</label>
	<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
	<label for="2-stars" class="star">★</label>
	<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
	<label for="1-star" class="star">★</label>
	<input type="radio" id="0-star" name="rating" value="1" v-model="ratings" />
	<label for="0-star" class="star"></label>
	</div>
	
	<div style="clear:both:"></div>
	<div class="scoer_txt">좌측으로 스크롤하여 별점을 다시 선택해주세요</div>
	
	<div style="clear:both:"></div>
	<input type="hidden" value="review_update_input" name="command"/>
	<input type="hidden" value="<%=idx%>" name="idx"/>
	<input type="hidden" value="<%=tno%>" name="tno"/>
	<div class="content_title">
	<input type="text" id="title" placeholder="제목을 입력해주세요 " maxlength="25" name="title" value="<%=tourDto.getReviewTitle()%>">
	<div style="clear:both:"></div>
	</div>
	
	<div class="content_box">
	<textarea placeholder="내용을 입력해 주세요." maxlength="1300" name="content"><%=tourDto.getReviewContent()%></textarea><br/>
	<div style="clear:both:"></div>
	</div>
	
	<div class="btn">
	<input type="submit" value="등록완료" class="submit_btn"/>
	<button class="reset_btn" onclick="window.close()">취소</button>
	</div>
	</form>
	<script>
$(function() {
  $("#reviewForm").submit(function(e) {
    e.preventDefault(); // 폼 기본 동작 중단

    // 등록 완료 후 부모 창 새로고침
    window.opener.location.reload();
    window.close();
  });
});
</script>
</div>
</div>

</body>
</html>