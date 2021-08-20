<%-- 
    Document   : listProduct
    Created on : Jul 16, 2021, 4:53:42 PM
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
        
        <form action="ControllerProduct" method="POST">    
            <a href="InsertProduct.jsp" >Add new Customer</a>
            <table border ="1px">
                <tr>
                    <td>Pid</td>
                    <td>pname</td>
                    <td>quantity</td>
                    <td>price</td>
                    <td>image</td>
                    <td>description</td>
                    <td>Status</td>
                    <td>CateID</td>   
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <c:forEach items="${requestScope.products}" var="e">
                    <tr>
                        <td>${e.pid}</td>
                        <td>${e.pname}</td>
                        <td>${e.quantity}</td>
                        <td>${e.price}</td>
                        <td>${e.image}</td>
                        <td>${e.description}</td>
                        <td>${e.status}</td>
                        <td>${e.cateID}</td>   
                        <td><a href="ControllerProduct?service=preUpdate&pid=${e.pid}">Update</td>
                        <td><a href="ControllerProduct?service=delete&pid=${e.pid}">Delete</td>
                    </tr>
                </c:forEach>
            </table>
        </form>
    </body>
</html>
