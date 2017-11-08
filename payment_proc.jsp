<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>   
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%
	String s_ID = (String)session.getAttribute("s_ID");
	String bus_no = request.getParameter("bus_no");
	Date book_date = new Date();
	String book_personCount = request.getParameter("book_personCount");
	String book_price = request.getParameter("book_price");
	String book_sitNo = request.getParameter("book_sitNo");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	String card_company = request.getParameter("card_company");
	String card_num = request.getParameter("card_num");
	String approval_no = request.getParameter("approval_no");
	String approval_date = request.getParameter("approval_date");
	
	String db_url = "jdbc:mysql://localhost:3306/bookingDB";
	String db_id = "abc";
	String db_pw = "2fjsTlqkf!";
	
	Connection conn = null;
	String Query ="";
	Statement stmt = null;
	
	ResultSet rs = null;
	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		
		conn = DriverManager.getConnection(db_url, db_id, db_pw);
		Query = "insert into book(user_id,bus_no,book_date,book_personCount,book_price,book_sitNo)values('"+s_ID+"','"+bus_no+"','"+sdf.format(book_date)+"','"+book_personCount+"','"+book_price+"','"+book_sitNo+"')";
		stmt = conn.createStatement();
		stmt.executeUpdate(Query);
		
		
		Query = "update bus_info SET bus_sit = bus_sit-1 where bus_no = '"+bus_no+"'";
		stmt = conn.createStatement();
		stmt.executeUpdate(Query);
		%>
		<script>
			alert("결제가 완료되었습니다.");
			window.location = "loginHome.jsp";
		</script>
		<%
	}catch(Exception e){
		e.printStackTrace();
	}
	
%>
