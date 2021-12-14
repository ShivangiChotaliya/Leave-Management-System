<%@ page language="java" contentType= "text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.lang.*,java.io. *"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        
        <!-- Title -->
        <title>Employee | Leave History</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <meta charset="UTF-8">
        <meta name="description" content="Responsive Admin Dashboard Template" />
        <meta name="keywords" content="admin,dashboard" />
        <meta name="author" content="Steelcoders" />
        
        <!-- Styles -->
        <link type="text/css" rel="stylesheet" href="assets/plugins/materialize/css/materialize.min.css"/>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="assets/plugins/material-preloader/css/materialPreloader.min.css" rel="stylesheet">
        <link href="assets/plugins/datatables/css/jquery.dataTables.min.css" rel="stylesheet">

            
       
        </style>
    </head>
    <body>
        <%
    
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
    
        if(session.getAttribute("username")==null){
            response.sendRedirect("index.jsp");
        }
    %>
    
        <%@ include file="../include/header.jsp" %>
            
        <%@ include file="../include/sidebar.jsp" %>

            <main class="mn-inner">
                <div class="row">
                    <div class="col s12">
                        <div class="page-title">Leave History</div>
                    </div>
                   
                    <div class="col s12 m12 l12">
                        <div class="card">
                             <div class="card-content"> 
                                <span class="card-title">Leave History</span>
                                <table id="example" class="display responsive-table ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th width="120">Leave Type</th>
                                            <th>From</th>
                                            <th>To</th>
                                             <th>Description</th>
                                             <th width="120">Posting Date</th>
                                           
                                            <th>Status</th>
                                        </tr>
                                    </thead>
                                 
                                    <tbody>
                                        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                                    url="jdbc:mysql://localhost/db_leave"
                                                    user="root"  password=""/>
                <% String id = request.getParameter("id"); %>
               

                <sql:query dataSource="${snapshot}" var="result">
                    SELECT LeaveType,ToDate,FromDate,Description,PostingDate,status from leaves where empid=<%=id%>;
                </sql:query>
                <c:set var="count" value="1" scope="page" />

               
                <c:forEach  var="row" items="${result.rows}">  
                                        <tr>
                                            
                                            <td><c:out value="${count}" /></td>
                                            <td><c:out value="${row.LeaveType}"/> </td>
                                            <td><c:out value="${row.ToDate}"/></td>
                                            <td><c:out value="${row.FromDate}"/></td>
                                            <td><c:out value="${row.Description}"/></td>
                                           <td><c:out value="${row.PostingDate}" /></td>
                                           <td>
                                           <c:set var="status" scope="session" value="${row.Status}"/>                      
                                           <c:choose>  
                                            <c:when test="${status == 0}">  
                                                <span style="color: blue">Waiting For Approval </span>
                                             </c:when>  
                                             <c:when test="${status == 1}">  
                                                <span style="color: green"> Approved </span>
                                             </c:when>  
                                             <c:otherwise>  
                                                <span style="color: red"> Not Approved  </span>
                                             </c:otherwise>  
                                         </c:choose>  
                                             </td> 
          
                                        </tr>
                                        <c:set var="count" value="${count + 1}" scope="page"/>
                </c:forEach>
                                    </tbody>
                                </table>
                             </div> 
                        </div>
                    </div>
                </div>
            </main>
         
        </div>
        <div class="left-sidebar-hover"></div>
        
        <!-- Javascripts -->
        <script src="assets/plugins/jquery/jquery-2.2.0.min.js"></script>
        <script src="assets/plugins/materialize/js/materialize.min.js"></script>
        <script src="assets/plugins/material-preloader/js/materialPreloader.min.js"></script>
        <script src="assets/plugins/jquery-blockui/jquery.blockui.js"></script>
        <script src="assets/plugins/datatables/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/alpha.min.js"></script>
        <script src="assets/js/pages/table-data.js"></script>

        
    </body>
</html>
