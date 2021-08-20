<%-- 
    Document   : InsertBill
    Created on : Jul 16, 2021, 5:24:42 PM
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
        <form action="ControllerBill" method="POST">
            OID:<input type="text" name="oid"/></br>
            Date<input type="text" name="date"/></br>
            cname<input type="text" name="cname"/></br>
            cphone<input type="text" name="cphone"/></br>
            cAddress<input type="text" name="cAddress"/></br>
            total<input type="text" name="total"/></br>
            status<input type="text" name="status"/></br>
            Cid:
            <select name="cid">
                <c:forEach items="${requestScope.cus}" var="c">
                    <option value="${c.cid}">${c.cname}</option>
                </c:forEach>
            </select>
            <input type="hidden" name="service" value="addBill" />
            <input type="submit" value="Insert">
            <input type="reset" value="Reset">
        </form>
    </body>
</html>
