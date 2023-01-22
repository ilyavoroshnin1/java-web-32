<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../resourses/css/styles.css">
  <script src="../resourses/js/functions.js"></script>
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
            </c:choose>
    </span></div>
  </div>
  <div class="main">
    <div class="left-side blue-button"><div class="blue-button"><a href="/">На главную</a></div><div class="blue-button"><a href="/disciplines">Назад</a></div></div>
    <div class="center">
      <b>Для того чтобы модифицировать дисциплину введите новое значение поля и нажмите кнопку "Применить".</b>
      <form method="post" action="/discipline-modify">
        <input type="hidden" name="idDiscipline" value="${discipline.id}">
        <div class="form">
          <p>Название <input name="discipline" value="${discipline.discipline}" type="text" size="40"></p>
        </div>
        <div><input type="submit" value="Применить" class="grey-button"/><div style="width: 299px;"></div></div>

      </form>
      <c:if test="${Error eq 1}">
        <p class="error">Поля не должны быть пустыми!</p>
      </c:if>
    </div>
    <div class="right-side blue-button"><span></span></div>
  </div>
</div>

</body>
