<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../resourses/css/styles.css">
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
            <div class="blue-button"><a href="./title.html">На главную</a></div>
        </div>
        <div>
            <div>
                <div class="center-second-table">
                    <div style="margin-left: 15px; margin-right: 15px;"><b>Выбрать семестр </b></div>
                    <div>
                        <select name="idSelectedTerm" size="1">
                            <c:forEach items="${terms}" var="t">
                            <option value="${t.id}">${t.term}</option>
                            </c:forEach>
                        </select></div>
                    <div>
                        <input type="submit" value="Выбрать" class="grey-button">
                    </div>
                </div>
                <div style="margin-left: 15px; margin-right: 15px; margin-top: 15px;">
                    <b>Длительность семестра: ${selectedTerm.duration}</b>
                </div>
                <div style="margin-left: 15px; margin-right: 15px; margin-top: 25px;"><b>Список дисциплин у семестра</b>
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
                    <div>
                        <button class="grey-button-list" onclick="window.location.href = './term_cr.html';">Создать
                            семестр...
                        </button>
                    </div>
                    <div>
                        <button class="grey-button-list">Модифицировать текущий семестр...</button>
                    </div>
                    <div>
                        <button class="grey-button-list">Удалить текущий семестр...</button>
                    </div>
                </div>
                <div style="margin-left: 15px; margin-right: 15px; margin-top: 15px;"></div>
            </div>
        </div>
        <div class="right-side blue-button"><span></span></div>
    </div>
</div>
</body>
