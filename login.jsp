<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>    
<%
//로그인 과정JSP 페이지
String id= request.getParameter("id");
String password= request.getParameter("password");

String userID="";
String userPWD="";
String db_url = "jdbc:mysql://localhost:3306/bookingDB";
String db_id = "abc";
String db_pw = "2fjsTlqkf!";

   Connection conn = null;
   PreparedStatement pstmt = null;
   Statement stmt = null;
   String Query ="";


ResultSet rs = null;

try{
		Class.forName("com.mysql.jdbc.Driver"); 

		conn = DriverManager.getConnection(db_url, db_id, db_pw);
		
		Query = "select * from user_info where user_id= '"+id+"'" ;
		stmt = conn.createStatement();

		rs = stmt.executeQuery(Query);

		while (rs.next()) {
				//테이블에 저장된 애트리뷰트 이름
				userID= rs.getString(1);
				userPWD= rs.getString(2);
		}

		if((userID.equals(id) && userPWD.equals(password))) 
		{
				session.setAttribute("s_ID", userID);
				session.setMaxInactiveInterval(1000);
				response.sendRedirect("./loginHome.jsp");
		}
		else{
			%>
			<script>
			alert("계정이 없거나 비밀번호가 일치하지 않습니다");
			window.location = "home.jsp";
			</script>
			<%
		}
}catch(Exception e){
}finally{
		if (rs!= null) {
				rs.close();
		}  
		if (pstmt!= null) {
				pstmt.close();
		}

		if (conn!= null) {
				conn.close();
		}

}

%>
