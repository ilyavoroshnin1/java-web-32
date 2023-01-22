<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      </c:choose></span></div>
    </div>
    <div class="main">
        <div class="left-side blue-button">
            <div class="blue-button"><a href="/">На главную</a></div>
        </div>
        <div>
            <b class="text">Список дисциплин</b>
            <div class="center" style="display:flex">
                <div>
                    <form method="get">
                        <table class="table-students table-discipline">
                            <thead class="thead">
                            <tr>
                                <th></th>
                                <th>Наименование дисциплины</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${disciplines}" var="discipline">
                                <tr>
                                    <td><c:if test="${role eq 1}"><input type="checkbox" value="${discipline.id}"
                                                                         name="idDiscipline"></c:if></td>
                                    <td>${discipline.discipline}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div>
                <c:if test="${role eq 1}">
                    <div style="display:block">
                        <form action="/discipline-create" method="get">
                            <input type="submit" value="Создать дисциплину..." class="grey-button-list"/>
                        </form>
                        <div><input type="submit" onclick="modifyDiscipline()"
                                    value="Модифицировать выранную дисциплину..." class="grey-button-list"/></div>
                        <div><input type="submit" onclick="deleteDisciplines()" value="Удалить выбранную дисциплину..."
                                    class="grey-button-list"/></div>
                    </div>
                </c:if>
                <div style="margin-left: 15px; margin-right: 15px; margin-top: 15px;"></div>
            </div>
        </div>
        <div class="right-side blue-button"><span></span></div>
    </div>
</div>
<form action="/discipline-delete" method="post" id="formDeleteDisciplines">
    <input type="hidden" value="" name="hiddenDeleteDisciplines" id="hiddenDeleteDisciplines">
</form>
<form action="/discipline-modify" method="get" id="formModifyDiscipline">
    <input type="hidden" value="" name="hiddenModifyDiscipline" id="hiddenModifyDiscipline">
</form>
</body>
