<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<%@ page import = "java.util.*"%>
<%@ page import = "javax.mail.*"%>
<%@ page import = "javax.mail.internet.*"%>
<%
    String driver = "oracle.jdbc.driver.OracleDriver";
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String id = "stubby";
    String pw = "123456";
%>
<%	
		String email = request.getParameter("email");
		String idcode = "";
		for (int i = 0; i < 6; i++) {
		    char randomChar = (char)((int) (Math.random() * 26) + 97);
		    idcode += randomChar;
		}
		
		
%>
<%
	 Class.forName(driver);
	 Connection conn = DriverManager.getConnection(url, id, pw);
	 
	 String sql = "SELECT * FROM member WHERE email = ?";
   PreparedStatement pstmt = conn.prepareStatement(sql);
	 
   pstmt.setString(1, email);
	 
   ResultSet rs = pstmt.executeQuery();
   
   if(rs.next()){
	   sql = "UPDATE member set idcode = ? WHERE email = ?";
	   pstmt = conn.prepareStatement(sql);
	   pstmt.setString(1, idcode);
	   pstmt.setString(2, email);
	   pstmt.executeUpdate();
	   sendmail(email, idcode);
%>
<%
		
%>
		<script>
			alert("이메일을 확인해주세요.");
			window.location.href='Login.jsp';
		</script>
<%
  	 
   } else if(!rs.next()){
%> 
	<script>
		alert("존재 하지 않는 이메일 입니다.")
		location.href = "Findpw.jsp";
	</script> 	 
<%    }
   pstmt.close();
   rs.close();
%>
<%! 
		public void sendmail(String email, String idcode){
			String host = "smtp.naver.com";
			  final String user = "apple9568@naver.com";
			  final String password = "Y6L77V2ZS7U9";
		
			  System.out.println("[시스템]" + email + "님에게 인증 메일 보내는 중...");
			  // Get the session object
			  Properties props = new Properties();
			  props.put("mail.smtp.host", host);
			  props.put("mail.smtp.auth", "true");
		
			  Session session = Session.getInstance(props, new javax.mail.Authenticator() {
			   protected PasswordAuthentication getPasswordAuthentication() {
			    return new PasswordAuthentication(user, password);
			   }
			  });
		
			  // Compose the message
			  try {
			   MimeMessage message = new MimeMessage(session);
			   message.setFrom(new InternetAddress(user));
			   message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
		
			   // Mail Title
			   message.setSubject("[스투비플래너]비밀번호 변경 이메일");
			   
			   // Mail content
			   
			   message.setContent("인증 URL: " + "<a href='http://localhost:9090/WebProject1/ChangePw.jsp?email="+email+"&idcode="+idcode+"'>비빌번호 변경</a>","text/html; charset=euc-kr");
			   
			   // send system message
			   Transport.send(message);
			   System.out.println("[시스템]메일이 성공적으로 보내졌습니다!" );
			   
		
			  } catch (MessagingException e) {
			  	
			   e.printStackTrace();
			  }
		}
%>

