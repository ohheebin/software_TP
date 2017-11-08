<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>    
<%
//회원가입 소스
String id= request.getParameter("inputid");
String passwd= request.getParameter("inputpw");
String name= request.getParameter("inputname");
String tel= request.getParameter("inputphone");
String email= request.getParameter("inputemail");
String addr= request.getParameter("inputaddress");
String card = request.getParameter("inputcard");
String db_url = "jdbc:mysql://localhost:3306/bookingDB";
String db_id = "abc";
String db_pw = "2fjsTlqkf!";

String userID="";
String userPWD="";

Connection conn = null;
PreparedStatement pstmt = null;
String Query ="";
Statement stmt = null;

ResultSet rs = null;

try{	

	Class.forName("com.mysql.jdbc.Driver"); 

	conn = DriverManager.getConnection(db_url, db_id, db_pw);
	Query = "select * from user_info where user_id= '"+id+"'";
	stmt = conn.createStatement();

	rs = stmt.executeQuery(Query);

	if (rs.next()) {
		%>
		<script>
			alert("중복된 ID 입니다.");
			window.location = "join.jsp";
		</script>
	<%
	}else{
		if (rs!= null) {
			rs.close();
		}   
		if (stmt!= null) {
			stmt.close();
		}
		Query = "insert into user_info values('"+id+"','"+passwd+"','"+name+"','"+tel+"','"+addr+"','"+card+"','"+email+"')";
		stmt = conn.createStatement();
		stmt.executeUpdate(Query);
		%>
		<script>
			alert("회원가입 성공");
			window.location = "home.jsp";
		</script>
		<%
		
		
	}
}catch(Exception e){
		e.printStackTrace();
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