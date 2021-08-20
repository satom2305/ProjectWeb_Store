<%-- 
    Document   : listCustomer
    Created on : Jul 16, 2021, 5:06:55 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>       
        <form action="ControllerCustomter" method="POST">
            <a href="InsertCus.jsp" >Add new Customer</a>
            <table border="1px">
                <tr>
                    <td>CID</td>
                    <td>cname</td>
                    <td>cphone</td>
                    <td>cAddress</td>
                    <td>username</td>
                    <td>password</td>
                    <td>status</td>                   
                </tr>
                <c:forEach items="${requestScope.cus}" var="e">
                    <tr>
                    <td>${e.cid}</td>
                    <td>${e.cname}</td>
                    <td>${e.cphone}</td>
                    <td>${e.cAddress}</td>
                    <td>${e.username}</td>
                    <td>${e.password}</td>
                    <td>${e.status}</td>
                    <td><a href="ControllerCustomter?service=preUpdate&cid=${e.cid}">Update</a></td>
                    <td><a href="ControllerCustomter?service=delete&cid=${e.cid}">Delete</a></td>
                </tr>
                </c:forEach>
            </table>
        </form>
    </body>
</html>
