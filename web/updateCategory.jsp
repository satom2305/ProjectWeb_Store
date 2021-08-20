<%-- 
    Document   : updateCategory
    Created on : Jul 16, 2021, 5:11:11 PM
    Author     : Admin
--%>

<%@page import="entity.Category"%>
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
           Category pro = (Category) request.getAttribute("cates");
           String formtitle=request.getAttribute("formtitle").toString();          
        %>
        <caption><%=formtitle%></caption>
        <form action="ControllerCategory" method="POST">            
            <%--<c:forEach items="${requestScope.cates}" var="e">--%>
                Cate Name <input type="text" value="<%= pro.getCateName() %>"><br>
                Status 
                <td>
                    <input type="radio" name="status" value="1" <%=(pro.getStatus() == 1 ? "checked" : "")%>/> Enable  
                    <input type="radio" name="status" value="0" <%=(pro.getStatus() == 0 ? "checked" : "")%>/> Disable  <br>
                </td>
            <%--</c:forEach>--%>
            <input type="hidden" name="service" value="updated" />
            <input type="submit" value="Update"><br>
        </form>
    </body>
</html>
