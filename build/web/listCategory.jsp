<%-- 
    Document   : listCategory
    Created on : Jul 16, 2021, 5:09:20 PM
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
        <a href="InsertCategory.jsp">Add new Category</a>
        <form action="ControllerCategory" method="POST">
            <table border="1px">
                <tr>
                    <td>Cate Name</td>
                    <td>Status</td>                
                </tr>
                <c:forEach items="${requestScope.categorys}" var="e">
                    <tr>
                        <td>${e.cateName}</td>
                        <td>${e.status}</td>   
                        <td><a href="ControllerCategory?service=preUpdate&cateID=${e.cateID}">Update</td>
                        <td><a href="ControllerCategory?service=delete&cateID=${e.cateID}">Delete</td>
                    </tr>    
                </c:forEach>
            </table>
        </form>
    </body>
</html>
