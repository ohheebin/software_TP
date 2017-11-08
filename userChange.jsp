<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>    
<%
//회원정보변경 소스
String s_ID = (String)session.getAttribute("s_ID");
String passwd= request.getParameter("inputpw");
String name= request.getParameter("inputname");
String tel= request.getParameter("inputphone");
String email= request.getParameter("inputemail");
String addr= request.getParameter("inputaddress");
String card = request.getParameter("inputcard");
String db_url = "jdbc:mysql://localhost:3306/bookingDB";
String db_id = "abc";
String db_pw = "2fjsTlqkf!";

String userID=s_ID;
Connection conn = null;
String Query ="";
Statement stmt = null;

ResultSet rs = null;

try{	

	Class.forName("com.mysql.jdbc.Driver"); 

	conn = DriverManager.getConnection(db_url, db_id, db_pw);
	Query = "update user_info set user_pw = '" + passwd + "', user_name = '" + name + "', user_phone = '" + tel + "', user_address = '" + addr + "', user_card = '" + card + "', user_email = '" + email + "' where user_id = '"+ userID + "'";
	stmt = conn.createStatement();

	stmt.executeUpdate(Query);

		%>
		<script>
			alert("회원정보가 변경됬습니다.");
			window.location = "inquiry.jsp";
		</script>
	<%
	
}catch(Exception e){
}finally{
		if (rs!= null) {
				rs.close();
		}  
		if (stmt!= null) {
				stmt.close();
		}

		if (conn!= null) {
				conn.close();
		}

}

%>