<%-- 
    Document   : InsertProduct
    Created on : Jul 16, 2021, 5:07:48 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ControllerProduct" method="POST">
            
            Pid: <input type="text" name="pid" /><br/>
            Product Name: <input type="text" name="pname" /><br/>
            Quantity: <input type="text" name="quantity" /><br/>
            Price: <input type="text" name="price" /><br/>
            Image: <input type="text" name="image" /><br/>
            Description: <input type="text" name="des" /><br/>
            Status: <input type="text" name="status" /><br/>
            CateID:
            <select name="cateID">
                <c:forEach items="${requestScope.cates}" var="c">
                    <option value="${c.cateID}">${c.cateName}</option>
                </c:forEach>
            </select>
            <br/>
            <input type="hidden" name="service" value="addProduct" />
            <input type="submit" value="Save">
        </form> 
    </body>
</html>
