<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.TourPackageDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
int tourId = Integer.parseInt(request.getParameter("tourId"));
int idx = Integer.parseInt(request.getParameter("idx"));
int price = Integer.parseInt(request.getParameter("price"));
String tourDateParam = request.getParameter("tourDate");
java.sql.Date sqlTourDate = null;

// 선택된 날짜가 없으면 오늘 날짜로 설정
if (tourDateParam == null || tourDateParam.isEmpty()) {
    java.util.Date todayDate = new java.util.Date();
    sqlTourDate = new java.sql.Date(todayDate.getTime());
} else {
    try {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date tourDate = dateFormat.parse(tourDateParam);
        sqlTourDate = new java.sql.Date(tourDate.getTime());
    } catch (Exception e) {
        e.printStackTrace();
        // 날짜 파싱에 실패하면 오늘 날짜로 설정
        java.util.Date todayDate = new java.util.Date();
        sqlTourDate = new java.sql.Date(todayDate.getTime());
    }
}

TourPackageDao tdao = new TourPackageDao();
tdao.kakaoPay(idx, tourId, price, sqlTourDate);
%>
<script>
	alert("결제가 완료되었습니다.");
	window.close();
</script>