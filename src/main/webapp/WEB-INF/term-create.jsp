<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resourses/css/styles.css">
    <script src="../resourses/js/functions.js?v=5"></script>
    <title>Система управления студентами и их успеваемостью</title>
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
            </c:choose></span></div>
    </div>
    <div class="main">
        <div class="left-side blue-button">
            <div class="blue-button"><a href="/">На главную</a></div>
            <div class="blue-button"><a href="/terms">Назад</a></div>
        </div>
        <div class="center">
            <b>Для создания семестра заполните следующие данные и нажмите кнопку "Создать".</b>
            <div class="form-term">
                <div class="left-part">Длительность (в неделях)</div>
<%--                <form action="/term-create" method="post">--%>
                    <div><input type="text" value="24" size="40" name="durationToForm"></div>
            </div>
            <div class="form-term">
                <div class="left-part">Дисциплины из списка</div>
                <div><select id="disciplines2" name="disciplines2" multiple>
                    <c:forEach items="${allDisciplines}" var="d">
                        <option value="${d.id}" id="disciplineToAdd" name="disciplineToAdd">${d.discipline}</option>
                    </c:forEach>
                </select></div>
            </div>
            <div><input type="submit" value="Создать" onclick="creatingTerm()" class="grey-button"/>
                <div style="width: 299px;"></div>
            </div>
<%--            </form>--%>
            <c:if test="${Error eq 1}">
                <p class="error">Поля не должны быть пустыми!</p>
            </c:if>
        </div>
        <div class="right-side blue-button"><span></span></div>
    </div>
</div>
<form action="/term-create" method="post" id="formToCreateTerm">
    <input type="hidden" value="" name="duration" id="duration" size="40">
    <input type="hidden" value="" name="idsDisciplines" id="idsDisciplines">
</form>
</body>