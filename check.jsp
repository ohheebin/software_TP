<%@page contentType="text/html; charset=UTF-8" %>
<%@ page import = "java.sql.*" %>    
<%@include file="../inc/getDBinfo.jsp"%>
<%
String id= request.getParameter("inputid");

String userID="";

   Connection conn = null;
   PreparedStatement pstmt = null;
   String Query ="";


ResultSet rs = null;

try{
		Class.forName("com.mysql.jdbc.Driver"); 

		conn = DriverManager.getConnection(db_url, db_id, db_pw);
		//고쳐야되는 부분 테이블이름
		Query = "select * from user_info where user_id= '"+id+"'" ;
		pstmt = conn.prepareStatement(Query);

		rs = pstmt.executeQuery();



		while (rs.next()) {
				//테이블에 저장된 애트리뷰트 이름
				userID= rs.getString("user_id");
		}
		if(userID.equals(id)){
			out.println("<script>alert('이미존재하는 ID입니다.');</script>");
			out.println("<script>location.replace('../join.jsp');</script>");
		} 
		else{
			out.println("<script>alert('사용가능한 ID입니다.');</script>");
			out.println("<script>location.replace('../join.jsp');</script>");
		}
}catch(Exception e){
		e.printStackTrace();
		System.out.println(e.getMessage());
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
