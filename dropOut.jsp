<%@page contentType="text/html; charset=UTF-8" %>
<%@page import = "java.sql.*" %>
<%
	String s_ID = (String)session.getAttribute("s_ID");
	
	ResultSet rs = null;
	String Query="";
	Statement stmt = null;
	Connection conn = null;	
	String db_url = "jdbc:mysql://localhost:3306/bookingDB";
	String db_id = "abc";
	String db_pw = "2fjsTlqkf!";
	

	try{	
		Class.forName("com.mysql.jdbc.Driver"); 
		conn = DriverManager.getConnection(db_url, db_id, db_pw);
		Query = "delete from user_info where user_id= '"+s_ID+"';
		stmt = conn.createStatement();
		rs = stmt.executeUpdate(Query);
		session.invalidate();  
		%>
		<script>
			alert("회원탈퇴가 완료되었습니다.");
			window.location = "home.jsp";
		</script>
	<%
	
	
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