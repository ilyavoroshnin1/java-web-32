<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resourses/css/styles.css">
    <title>Система управления студентами и их успеваемостью. Титульная страница</title>
</head>

<body>
<div>
    <div class="header">
        <div class="left-side"></div>
        <div id="title"><h1>Система управления студентами и их успеваемостью</h1></div>
        <div class=" right-side blue-button logout"><span>
            <c:choose>
                <c:when test="${isLogin eq true}">
                    <a href="/logout">Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="/login">Login</a>
                </c:otherwise>
            </c:choose>
            </span></div>
    </div>
    <div class="main">
        <div class="left-side"><div class="blue-button"></div><div class="blue-button"></div></div>
        <div class="center-title">
            <div id="left-button"><a href="/students">Студенты</a></div>
            <div id="center-button"><a href="/disciplines">Дисциплины</a></div>
            <div id="right-button"><a href="/terms">Семестры</a></div>
        </div>
        <div class="right-side blue-button"></div>
    </div>
</div>
</body>