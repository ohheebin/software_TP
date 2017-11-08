<%@page contentType="text/html; charset=UTF-8" %>

<% session.invalidate(); //로그아웃 세션삭제%>     

<script>
alert("로그아웃 되었습니다.");
location.href="home.jsp";                                    // 로그아웃 페이지로 이동
</script>