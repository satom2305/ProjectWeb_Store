<%-- 
    Document   : updateBill
    Created on : Jul 16, 2021, 5:26:44 PM
    Author     : Admin
--%>

<%@page import="entity.Bill"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        Bill bill = (Bill) request.getAttribute("bill");
        String formtitle = request.getAttribute("formtitle").toString();
    %>
    <body>
    <caption><%=formtitle%></caption>
    <form action="ControllerBill" method="POST">         
        <table border ="1px">               
            <tr>
                <td>oID</td>
                <td><input type="text" name="oID" value="<%= bill.getoID()%>" /></td><br>
            </tr>
            <tr>
                <td>Date Create</td>
                <td><input type="text" name="date" value="<%= bill.getDateCreate()%>" /></td><br>
            </tr>
            <tr>
                <td>Customer Name</td>
                <td><input type="text" name="cname" value="<%= bill.getCname()%>" /></td><br>
            </tr>
            <tr>
                <td>Customer Phone</td>
                <td><input type="text" name="cphone" value="<%= bill.getCphone()%>" /></td><br>
            </tr>
            <tr>
                <td>Customer Address</td>
                <td><input type="text" name="cAddress" value="<%= bill.getcAddress()%>" /></td><br>
            </tr>
            <tr>
                <td>Total</td>
                <td><input type="text" name="total" value="<%= bill.getTotal()%>" /></td><br>
            </tr>
            <tr>
                <td>Status</td>
                <td>
                    <input type="radio" name="status" value="1" <%=(bill.getStatus() == 1 ? "checked" : "")%>/> Enable  
                    <input type="radio" name="status" value="0" <%=(bill.getStatus() == 0 ? "checked" : "")%>/> Disable  <br>
                </td>
            </tr>
            <tr>
                <td>Customer iD</td>
                <td><input type="text" name="cid" value="<%= bill.getCid()%>" /></td><br>
            </tr>                
            <tr>
            <input type="hidden" name="service" value="update" />
            <td><input type="submit" value="Update"></td><br>
            </tr>
        </table>
    </form>
</body>
</html>
