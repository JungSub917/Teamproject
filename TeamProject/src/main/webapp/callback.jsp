<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserDao" %>
<%@ page import="dto.UserDto" %>
<html>
<head>
	<title>네이버로그인</title>
  <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	<script type="text/javascript">
			let naverToken;
			let naverName;
			let naverEmail; 
			let naverNick;
			
		  var naver_id_login = new naver_id_login("bPWFQsTKxGachKNlsHc_", "http://localhost:9090/WebProject1/callback.jsp");
		  // 접근 토큰 값 출력
		  naverToken = naver_id_login.oauthParams.access_token;

		  // 네이버 사용자 프로필 조회
		  naver_id_login.get_naver_userprofile("naverSignInCallback()");
		  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
		  function naverSignInCallback() {
		    naverName = naver_id_login.getProfileData('name');
		    naverEmail = naver_id_login.getProfileData('email');
		    naverNick = naver_id_login.getProfileData('nickname');
		
			  $.ajax({
			  	type: 'POST',
			  	url: 'Controller?command=LoginNaverAction',
			  	data: {token: naverToken, name: naverName, email: naverEmail, nickname: naverNick},
			  	success: function(){
			  	  location.href = "Controller?command=MainPage";
			  	},
			  	error: function(e){
						alert("로그인 오류");
						location.href = "Login.jsp";
			  	}
			  }); 
		  }
		   
	</script>
</body>
</html>
