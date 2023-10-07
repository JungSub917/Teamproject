<%@page import="dto.UserDto"%>
<%@page import="dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.MemberDto"%>
<%@page import="dao.MemberDao"%>
 
<%
	int idx=0;
	idx = (int)session.getAttribute("idx");
	UserDao udao = UserDao.getInstance();
	UserDto udto = udao.getUserinfo(idx);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/header_footer.css">
<link rel="stylesheet" href="resources/css/mypage.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
				<div id="content" class="fl">
					<div id="infotitle_container">
						<div id="infotitle">
							<b>기본정보</b>
						</div>
						<div class="user_info_box">
							<div>이름</div>
							<input id="name" type="text" value=<%=udto.getName()%>>
						</div>
						<div class="user_info_box">
							<div>닉네임</div>
							<input id="nickname" type="text" value=<%=udto.getNickname() %>>
						</div>
						<div class="none user_info_box">
							<div>이메일</div>
							<input readonly type="email" value=<%=udto.getEmail()%>>
						</div>
						<div id="infotitle">
							<b>비밀번호</b>
						</div>
					<div style="display:none;">
						<div class="user_info_box">
							<div>비밀번호</div>
							<input type="password">
						</div>
					</div>
						<div class="user_info_box">
							<div>새 비밀번호</div>
							<input type="password" id="newpassword">
							<div id="passcheck">특수문자, 숫자포함 10자 이상 적어주세요.</div>
						</div>
						<div class="user_info_box">
							<div>새 비밀번호 확인</div>
							<input type="password" id="newpasswordcheck">
							<div id="passrecheck">비밀번호가 다릅니다.</div>
						</div>
						<div id="differ_passMsg" style="color:red;">
	<!-- 						특수문자, 숫자포함 10자 이상 적어주세요.// 비밀번호가 일치하지 않습니다. -->
						</div>
						<div style="text-align: center;">
							<button id="delete_user_btn">회원탈퇴</button>
						</div>
						<div id="save_user_btn">
							<button id="save_user" >저장하기</button>
						</div>
					</div>
				</div>
	<div style="clear:both"></div>
</body>
</html>
