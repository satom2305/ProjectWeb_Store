<%-- 
    Document   : updateCustomer
    Created on : Jul 16, 2021, 5:08:25 PM
    Author     : Admin
--%>

<%@page import="entity.Customer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Customer cus = (Customer) request.getAttribute("cus");
            String formtitle = request.getAttribute("formtitle").toString();
        %>
        <form action="ControllerCustomter" method="POST">           
            <%--<c:forEach items="${requestScope.cus}" var="e">--%>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="cid" value="<%= cus.getCid() %>" readonly="true" /></td><br>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><td><input type="text" name="cname" value="<%= cus.getCname() %>" /></td></td><br>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><td><input type="text" name="cphone" value="<%= cus.getCphone()%>" /></td></td><br>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><td><input type="text" name="cAddress" value="<%= cus.getcAddress()%>" /></td></td><br>
                </tr>
                <tr>
                    <td>Username</td>
                    <td><td><input type="text" name="username" value="<%= cus.getUsername() %>" /></td></td><br>
                </tr>
                <tr>
                    <td>Pass</td>
                    <td><td><input type="text" name="password" value="<%= cus.getPassword() %>" /></td></td><br>
                </tr>
                <tr>
                    <td>Status</td>
                    <td>
                        <input type="radio" name="status" value="1" <%=(cus.getStatus() == 1 ? "checked" : "")%>  /> Enable  
                        <input type="radio" name="status" value="0" <%=(cus.getStatus() == 0 ? "checked" : "")%> /> Disable<br>  
                    </td>
                </tr>
            <%--</c:forEach>--%>
            <input type="hidden" name="service" value="update" />
            <input type="submit" value="Update"><br>
        </form>
    </body>
</html>
