<%@page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<title>회원가입 화면</title>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>

<body>
	<header>
		<div id="upper">
			<h1>회원가입</h1>
		</div>
	</header>
	<aside id="login">
		<table id="table">
			<tr>
			<td>
				<button onclick="home()" id="home">home</button>
			</td>
			</tr>
			<form method="post" action="login.jsp">
			<tr>
			<td>
				ID :<input type="text" id="id" name="id"></input>
			</td>
			</tr>
			<tr>
			<td>
				PW :<input type="password" name="passwd" id="passwd"></input>
			</td>
			</tr>
			<tr>
			<td>
				<input type="submit" value="로그인" id="button">
				</form>
				<button onclick="signUp()" id="button">회원가입</button>
			</td>
			</tr>
		</table>
	</aside>
	
	<section id="main">
		<div id="check">
		
		<table>
			<form method=post action="join_proc.jsp">
			<tr>
				<td id="siguptr" name="id">아이디 : </td> <td id="siguptr"><input type = "text" name = "inputid" id="inputid" required></td>
			</tr>
			<tr>
				<td id="siguptr" name="passwd">비밀번호 : </td> <td id="siguptr"><input type = "password" name = "inputpw" id= "inputpw" required></td>
			</tr>
			<tr>
				<td id="siguptr" name="name">이름 : </td> <td id="siguptr"><input type = "text" name = "inputname" id="inputname" required></td>
			</tr>
			<tr>
				<td id="siguptr" name="tel">전화번호 : </td> <td id="siguptr"><input type = "text" name = "inputphone" id="inputphone" required></td>
			</tr>
			<tr>	
				<td id="siguptr" name="addr">주소 : </td> <td id="siguptr"><input type = "text" name = "inputaddress" id="inputaddress" required></td>
			</tr>	
			<tr>	
				<td id="siguptr" name="cardNum">카드번호 : </td> <td id="siguptr"><input type = "text" name = "inputcard" id="inputcard" required></td>
			</tr>	
			<tr>
				<td id="siguptr" name="email">이메일 : </td> <td id="siguptr"><input type = "text" name = "inputemail" id="inputemail" required></td>
			</tr>
			<tr>
				<td id="sig"><button name="submit" id="sigup" value="가입하기"/>가입하기</td>
				</form>
				<td><button onclick="cancel()" id="sigup">취소</button></td> 
			</tr>
		</table>
		</div>
	</section>
	<script type="text/javascript" src="myScript.js"></script>
</body>
</html>