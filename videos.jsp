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
    videos page
    <iframe width="560" height="315" src="https://www.youtube.com/embed/OuBUUkQfBYM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</body>
</html>