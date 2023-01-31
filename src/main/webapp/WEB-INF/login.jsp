<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resourses/css/styles.css?v=91">
    <title>Система управления студентами и их успеваемостью</title>
</head>
<body>
<div class="header">
    <div class="left-side"></div>
    <div id="title"><h1>Система управления студентами и их успеваемостью</h1></div>
</div>
<div class="main">
    <div class="left-side">
        <div class="blue-button"></div>
        <div class="blue-button"></div>
    </div>
    <div class="index">
        <form method="post" action="/login">

            <div class="text">Выберите пользователя: <select name="role">
                <option value="3">Студент</option>
                <option value="2">Учитель</option>
                <option value="1">Администратор</option>
            </select>
            </div>
            <div>
                <div class="text">Логин: <input name="login" type="text" size="40"></div>
                <div class="text">Пароль: <input type="password" name="password" type="text" size="40"></div>
            </div>
            <div><input type="submit" value="Войти" class="grey-button-discipline"></button>
                <div style="width: 299px;"></div>
            </div>


        </form>
        <c:if test="${Error eq 1}">
            <p class="error"> Поля не должны быть пустыми! </p>
        </c:if>
        <c:if test="${Error eq 2}">
            <h4> Неправильно введен либо логин, либо пароль, либо определена роль! </h4>
        </c:if>
    </div>
    <div class="right-side blue-button"><span></span></div>
</div>
<div>
    <details class="testAcc">
        <summary class="buttonTestAcc">Тестовый аккаунт</summary>
        <span class="listTestAcc">Логин: "admin", Пароль: "123"</span>
    </details>
</div>
</div>
</body>
