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
    <script src="../resourses/js/functions.js?v=31"></script>
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
            <b class="text">Отображена успеваемость для следующего студента:</b>
            <form method="get">
                <table class="table-students table-progress">
                    <thead class="thead">
                    <tr>
                        <th>Фамилия</th>
                        <th>Имя</th>
                        <th>Группа</th>
                        <th>Дата поступления</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${student.surname}</td>
                        <td>${student.name}</td>
                        <td>${student.group}</td>
                        <td><f:formatDate value="${student.date}" pattern="dd/MM/yyyy"/></td>
                    </tr>
                    </tbody>
                </table>
            </form>
            <div class="center-second-table">
                <div>
                    <form method="get">
                        <table class="table-students">
                            <thead class="thead" {padding-top: 0px;}>
                            <tr>
                                <th>Дисциплина</th>
                                <th>Оценка</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${ocenkas}" var="o">
                                <tr>
                                    <td style="display: none">${o.id}</td>
                                    <td>${o.discipline.discipline}</td>
                                    <td name="ocenka">${o.ocenka}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div>
                <div>
                    <div class="center-second-table">
                        <div style="margin-left: 15px; margin-right: 15px;"><b>Выбрать семестр </b></div>

                        <form method="get" action="/student-progress">
                            <div>
                                <input type="hidden" value="${student.id}" name="idStudentProgress"
                                       id="idStudentProgress">
                                <select name="idSelectedTerm" size="1">
                                    <c:forEach items="${terms}" var="t">
                                        <c:choose>
                                            <c:when test="${t.id eq selectedTerm.id}">
                                                <option value="${t.id}" selected="selected"
                                                        id="idSelectedTerm"
                                                        name="idSelectedTerm">${t.term}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${t.id}">${t.term}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <div style="margin: -19px 0 0 100px">
                                <input type="submit" class="grey-button" value="Выбрать"/>
                            </div>
                        </form>
                    </div>
                    <div style="margin-left: 15px; margin-right: 15px; margin-top: 15px;"><b>Средняя оценка за
                        семестр: </b><b id="averageMark"></b>
                    </div>
                    <script>
                        getAverageMark()
                    </script>
                </div>
            </div>
            <div class="right-side blue-button"><span></span></div>
        </div>
    </div>
</div>

</body>