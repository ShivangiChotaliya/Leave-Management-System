<%@ page language="java" contentType= "text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ page import="beans.LoginBean" %>
<%@ page import="beans.LoginDao" %>
<%@ page import="javax.servlet.Http.*" %>


<!DOCTYPE html>
<html>
<body>

        
    <jsp:useBean id="obj" class="beans.LoginBean" scope="request">
    </jsp:useBean>
    <jsp:setProperty property="*" name="obj" />

    <%
        boolean status=LoginDao.check(obj);
        if(status){
    
            out.println("You r successfully logged in " + request.getContextPath() );
            
            session.setAttribute("username",obj.getUsername());
            out.println(obj.getUsername());
            
        }
        else{
            out.print("Sorry, email or password error");
        }
    %>

    <form action="beans/Logout">
        <input type="submit" value="Logout">
    </form>

</body>
</html>


