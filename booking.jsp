<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>  
<%
		String s_ID = (String)session.getAttribute("s_ID");
%>
<!DOCTYPE html>
<html>
<title>예매등록 화면</title>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>
	<header>
		<div id="upper">
			<h1>예매등록</h1>
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
	<%
		String price = request.getParameter("price");
		String bus_no = request.getParameter("bus_no");
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
			Query = "select book_sitNo from book where bus_no = '"+bus_no+"'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(Query);
	%>	
	<section id="main">
		<div id="check">
			<table id = "table">
				<form method=post action="payment.jsp">
					<tr>
						<td id = "siguptr"> 예매등록</td>
					</tr>
					<tr>
						<td id = "siguptr"> 예매인원 수 : <input type="int" id="inwon" name="inwon"></input>
						<td id = "siguptr"> &nbsp;&nbsp;&nbsp;&nbsp가격 : <%=price%> </td>
					</tr>
					<tr>
						<td id = "siguptr">버스 번호 : <%=bus_no%></td>
						<td id = "siguptr">&nbsp;&nbsp;&nbsp;&nbsp버스의 좌석 번호 : 1 ~ 10</td>
						<td id = "siguptr">&nbsp;&nbsp;&nbsp;&nbsp예매된 좌석 번호 : 
						<%while(rs.next()){
							out.println(rs.getString(1)+" ");
						}
		}catch(Exception e){
			out.println("예매된 좌석 없음");
					}%>		
						</td>
					</tr>
					<tr>
					<td id = "siguptr">예매할 좌석 번호 : <input type="int" id="sit_no" name="sit_no"></input></td>
					</tr>
					<input type="hidden" id="bus_no" name="bus_no" value="<%=bus_no%>"></input>
					<input type="hidden" id="price" name="price" value="<%=price%>"></input>
					<tr>
					<td>
						<input type = "submit" id = "button" value="결제"></input>
					</td>
				</form>
					<td>
						<button id = "button">취소</button>
					</td>
					</tr>
			</table>
		</div>
	</section>
	<script type="text/javascript" src="myScript.js"></script>
</body>
</html>
			
				