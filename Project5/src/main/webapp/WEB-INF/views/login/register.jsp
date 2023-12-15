<%--
  Created by IntelliJ IDEA.
  User: kimkwang-il
  Date: 12/5/23
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Project5</title>
    <link href="<c:url value="/css/font.css" />" rel="stylesheet">
    <script>
        function showAlert() {
            alert("회원가입이 정상적으로 이루어지지 않았습니다.");
        }
    </script>
    <style>
        #mydiv1 {
            width: 800px;
            height: 300px;
            margin: 0 auto;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;

            background-color: #006bb3;
            color : white;
            border-radius: 15px;
        }
        button{
            width : 50px;
            background-color: white;
            color : black;
            border : none;
            border-radius: 5px;
        }
        button:hover{
            background-color: gray;
            color : wheat;

        }
    </style>
</head>
<body>
<div id = "mydiv1">
    <p>Register Page</p>
    <form method="post" action="registerOk">
        <div><label>User ID: </label><br/><input type='text' name='userid'/></div><br/>
        <div><label>Password: </label><br/><input type='password' name='password'/></div><br/>
        <div><label>User Name: </label><br/><input type='text' name='username'/></div><br/>
        <button type='submit'>register</button>
    </form>
</div>
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
