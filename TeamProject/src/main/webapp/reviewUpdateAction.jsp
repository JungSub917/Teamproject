<%@page import="dto.TourPackageDto"%>
<%@page import="dao.TourPackageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.opener.location.reload(); // 원래 페이지 새로고침하여 수정된 리뷰를 받아옴
	window.close(); // 팝업창 닫기
	alert("리뷰가 수정되었습니다.");
</script>