<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>    
<%
		String s_ID = (String)session.getAttribute("s_ID");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>홈 화면</title>
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
				<td id="siguptr">
				출발지&nbsp;&nbsp;&nbsp;&nbsp;->&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				도착지&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				출발시간&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				도착시간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;좌석
				</td>
			</tr>
			<%
			String bus_no = "";
			String bus_start = request.getParameter("startSelect");
			String bus_end = request.getParameter("endSelect");
			int bus_sit = 0;
			int bus_price = 0;
			String bus_start_time = "";
			String bus_end_time = "";
			
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
				Query = "select * from bus_info where bus_start= '"+bus_start+"' AND bus_end = '"+bus_end+"'";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(Query);
			
				while(rs.next()){
					bus_no = rs.getString(1);
					bus_start_time = rs.getString(4);
					bus_end_time = rs.getString(5);
					bus_sit = rs.getInt(6);
					bus_price = rs.getInt(7);
					%>
			<form method=post action="booking.jsp">
			<tr>
				<td id="siguptr">
				<%=bus_start%>&nbsp;&nbsp;&nbsp;&nbsp;->&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				<%=bus_end%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				<%=bus_start_time%>&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				<%=bus_end_time%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				<input type="hidden" id="price" name="price" value="<%=bus_price%>"><%=bus_price%></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=bus_sit%>석
				</td>
				<td id="siguptr">
				<%if(bus_sit == 0){%>
				&nbsp;&nbsp;&nbsp;<p>예매불가</p>
				<%}else{%>
				&nbsp;&nbsp;&nbsp;<input type="submit" value="좌석예매"></input>
				<%}%>
				</td>
				<input type="hidden" id="bus_no" name="bus_no" value="<%=bus_no%>"></input>
			</tr>
			</form>
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
		</table>
		</div>
	</section>
	<script type="text/javascript" src="myScript.js"></script>
</body>
</html>