<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="../resourses/css/styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>
    <title>Система управления студентами и их успеваемостью</title>
</head>

<body>
<div>
    <div class="header">
        <div class="left-side"></div>
        <div id="title"><h1>Система управления студентами и их успеваемостью</h1></div>
        <div class=" right-side blue-button logout"><span><c:choose>
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
            <div class="blue-button"><a href="/students">Назад</a></div>
        </div>
        <div class="center">
            <b>Для модификации введите новые значения и нажмите кнопку "Применить".</b>
            <form method="post" action="/student-modify">
                <input type="hidden" name="id" value="${student.id}">
                <div class="form">
                    <p>Фамилия <input value="${student.surname}" name="surname" type="text" size="40"></p>
                    <p>Имя <input value="${student.name}" name="name" type="text" size="40"></p>
                    <p>Группа <input value="${student.group}" name="group" type="text" size="40"></p>
                    <p>Дата поступления <input id="datepicker"
                                               value="<f:formatDate value="${student.date}" pattern="dd/MM/yyyy"/>"
                                               name="date" type="text" size="40"></p>
                </div>
                <div><input type="submit" value="Применить" class="grey-button"/>
                    <div style="width: 299px;"></div>
                </div>
            </form>

        </div>
        <div class="right-side blue-button"><span></span></div>
    </div>
</div>
</body>
