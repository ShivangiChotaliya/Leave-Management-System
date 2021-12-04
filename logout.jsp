<%
    
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
    
        if(session.getAttribute("username")==null){
            response.sendRedirect("index.jsp");
        }
    %>
    
       
<jsp:forward page="../WEB-INF/classes/logout.java"/>