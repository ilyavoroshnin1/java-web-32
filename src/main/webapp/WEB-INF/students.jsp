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
    <script src="../resourses/js/functions.js?v=2"></script>
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
        <div class="left-side">
            <div class="blue-button"><a href="/">На главную</a></div>
            <div class="blue-button"></div>
        </div>
        <div class="center">
            <div class="center-top-buttons">
                <div>
                    <button class="grey-button-top">Просмотреть успеваемость выбранных студентов</button>
                </div>
                <div>
                    <c:if test="${role eq 1}">
                    <form action="/student-create" method="get">
                        <input type="submit" value="Создать студента" class="grey-button-top"/>
                    </form>
                    </c:if>
                </div>
            </div>
            <c:if test="${role eq 1}">
                <div class="center-top-buttons">
                    <div>
                        <input type="submit" onclick="modifyStudents()" class="grey-button-top"
                               value="Модифицировать выбранного студента"/>
                    </div>
                    <div>
                        <input tipe="submit" onclick="deleteStudents()" class="grey-button-top"
                               value="Удалить выбранных студентов"/>
                    </div>
                </div>
            </c:if>
            <div><b class="text">Список студентов</b></div>
            <div>
                <form method="get">
                    <table>
                        <thead class="thead">
                        <tr>
                            <th></th>
                            <th>Фамилия</th>
                            <th>Имя</th>
                            <th>Группа</th>
                            <th>Дата поступления</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${students}" var="student">
                            <tr>
                                <td><input type="checkbox" value="${student.id}" name="idStud"></td>
                                <td>${student.surname}</td>
                                <td>${student.name}</td>
                                <td>${student.group}</td>
                                <td>
                                    <f:formatDate value="${student.date}" pattern="dd/MM/yyyy"/>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        <div class="right-side blue-button"><span></span></div>
    </div>
</div>

<form action="/student-delete" method="post" id="formDelete">
    <input type="hidden" value="" id="hiddenDelete" name="hiddenDelete">
</form>

<form action="/student-modify" method="get" id="formModify">
    <input type="hidden" value="" id="hiddenModify" name="hiddenModify">
</form>

</body>




