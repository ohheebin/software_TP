<%@page contentType="text/html; charset=UTF-8" %>
<%@page import = "java.sql.*" %>
<%
	String s_ID = (String)session.getAttribute("s_ID");
	String busNo = request.getParameter("busno");
	String sitno = request.getParameter("sitno");
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
		
		Query = "delete from book where bus_no = '"+ busNo +"' AND user_id = '"+s_ID+"'";
		stmt = conn.createStatement();
		stmt.executeUpdate(Query);
		
		Query = "update bus_info SET bus_sit = bus_sit + 1 where bus_no = '"+ busNo +"'";
		stmt = conn.createStatement();
		stmt.executeUpdate(Query);
		
		%>
		<script>
			alert("예매취소가 완료되었습니다.");
			window.location = "checkReservation.jsp";
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