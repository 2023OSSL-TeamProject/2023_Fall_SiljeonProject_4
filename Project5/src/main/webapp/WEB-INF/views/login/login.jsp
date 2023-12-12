<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>

        #myDiv {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px;
        }

        img, label {
            display: inline-block;
        }

        label {
            width: 130px
        }

        button, a {
            text-decoration: none;
            width: 100px;
            height: 30px;
            background-color: #006bb3;
            display: flex;
            justify-content: center;
            align-items: center;
            border: none;
            color: white;
            border-radius: 20px;
            font-size: 15px;
        }

        button:hover, a:hover {
            opacity: 80%;
        }
    </style>
    <script>
        function showAlert() {
            alert("로그인 실패! 아이디 또는 비밀번호를 확인해주세요.");
        }

    </script>
</head>
<body>
<%
    String id = (String) session.getAttribute("id");
    String pw = (String) session.getAttribute("pw");
    if (id == null && pw == null) {
%>
<h2 style = "text-align: center; margin : 50px">로그인 페이지</h2>
<div id="myDiv">
    <%--    <img src='../img/snowman.jpg' height="250">--%>

    <form method="post" action="loginOk">
        <div><label>User ID: </label><input type='text' name='userid'/></div>
        <div><label>Password: </label><input type='password' name='password'/></div>
        <div id="myDiv">
            <button type='submit'>login</button>
            <a href="register">회원가입</a>
        </div>
    </form>


    <!-- 로그인 실패 시 showAlert 함수 호출 -->
    <%
        String error = (String) session.getAttribute("error");
        if (error != null && error.equals("failed")) {
    %>
    <script>
        showAlert();
    </script>
    <%
            // showAlert를 호출한 후 error 세션을 지워줍니다.
            session.removeAttribute("error");
        }
    %>

    <%
        } else {
            response.sendRedirect("./board/list");
        }
    %>

</div>
</body>
</html>