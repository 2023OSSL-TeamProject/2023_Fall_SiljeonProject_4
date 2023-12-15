<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <style>
        body{
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        a{
            text-decoration: none;
            width : 100px;
            height : 30px;
            background-color: #006bb3;
            display: flex;
            justify-content: center;
            align-items: center;
            color : white;
            border-radius: 20px;
        }

        a:hover{
            opacity: 80%;
        }
    </style>
    <script>
        function showAlert() {
            alert("로그아웃되었습니다");
        }

    </script>
    <link href="<c:url value="/css/font.css" />" rel="stylesheet">
</head>
<body>
<h2>실전프로젝트 Project 5</h2>
<p>19학번 한상화 | 20학번 김광일</p>
<a href = "login">로그인</a>
<!-- 로그인 실패 시 showAlert 함수 호출 -->
<%
    String logout = (String) session.getAttribute("logout");
    if (logout != null && logout.equals("로그아웃되었습니다")) {
%>
<script>
    showAlert();
</script>
<%
        // showAlert를 호출한 후 error 세션을 지워줍니다.
        session.removeAttribute("logout");
    }
%>
</body>
</html>
