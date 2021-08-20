<%-- 
    Document   : InsertCategory
    Created on : Jul 16, 2021, 5:10:45 PM
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
        <form action="ControllerCategory" method="POST">
<!--            Category ID
            <input type="text" name="cateid" value="" required/></br>-->
            CateName
            <td><input type="text" name="catename"/></br>
            Status
            <td><input type="radio" name="status" value="1" checked />Enable
                <input type="radio" name="status" value="0" />disable</br>
                <input type="hidden" name="service" value="insertCategory" />
            <td><input type="submit"  value="Insert" name="submit" /></br>
            <td><input type="reset"></td>
        </form>
    </body>
</html>