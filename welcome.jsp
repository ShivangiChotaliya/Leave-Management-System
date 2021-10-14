<%@ page language="java" contentType= "text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8">
    <title>No Title</title>
</head>
<body>

    <%
    
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
    
        if(session.getAttribute("username")==null){
            response.sendRedirect("index.jsp");
        }
    %>
    <h1> Header Content</h1>
     welcome ${username}
    
     <a href="videos.jsp"> Videos Here</a>
     
    <form action="beans/Logout">
        <input type="submit" value="Logout">
    </form>
</body>
</html>