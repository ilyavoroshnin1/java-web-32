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
    <script src="../resourses/js/functions.js?v=7"></script>
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
            <div>
                <div class="center-second-table">
                    <div style="margin-left: 15px; margin-right: 15px;"><b>Выбрать семестр </b></div>
                    <div>
                        <form method="get" action="/terms">
                            <select name="idSelectedTerm" size="1">
                                <c:forEach items="${terms}" var="t">
                                    <c:choose>
                                        <c:when test="${t.id eq selectedTerm.id}">
                                            <option value="${t.id}" selected="selected" id="idSelectedTermToForm"
                                                    name="idSelectedTermToForm">${t.term}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${t.id}">${t.term}</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                    </div>
                    <div><input type="submit" value="Выбрать" class="grey-button"/></div>
                    </form>
                </div>
                <div style="margin-left: 15px; margin-right: 15px; margin-top: 15px;"><b>Длительность
                    семестра: ${selectedTerm.duration}</b></div>
                <div style="margin-left: 15px; margin-right: 15px; margin-top: 25px;"><b>Список дисциплин в семестре</b>
                </div>
            </div>
            <div class="center" style="display:flex">
                <div>
                    <form method="get">
                        <table class="table-students table-term-list">
                            <thead class="thead">
                            <tr>
                                <th>Наименование дисциплины</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${disciplines}" var="d">
                                <tr>
                                    <td>${d.discipline}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </form>
                </div>
                <div style="display:block">
                    <c:if test="${role eq 1}">
                        <div>
                            <form action="/term-create" method="get">
                                <input type="submit" class="grey-button-list" value="Создать семестр..."/>
                            </form>
                        </div>
                        <div>
                            <input type="submit" onclick="getTermToModify()" value="Модифицировать текущий семестр..."
                                   class="grey-button-list"/>
                        </div>
                        <div>
                            <input type="submit" onclick="deleteCurrentTerm()" value="Удалить текущий семестр..."
                                   class="grey-button-list"/>
                        </div>
                    </c:if>
                </div>
                <div style="margin-left: 15px; margin-right: 15px; margin-top: 15px;"></div>
            </div>
        </div>
        <div class="right-side blue-button"><span></span></div>
    </div>
</div>
<form action="/term-delete" method="post" id="formToDeleteTerm">
    <input type="hidden" value="" name="idSelectedTermToDelete" id="idSelectedTermToDelete">
</form>
<form action="/term-modify" method="get" id="formToModifyTerm">
    <input type="hidden" value="" name="idSelectedTermToModify" id="idSelectedTermToModify">
</form>
</body>