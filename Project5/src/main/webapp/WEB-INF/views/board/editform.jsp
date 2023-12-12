<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@page import="com.example.BoardDAO, com.example.BoardVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Form</title>
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
    <h1>아시안 게임 순위 집계표 - <span style="color : yellow">수정</span> 화면</h1>
    <form action="editok" method="post" id="inputform">
        <input type="hidden" name="seq" value="${u.seq}"/>
        <div>
            <span>COUNTRY_NAME</span>
            <input type="text" name="country_name" value="${u.country_name}"/>
        </div>
        <div>
            <span>GOLD</span>
            <input type="number" name="gold" value="${u.gold}"/>
        </div>
        <div>
            <span>SILVER</span>
            <input type="number" name="silver" value="${u.silver}"/>
        </div>
        <div>
            <span>BRONZE</span>
            <input type="number" name="bronze" value="${u.bronze}"/>
        </div>
        <div>
            <span>CONTENT</span>
            <textarea cols="50" rows="5" name="content">${u.content}</textarea>
        </div>

        <div id="button">
            <input type="submit" value="EDIT"/>
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