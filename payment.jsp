<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>   
<%@ page import = "java.util.Date"%>
<%@ page import = "java.text.SimpleDateFormat"%>
<%
	String s_ID = (String)session.getAttribute("s_ID");
	String bus_no = request.getParameter("bus_no");
	Date book_date = new Date();
	String book_personCount = request.getParameter("inwon");
	String book_price = request.getParameter("price");
	String book_sitNo = request.getParameter("sit_no");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	
	%>
	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>결제 화면</title>
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>
	<header>
		<div id="upper">
			<h1>결제 화면</h1>
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
		<form method="post" action="payment_proc.jsp">
				<input type="hidden" id="bus_no" name="bus_no" value="<%=bus_no%>"></input>
				<input type="hidden" id="book_price" name="book_price" value="<%=book_price%>"></input>
				<input type="hidden" id="book_personCount" name="book_personCount" value="<%=book_personCount%>"></input>
				<input type="hidden" id="book_sitNo" name="book_sitNo" value="<%=book_sitNo%>"></input>
			<tr>
				<td id="siguptr">카드회사 : </td> <td id="siguptr"><input type = "text" id="card_company" name = "card_company"></td>
			</tr>
			<tr>
				<td id="siguptr">카드번호 : </td> <td id="siguptr"><input type = "text" id="card_num" name = "card_num"></td>
			</tr>
			<tr>
				<td id="siguptr">승인번호 : </td> <td id="siguptr"><input type = "text" id="approval_no" name = "approval_no"></td>
			</tr>
			<tr>	
				<td id="siguptr">승인일자 : </td> <td id="siguptr"><input type = "date" id="approval_date" name = "approval_date"></td>
			</tr>	
			<tr>
				<td id="sig"><button type="submit" value="변경" id="sigup">확인</button></td> 
			</form>
				<td><button onclick="changeCancel()" id="sigup">취소</button></td> 
			</tr>
		</table>
		</div>
	</section>
	<script type="text/javascript" src="myScript.js"></script>
	
</body>
</html>
