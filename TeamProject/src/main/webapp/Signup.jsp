<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>상상속 유럽여행을 현실로, 스투비 플래너</title>
  <script src="resources/js/jquery-3.7.0.min.js"></script>
  <link rel="icon" href="../images/favicon.png">
  <link rel="stylesheet" href="resources/css/reset.css">
  <link rel="stylesheet" href="resources/css/signup.css">
  <script src="resources/js/signup.js"></script>
	<script type="text/javascript">
		function signupCheckFunction(){
			let checkId = 0;
			let userEmail = $("#inputEmail").val();
			$.ajax({
				type: 'POST',
				url: 'Controller?command=checkid',
				data: {email: userEmail},
				success: function(result){
					if(result == 0){
						alert("사용 가능한 이메일 입니다.");
					} else {
						alert("이미 있거나 사용할 수 없는 이메일 입니다.");
					}
				}
			});
		}
	</script>
	<% %>
</head>
<body>
  <section>
    <div class="signup_box">
      <div class="signup_contain">
        <div class="signup_content">
          <h3>SIGN UP</h3>
          <p>상상속 유럽여행을 현실로, 스투비플래너</p>
          <form name="frm" method="post" action="Controller">
          <input type="hidden" name="command" value="signup">
            <div class="input_email">
              <label for="inputEmail">이메일</label>
              <input class="input0" type="text" name="email" id="inputEmail"  autocomplete="off">
              <input type="button" class="email_btn" onclick="signupCheckFunction()" value="확인">
            </div>
            <div class="input_name">
              <label for="input_name">이름</label>
              <input class="input1" type="text" id="inputName" name="inputName" autocomplete="off" >
            </div>
            <div class="input_nick">
              <label for="inputNick">닉네임</label>
              <input class="input1" type="text" id="inputNick" name="inputNick" autocomplete="off" >
            </div>
            <div class="input_pass">
              <label for="inputPass">비밀번호</label>
              <input class="input1 pass" type="password" name="inputPass" id="inputPass" placeholder="비밀번호(문자, 숫자, 특수문자 포함 10~20자)">
            </div>
            <div class="input_passcheck">
              <label for="inputPasscheck">비밀번호확인</label>
              <input class="input1 pass" type="password" name="inputPasscheck" id="inputPasscheck" placeholder="비밀번호 재입력">
            </div>
            <div class="agree_box">
              <div class="agree content1">
                <input type="checkbox" id="ageChecked" name="agree1" value="Y">
                <label for="ageChecked">본인은 만 14세 이상입니다.<sup>(필수)</sup></label>
              </div>
              <div style="clear:both"></div>
              <div class="agree content2">
                <input type="checkbox" id="policyChecked" name="agree2" value="Y">
                <label for="policyChecked">개인정보수집에 동의합니다.<sup>(필수)</sup></label>
                <a href="#">보기</a>
              </div>
              <table>
                <tr>
                  <td colspan="2">개인정보수집</td>
                </tr>
                <tr>
                  <td>목적</td>
                  <td><span>개인식별, 회원자격 유지・관리</span></td>
                </tr>
                <tr>
                  <td>항목</td>
                  <td><span>이름,아이디,이메일,닉네임,비밀번호</span></td>
                </tr>
                <tr>
                  <td>보유기간</td>
                  <td><span>회원탈퇴 시 즉시 파기</span></td>
                </tr>
              </table>
              <div class="agree content3">
                <input type="checkbox" id="agreementsChecked" name="agree3" value="Y">
                <label for="agreementsChecked">이용약관에 동의합니다.<sup>(필수)</sup></label>
                <a href="#">보기</a>
              </div>
              <div class="signup_btn">
                <button type="submit" >회원가입</button>
              </div>
              <div class="back_btn">
                <input type="button" onclick="history.back()" value="뒤로가기">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </section>
</body>
</html>