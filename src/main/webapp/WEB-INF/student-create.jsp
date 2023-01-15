<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="../resourses/css/styles.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script>
        $( function() {
            $( "#datepicker" ).datepicker();
        } );
    </script>
    <title>Система управления студентами и их успеваемостью</title>
</head>

<body>
<div>
    <div class="header">
        <div class="left-side"></div>
        <div id="title"><h1>Система управления студентами и их успеваемостью</h1></div>
        <div class=" right-side blue-button logout"><span><a href="">Logout</a></span></div>
    </div>
    <div class="main">
        <div class="left-side blue-button">
            <div class="blue-button"><a href="/">На главную</a></div>
            <div class="blue-button"><a href="/students">Назад</a></div>
        </div>
        <div class="center">
            <b>Для создания студента заполните все поля и нажмите кнопку "Создать".</b>

            <form method="post" action="/student-create">
                <div class="form">
                    <p>Фамилия <input name="surname" type="text" size="40"></p>
                    <p>Имя <input name="name" type="text" size="40"></p>
                    <p>Группа <input name="group" type="text" size="40"></p>
                    <p>Дата поступления <input id="datepicker" name="date" type="text" size="40"></p>
                </div>
                <div>
                    <input type="submit" value="Создать" class="grey-button"/>
                    <div style="width: 299px;"></div>
                </div>
            </form>
        <c:if test="${Error eq 1}">
            <p class="error"> Поля не должны быть пустыми! </p>
        </c:if>
        </div>
        <div class="right-side blue-button"><span></span></div>
    </div>
</div>
</body>
