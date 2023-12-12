<%--
  Created by IntelliJ IDEA.
  User: kimkwang-il
  Date: 12/5/23
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        function showAlert(){
            alert("회원가입이 정상적으로 이루어지지 않았습니다.");
        }
    </script>
</head>
<body>
<p>Register Page</p>
<form method="post" action="registerOk">
    <div><label>User ID: </label><input type='text' name='userid'/></div>
    <div><label>Password: </label><input type='password' name='password'/></div>
    <div><label>User Name: </label><input type='text' name='username'/></div>
    <button type='submit'>register</button>
</form>
<!-- 로그인 실패 시 showAlert 함수 호출 -->
<%
    String error = (String) session.getAttribute("error");
    if (error != null && error.equals("loginFaild")) {
%>
<script>
    showAlert();
</script>
<%
        // showAlert를 호출한 후 error 세션을 지워줍니다.
        session.removeAttribute("error");
    }
%>
</body>
</html>
