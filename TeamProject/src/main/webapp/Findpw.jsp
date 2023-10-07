<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>상상속 유럽여행을 현실로, 스투비 플래너</title>
  <link rel="icon" href="resources/images/favicon.png">
  <link rel="stylesheet" href="resources/css/reset.css">
  <link rel="stylesheet" href="resources/css/findpw.css">
</head>
<body>
  <section>
    <div class="searchpw_box">
      <div class="searchpw_contain">
        <div class="search_box">
          <h2>비밀번호 찾기</h2>
          <form action="FindpwAction.jsp">
            <div class="searchpw_email">
              <label for="findpw_email">이메일</label>
              <input type="text" id="findpw_email" name="email" autocomplete="off">
            </div>
            <p>회원가입시 등록하셨던 이메일 주소를 입력해주시면 임시 비밀번호를 발급해드립니다.</p>
            <div class="findpw_btn">
              <button type="submit" id="pw_bnt">발급받기</button>
            </div>
          </form>
          <p>* 메일이 도착하기까지 몇 분 정도 소요될 수 있습니다.</p>
          <p>* 스팸 메일함으로 발송될 수 있으니 체크바랍니다.</p>
          <div class="back_btn">
            <a href="Login.jsp">
              <p>뒤로가기</p>
            </a>
          </div>
        </div>
      </div>
    </div>
  </section>
</body>
</html>