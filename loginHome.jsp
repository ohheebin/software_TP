<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>    
<%
		String s_ID = (String)session.getAttribute("s_ID");
%>
<!DOCTYPE html>
<html>
<title>로그인 화면</title>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>
	<header>
		<div id="upper">
			<h1>home</h1>
		</div>
	</header>
	<aside id="login">
		<table id="table">
			<tr>
			<td>
				<button onclick="loginHome()" id="home">home</button>
			</td>
			</tr>
			<tr>
			<td id="id">
				ID :<%=s_ID%>
			</td>
			</tr>
			<tr>
			<td>
				<button onclick="customerInquiry()" id="button">회원정보조회</button>
				<button onclick="logout()" id="button">로그아웃</button>
			</td>
			</tr>
			<tr>
			<td>
				<button onclick="bookingInquiry()" id="home">예약내역조회</button>
			</td>
			</tr>
		</table>
	</aside>
	<section id="main">
		<div id="check">
		<table>
			<tr>
				<td>출발지</td>
				<td>도착지</td>
			</tr>
			<form method="post" action="loginBusinformation.jsp">
			<tr>
				<td id="tr">
				<select id="select" name="startSelect">
<%
String _start= "";
String _end= "";
String _start_time= "";
String _end_time= "";

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
		Query = "select bus_start from start_bus" ;
		stmt = conn.createStatement();
		rs = stmt.executeQuery(Query);
		while (rs.next()) {
				_start= rs.getString(1);
				%>
					<option><%=_start%></option>
				<%
		}
		Query = "select bus_end from end_bus" ;
		stmt = conn.createStatement();
		rs = stmt.executeQuery(Query);
				%>
				</select>
				</td>
				<td id="tr">
				<select id="select" name="endSelect">
				<%
			while (rs.next()) {
				_end= rs.getString(1);	
				
				%>
				<option><%=_end%></option>
				<%
			}
				%>
				</select>
				</td>
			</tr>
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
			<tr>
				<td>출발시간</td>
				<td>도착시간</td>
			</tr>
			<tr>
				<td>
				<input type="time" id="select"></input>
				</td>
				<td>
				<input type="time" id="select"></input>
				</td>
			</tr>
			<tr>
			<td></td>
				<td>
					<button type="submit" value="노선조회" id="sigup">노선조회</button>
				</td>
			</tr>
			</form>
		</table>
		</div>
	</section>
	<script type="text/javascript" src="myScript.js"></script>
</body>
</html>