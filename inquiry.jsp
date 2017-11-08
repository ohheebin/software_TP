<%@page contentType="text/html; charset=UTF-8" %>
<%@page import = "java.sql.*" %>
<%
	String id= "";
	String passwd= "";
	String name= "";
	String tel= "";
	String email= "";
	String addr= "";
	String card = "";
	String s_ID = (String)session.getAttribute("s_ID");
	PreparedStatement pstmt=null;
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
	Query = "select * from user_info where user_id= '"+s_ID+"'";
	stmt = conn.createStatement();

	rs = stmt.executeQuery(Query);

	if (rs.next()) {
		id = rs.getString(1);
		passwd = rs.getString(2);
		name = rs.getString(3);
		tel = rs.getString(4);
		addr = rs.getString(5);
		card = rs.getString(6);
		email = rs.getString(7);
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
<!DOCTYPE html>
<html>
<title>회원정보조회 화면</title>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>
	<header>
		<div id="upper">
			<h1>회원정보조회</h1>
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
				ID : <%=s_ID%>
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
				<td id="siguptr">아이디 : </td><td id="siguptr"><%=id%></td>
			</tr>
			<tr>
				<td id="siguptr">비밀번호 : </td><td id="siguptr"><%=passwd%></td>
			</tr>
			<tr>
				<td id="siguptr">이름 : </td><td id="siguptr"><%=name%></td>
			</tr>
			<tr>
				<td id="siguptr">전화번호 : </td><td id="siguptr"><%=tel%></td>
			</tr>
			<tr>	
				<td id="siguptr">주소 : </td><td id="siguptr"><%=addr%></td>
			</tr>	
			<tr>	
				<td id="siguptr">카드번호 : </td><td id="siguptr"><%=card%></td>
			</tr>	
			<tr>
				<td id="siguptr">이메일 : </td><td id="siguptr"><%=email%></td>
			</tr>
			<tr>
				<td id="sig"><button onclick="customerChange()" id="sigup">회원정보변경</button></td> 
				<td id="sig"><button onclick="dropOut()" id="sigup">취소</button></td>
			</tr>
		</table>
		</div>
	</section>
	<script type="text/javascript" src="myScript.js"></script>
</body>
</html>