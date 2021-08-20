<%-- 
    Document   : listBill
    Created on : Jul 16, 2021, 5:11:48 PM
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
        <form action="ControllerBill" method="POST">
            <p><a href="ControllerBill?service=insertBill">Add new Bill</a></p>
            <table border="1px">
                <tr>
                    <td>oID</td>
                    <td>dateCreate</td>
                    <td>cname</td>
                    <td>cphone</td>
                    <td>cAddress</td>
                    <td>total</td>
                    <td>status</td>
                    <td>cid</td>     
                </tr>
                <c:forEach items="${requestScope.bills}" var="e">
                    <tr>
                        <td>${e.oID}</td>
                        <td>${e.dateCreate}</td>
                        <td>${e.cname}</td>
                        <td>${e.cphone}</td>
                        <td>${e.cAddress}</td>
                        <td>${e.total} </td>
                        <td>${e.status}</td>
                        <td>${e.cid}</td>
                        <td><a href="ControllerBill?service=preUpdate&oID=${e.oID}">Update</td>
                        <td><a href="ControllerBill?service=delete&oID=${e.oID}">Delete</td>
                        <td><a href="ControllerBill?service=detail&oID=${e.oID}">Detail Bill</td>
                    </tr>
                </c:forEach>                
            </table>
        </form>
    </body>
</html>
