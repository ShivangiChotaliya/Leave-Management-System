<%@ page language="java" contentType= "text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@page import="com.beans.LoginBean" %>
<!DOCTYPE html>

<body>
    <h1>Hello World</h1>

    <jsp:useBean id="st1" class="com.beans.LoginBean" scope="request" ></jsp:useBean>
    <jsp:getProperty name="st1" property="username" />
    <jsp:getProperty name="st1" property="password" />

    <h1>
        <%
        out.println(session.getAttribute("username"));
        %>
        

    </h1>
</body>
</html>