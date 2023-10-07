<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("email");
	String idcode = request.getParameter("idcode");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상상속 유럽여행을 현실로, 스투비 플래너</title>
  <link rel="icon" href="resources/images/favicon.png">
  <link rel="stylesheet" href="resources/css/reset.css">
  <link rel="stylesheet" href="resources/css/changepw.css">
  <script src="resources/js/jquery-3.7.0.min.js"></script>
</head>

<body>
	 <section>
    <div class="changepw_box">
      <div class="changepw_contain">
        <div class="changepw_content">
          <h3>SIGN UP</h3>
          <p>상상속 유럽여행을 현실로, 스투비플래너</p>
          <form name="frm" method="post" action="Controller">
          	<input type="hidden" name="command" value="ChangePw">
            <input type="hidden" name="email" value="<%=email%>">
  					<input type="hidden" name="idcode" value="<%=idcode%>">
            <div class="input_pass">
              <label for="inputPass">비밀번호</label>
              <input class="input1 pass" type="password" name="inputPass" id="inputPass" placeholder="비밀번호(문자, 숫자, 특수문자 포함 10~20자)">
            </div>
            <div class="input_passcheck">
              <label for="inputPasscheck">비밀번호확인</label>
              <input class="input1 pass" type="password" id="inputPasscheck" placeholder="비밀번호 재입력">
            </div>
            <div class="change_btn">
              <button type="submit" id="changePw">비밀번호 변경</button>
            </div>
          </form>
          </div>
        </div>
      </div>
    </div>
  </section>
  <script>
	
  	$("#changePw").click(function(){
			$(function(){
				let checkPW = RegExp(/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()_+]).{10,20}$/);
				 //비밀번호 유효성검사
		     if(!checkPW.test($("#inputPass").val())){
		      alert("비밀번호는 문자, 숫자, 특수문자 포함 10~20자 입니다");
		      $("#inputPass").val("");
		      $("#inputPass").focus();
		      return false;
		    }
		         
		    //비밀번호 확인란 공백 확인
		    if($("#inputPasscheck").val() == ""){
		      alert("패스워드 확인란을 입력해주세요");
		      $("#inputPasscheck").focus();
		      return false;
		    }
		    
		    if($("#inputPass").val() != $("#inputPasscheck").val()){
		      alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		      $("#inputPass").val("");
		      $("#inputPasscheck").val("");
		      $("#inputPass").focus();
		      return false;
		    }
			})
  	});
		
	</script>
</body>
</html>