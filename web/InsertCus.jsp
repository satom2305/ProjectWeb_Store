<%-- 
    Document   : InsertCus
    Created on : Jul 16, 2021, 5:08:51 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ControllerCustomter" method="POST">
            cname<input type="text" name="cname"/></br>
            cphone<input type="text" name="cphone"/></br>
            cAddress<input type="text" name="cAddress"/></br>
            username<input type="text" name="username"/></br>
            password<input type="text" name="password"/></br>
            status<input type="text" name="status"/></br>
            <input type="hidden" name="service" value="addCus" />
            <td><input type="submit" value="Insert"/></td>
        </form>
    </body>
</html>
