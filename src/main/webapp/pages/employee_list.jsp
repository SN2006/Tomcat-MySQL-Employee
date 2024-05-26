<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Employees</title>
    <style>
        .wrapper{
            display: flex;
            flex-direction: column;
            width: 100%;
            align-items: center;
            justify-content: center;
            gap: 2rem;
        }
        .actions{
            display: flex;
            align-items: center;
            gap: 3rem;
        }
        table {
            font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif, serif;
            font-size: 14px;
            border-radius: 10px;
            border-spacing: 0;
            text-align: center;
        }
        th {
            background: #BCEBDD;
            color: white;
            text-shadow: 0 1px 1px #2D2020;
            padding: 10px 20px;
        }
        th, td {
            border-style: solid;
            border-width: 0 1px 1px 0;
            border-color: white;
        }
        th:first-child, td:first-child {
            text-align: left;
        }
        th:first-child {
            border-top-left-radius: 10px;
        }
        th:last-child {
            border-top-right-radius: 10px;
            border-right: none;
        }
        td {
            padding: 10px 20px;
            background: #F8E391;
        }
        tr:last-child td:first-child {
            border-radius: 0 0 0 10px;
        }
        tr:last-child td:last-child {
            border-radius: 0 0 10px 0;
        }
        tr td:last-child {
            border-right: none;
        }
        .delete-btn{
            color: #e74c3c;
            position: relative;
            font-weight: 600;
            display: inline-block;
            text-decoration: none;
            -webkit-transition: all .3s linear;
            -moz-transition: all .3s linear;
            transition: all .3s linear;
        }

        .delete-btn:hover{
            color: #222;
        }

        .delete-btn:before, .delete-btn:after{
            content: '';
            background: #e74c3c;
            position: absolute;
            width: 0;
            height: 2px;
            -webkit-transition: all .3s linear;
            -moz-transition: all .3s linear;
            transition: all .3s linear;
        }

        .delete-btn:before{
            top: 0;
            left: 0;
        }

        .delete-btn:after{
            top: 100%;
            right: 0;
        }

        .delete-btn:hover:before, .delete-btn:hover:after{
            width: 100%;
        }
        .edit-btn{
            color: #4de73c;
            position: relative;
            font-weight: 600;
            display: inline-block;
            text-decoration: none;
            -webkit-transition: all .3s linear;
            -moz-transition: all .3s linear;
            transition: all .3s linear;
        }

        .edit-btn:hover{
            color: #222;
        }

        .edit-btn:before, .edit-btn:after{
            content: '';
            background: #4de73c;
            position: absolute;
            width: 0;
            height: 2px;
            -webkit-transition: all .3s linear;
            -moz-transition: all .3s linear;
            transition: all .3s linear;
        }

        .edit-btn:before{
            top: 0;
            left: 0;
        }

        .edit-btn:after{
            top: 100%;
            right: 0;
        }

        .edit-btn:hover:before, .edit-btn:hover:after{
            width: 100%;
        }
        .actions a {
            box-shadow:inset 0px 1px 0px 0px #caefab;
            background:linear-gradient(to bottom, #77d42a 5%, #5cb811 100%);
            background-color:#77d42a;
            border-radius:6px;
            border:1px solid #268a16;
            display:inline-block;
            cursor:pointer;
            color:#306108;
            font-family:Arial;
            font-size:15px;
            font-weight:bold;
            padding:6px 24px;
            text-decoration:none;
            text-shadow:0px 1px 0px #aade7c;
        }
        .actions a:hover {
            background:linear-gradient(to bottom, #5cb811 5%, #77d42a 100%);
            background-color:#5cb811;
        }
        .actions a:active {
            position:relative;
            top:1px;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <h1>Employees</h1>
    <div class="actions">
        <a href="<%=request.getContextPath()%>/new">Add Employee</a>
        <a href="<%=request.getContextPath()%>/list">List Employees</a>
    </div>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Position</th>
            <th>Phone</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>
        <c:forEach var="employee" items="${employeeList}">
            <tr>
                <td><c:out value="${employee.id}"/></td>
                <td><c:out value="${employee.name}"/></td>
                <td><c:out value="${employee.position}"/></td>
                <td><c:out value="${employee.phone}"/></td>
                <td>
                    <a class="edit-btn"
                       href="<%=request.getContextPath()%>/edit?id=<c:out value='${employee.id}' />">Edit</a>
                </td>
                <td>
                    <a class="delete-btn"
                       href="<%=request.getContextPath()%>/delete?id=<c:out value='${employee.id}' />">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>