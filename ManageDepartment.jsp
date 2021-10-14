<%@ page language="java" contentType= "text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.lang.*,java.io. *"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        
        <!-- Title -->
        <title>Admin | Manage Departments</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <meta charset="UTF-8">
        <meta name="description" content="Responsive Admin Dashboard Template" />
        <meta name="keywords" content="admin,dashboard" />
        <meta name="author" content="Steelcoders" />
        
        <!-- Styles -->
        <link type="text/css" rel="stylesheet" href="assets/plugins/materialize/css/materialize.min.css"/>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="assets/plugins/material-preloader/css/materialPreloader.min.css" rel="stylesheet">
        <link href="assets/plugins/datatables/css/jquery.dataTables.min.css" rel="stylesheet"> -->

            
        <!-- Theme Styles -->
        <link href="assets/css/alpha.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <%= session.getAttribute("username")%>
        <%
        
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
        
            if(session.getAttribute("username")==null){
                response.sendRedirect("index.jsp");
            }
        %>
        <%@ include file="header.jsp" %>
        <%@ include file="sidebar.jsp" %>

        
            <main class="mn-inner">
                <div class="row">
                    <div class="col s12">
                        <div class="page-title">Manage Departments</div>
                    </div>
                    <div class="col s12 m12 l12">
                        <div class="card">
                            <div class="card-content">
                                <span class="card-title">Departments Info</span>
                                 <table id="example" class="display responsive-table ">
                                    <thead>
                                        <tr>
                                            <th>Sr no</th>
                                            <th>Dept Name</th>
                                            <th>Creation Date</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <%
                                            try{
                                                Class.forName("com.mysql.jdbc.Driver");
                                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost/db_login","root","");
                                                Statement st = con.createStatement();
                                                String query = "select *from department";
                                                ResultSet rs = st.executeQuery(query);
                                                while(rs.next()){
                                            
                                            %>
                                    <tbody>
 
                                        <tr>
                                           
                                            <td><%=rs.getInt("departmentId") %></td>
                                            <td><%=rs.getString("departmentName") %></td>
                                            <td><%=rs.getString("creation_date") %></td>
                                            <td><a href="ManageDepartment.jsp"><i class="material-icons">mode_edit</i></a><a href="ManageDepartment.jsp"> <i class="material-icons">delete_forever</i></a></td>
                                            <%
                                           }
                                          
                                          
                                       
                                      }
                                      catch(Exception e){
       
                                      }
                                           %>
                                        </tr>
                                         
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
        <!-- <script src="assets/js/pages/table-data.js"></script> -->
        
    </body>
</html>
