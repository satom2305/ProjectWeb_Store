<%-- 
    Document   : updateProduct
    Created on : Jul 16, 2021, 4:54:42 PM
    Author     : Admin
--%>

<%@page import="entity.Product"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="model.DAOProduct"%>
<%@page import="model.DBConnect"%>
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
            Product pro = (Product) request.getAttribute("pro");
            String formtitle = request.getAttribute("formtitle").toString();
        %>
        <form action="ControllerProduct" method="post">
            <table border="0">
                <caption><%=formtitle%></caption>
                <tr>
                    <td>Product ID</td>
                    <td><input type="text" name="pid" value="<%=pro.getPid()%>" readonly="" /></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="pname" value="<%=pro.getPname()%> " /></td>
                </tr>
                <tr>
                    <td>Quantity</td>
                    <td><input type="text" name="quantity" value="<%=pro.getQuantity()%>" /></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="Price" value="<%=pro.getPrice()%>" /></td>
                </tr>
                <tr>
                    <td>image</td>
                    <td><input type="text" name="image" value="<%=pro.getImage()%>" /></td>
                </tr>
                <tr>
                    <td>description</td>
                    <td><input type="text" name="description" value="<%=pro.getDescription()%>" /></td>
                </tr>
                <tr>
                    <td>Status</td>
                    <td> <input type="radio" name="status" value="1" <%=(pro.getStatus()==1?"checked":"")%> />Enable
                        <input type="radio" name="status" value="0" <%=(pro.getStatus()==0?"checked":"")%>/>disable</td>
                </tr>
                <tr>
                    <td><b> Choose Cate id:</b></td>
                    <td><div class="combobox">
                            <select name="cateID">
                                <%
                                    DBConnect dbConn = new DBConnect();
                                    DAOProduct dao = new DAOProduct(dbConn);
                                    String Sql = "select * from Category";
                                    ResultSet rs = dbConn.getData(Sql);
                                %>
                                <%while (rs.next()) {%>
                                <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                <%}%>
                            </select>
                        </div></td>
                </tr>
                <tr>
                <input type="hidden" name="service" value="update" />
                <td><input type="submit" name="submit" value="Update" /></td>
                <td><input type="reset" value="reset" /></td>
                </tr>
            </table>
        </form>
    </body>
</html>
