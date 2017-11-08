<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>    
<%
		String s_ID = (String)session.getAttribute("s_ID");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약내역조회 화면</title>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>
	<header>
		<div id="upper">
			<h1>예약내역조회</h1>
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
		<div id="reservation">
		<table>
			<tr>
				<td id="siguptr">
				버스번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
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
				도착시간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				&nbsp;&nbsp;&nbsp;&nbsp;총가격&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				총예매인원수&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				예매된좌석
				</td>
			</tr>
			<%
			String booked_no = "";
			String bus_no = "";
			int book_price = 0;
			int book_sitNo = 0;
			String bus_start = "";
			String bus_end = "";
			String bus_start_time = "";
			String bus_end_time = "";
			int book_personCount = 1;
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
				Query = "select * from bus_info where bus_no IN (select bus_no from book where user_id = '"+s_ID+"')";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(Query);
				Query = "select book_sitno from book where user_id = '"+s_ID+"'";
				stmt = conn.createStatement();
				ResultSet rt = stmt.executeQuery(Query);
				while(rs.next()&&rt.next()){
					bus_no = rs.getString(1);
					bus_start = rs.getString(2);
					bus_end = rs.getString(3);
					bus_start_time = rs.getString(4);
					bus_end_time = rs.getString(5);
					book_price = rs.getInt(7);
					book_sitNo = rt.getInt(1);
					%>
			<tr>
			<form method=post action="reservationCencle.jsp">
				<td id="siguptr">
				<input type="hidden" id="busno" name="busno" value="<%=bus_no%>"><%=bus_no%></input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
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
				<%=bus_end_time%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				&nbsp;&nbsp;&nbsp;&nbsp;<%=book_price%>원&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				<%=book_personCount%>명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</td>
				<td id="siguptr">
				<input type="hidden" id="sitno" name="sitno" value="<%=book_sitNo%>"><%=book_sitNo%></input>
				</td>
				<td id="siguptr">
				&nbsp;&nbsp;&nbsp;<button input="sumit">예매취소</button>
				<td>
			</tr>
					<%
				}
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
		</table>
		</div>
	</section>
	<script type="text/javascript" src="myScript.js"></script>
</body>
</html>