$(function(){
  let getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
  let checkName = RegExp(/^[가-힣]|[A-Z]|[a-z]$/);
  let checkPW = RegExp(/^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()_+]).{10,20}$/);

  $(".email_btn").click(function(){
    //이메일 공백 확인
    if($("#inputEmail").val() == ""){
      alert("잘못된 이메일 형태입니다.");
      $("#inputEmail").focus();
      return false;
    }
        
    //이메일 유효성 검사
    if(!getMail.test($("#inputEmail").val())){
      alert("잘못된 이메일 형태입니다.")
      $("#inputEmail").val("");
      $("#inputEmail").focus();
      return false;
    }
  });
  $(".signup_btn").click(function(){
    // 이름 공백 검사
    if($("#inputName").val() == ""){
      alert("이름을 적어주세요");
      $("#inputName").focus();
      return false;
    }
    // 이름 유효성 검사
    if(!checkName.test($("#inputName").val())){
      alert("이름을 적어주세요")
      $("#inputName").val("");
      $("#inputName").focus();
      return false;
    }
    // 닉네임 공백 검사
    if($("#inputNick").val() == ""){
      alert("닉네임을 적어주세요");
      $("#inputNick").focus();
      return false;
    }
    // 닉네임 유효성 검사
    if(!checkName.test($("#inputNick").val())){
      alert("닉네임을 적어주세요")
      $("#inputNick").val("");
      $("#inputNick").focus();
      return false;
    }
    //  //비밀번호 유효성검사
     if(!checkPW.test($("#inputPass").val())){
      alert("비밀번호는 문자, 숫자, 특수문자 포함 10~20자 입니다");
      $("#inputPass").val("");
      $("#inputPass").focus();
      return false;
    }
         
    // //비밀번호 확인란 공백 확인
    if($("#inputPasscheck").val() == ""){
      alert("패스워드 확인란을 입력해주세요");
      $("#inputPasscheck").focus();
      return false;
    }
    // //비밀번호 서로확인
    if($("#inputPass").val() != $("#inputPasscheck").val()){
      alert("새 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
      $("#inputPass").val("");
      $("#inputPasscheck").val("");
      $("#inputPass").focus();
      return false;
    }
		let agree1Check = $("input[name='agree1']").is(":checked");
		let agree2Check = $("input[name='agree2']").is(":checked");
		let agree3Check = $("input[name='agree3']").is(":checked");
		
		if(!agree1Check){
			alert("만 14세 이상인지 체크해주세요.");
			return false;
		}
		if(!agree2Check){
			alert("개인정보수집에 동의해주세요.");
			return false;
		}
		if(!agree3Check){
			alert("이용약관에 동의해주세요.");
			return false;
		}
		alert("회원가입이 완료되었습니다");
  });
});
