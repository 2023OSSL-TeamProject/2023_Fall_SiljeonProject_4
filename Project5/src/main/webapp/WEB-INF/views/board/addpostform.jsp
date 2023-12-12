<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link href="<c:url value="/css/font.css" />" rel="stylesheet">
    <link href="<c:url value="/css/input.css" />" rel="stylesheet">
</head>
<body>
<%
    String id = (String) session.getAttribute("id");
    String pw = (String) session.getAttribute("pw");
    if (id != null && pw != null) {
%>
<div id="section">
    <h1>아시안 게임 순위 집계표 - 등록 화면</h1>
    <form action="addok" method="post" id="inputform">
        <div>
            <span>COUNTRY_NAME</span>
            <input type="text" name="country_name"/>
        </div>
        <div>
            <span>GOLD</span>
            <input type="number" name="gold"/>
        </div>
        <div>
            <span>SILVER</span>
            <input type="number" name="silver"/>
        </div>
        <div>
            <span>BRONZE</span>
            <input type="number" name="bronze"/>
        </div>
        <div>
            <span>CONTENT</span>
            <textarea cols="50" rows="5" name="content"></textarea>
        </div>
        <div id="button">
            <input type="submit" value="ADD"/>
            <input type="button" value="CANCLE" onclick="history.back()"/>
        </div>
    </form>

</div>
<%
    } else {
        response.sendRedirect("../../login");
    }
%>

</body>
</html>