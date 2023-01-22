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
  <script src="../resourses/js/functions.js?v=13"></script>
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
    <div class="left-side blue-button"><div class="blue-button"><a href="/">На главную</a></div><div class="blue-button"><a href="/terms">Назад</a></div></div>
    <div class="center">
      <b>Для модификации семестра отредактируйте данные и нажмите кнопку "Применить".</b>
        <input type="hidden" name="idTerm" value="${term.id}">
        <div class="form-term">
          <div class="left-part">Длительность (в неделях) </div><div><input type="text" placeholder="${term.duration}" size="40" name="duration"></div>
        </div>
        <div class="form-term">
          <div class="left-part">Дисциплины из списка </div><div><select multiple>
          <c:forEach items="${allDisciplines}" var="d">
            <c:choose>
              <c:when test="${fn:contains(disciplinesByTerm, d.discipline)}">
                <option value="${d.id}" selected="selected" name="disciplineToAdd">${d.discipline}</option>
              </c:when>
              <c:otherwise>
                <option value="${d.id}"  id="disciplineToAdd" name="disciplineToAdd">${d.discipline}</option>
              </c:otherwise>
            </c:choose>
          </c:forEach>
        </select></div>
        </div>
        <div><input type="submit" value="Применить" onclick="modifyTerm()" class="grey-button"/><div style="width: 299px;"></div></div>

      <c:if test="${Error eq 1}">
        <p class="error">Поля не должны быть пустыми!</p>
      </c:if>
    </div>
    <div class="right-side blue-button"><span></span></div>
  </div>
</div>
<form action="/term-modify" method="post" id="formModifyingTerm">
  <input type="hidden" value="" name="idTermModifying" id="idTermModifying">
  <input type="hidden" value="" name="newDuration" id="newDuration" size="40">
  <input type="hidden" value="" name="newIdsDisciplines" id="newIdsDisciplines">
</form>
</body>
