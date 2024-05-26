<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>Employees</title>
    <style>
        .wrapper {
            display: flex;
            flex-direction: column;
            width: 100%;
            align-items: center;
            justify-content: center;
            gap: 2rem;
        }

        .actions {
            display: flex;
            align-items: center;
            gap: 3rem;
        }

        .actions a {
            box-shadow: inset 0px 1px 0px 0px #caefab;
            background: linear-gradient(to bottom, #77d42a 5%, #5cb811 100%);
            background-color: #77d42a;
            border-radius: 6px;
            border: 1px solid #268a16;
            display: inline-block;
            cursor: pointer;
            color: #306108;
            font-family: Arial;
            font-size: 15px;
            font-weight: bold;
            padding: 6px 24px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #aade7c;
        }

        .actions a:hover {
            background: linear-gradient(to bottom, #5cb811 5%, #77d42a 100%);
            background-color: #5cb811;
        }

        .actions a:active {
            position: relative;
            top: 1px;
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
    <c:if test="${employee != null}">
        <form action="update" method="post" class="decor">
    </c:if>
    <c:if test="${employee == null}">
        <form action="insert" method="post" class="decor">
    </c:if>
        <table border="1" cellpadding="5">
            <caption>
                <h3>
                    <c:if test="${employee != null}">
                        Edit Employee
                    </c:if>
                    <c:if test="${employee == null}">
                        Add New Employee
                    </c:if>
                </h3>
            </caption>
            <c:if test="${employee != null}">
                <input type="hidden" name="id" value="<c:out value='${employee.id}' />" />
            </c:if>
            <tr>
                <th>Name: </th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${employee.name}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Position: </th>
                <td>
                    <input type="text" name="position" size="45"
                           value="<c:out value='${employee.position}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Phone <br/>(in format xxx xxx-xxxx): </th>
                <td>
                    <input type="text" name="phone" size="45"
                           value="<c:out value='${employee.phone}' />"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <form action="<%=request.getContextPath()%>/insert">
                        <input type="submit" value="Save" />
                    </form>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>