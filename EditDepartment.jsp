
<%@ page language="java" contentType= "text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.lang.*,java.io. *"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
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
                        <div class="page-title">Update Department</div>
                    </div>
                    <div class="col s12 m12 l6">
                        <div class="card">
                            <div class="card-content">
                              
                                <div class="row">
                                   
                                          

                                        <div class="row">
                                            <div class="input-field col s12">
                                                
                                                   
                                                   <form class="col s12" name="editdepartment" method="post" action="beans/EditDepartment">

                                                    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                                    url="jdbc:mysql://localhost/db_leave"
                                                    user="root"  password=""/>
                                                      <% int id = Integer.parseInt(request.getParameter("id")); %>
                                                    <sql:query dataSource="${snapshot}" var="result">
                                                    
                                                        SELECT * from department where departmentId=<%=id%>;
                                                    </sql:query>
                                                    <c:forEach  var="row" items="${result.rows}">               
                                                   
          <div class="input-field col s12">
         <input type="hidden" name="departmentid" value="<c:out value='${row.departmentId}' />" /> 
          

         <input id="departmentname" type="text"  class="validate" autocomplete="off" name="departmentname" value="<c:out value='${row.departmentName}' />" required />
                                                <label for="deptname">Department Name</label>
                                            </div>
  
                                        </c:forEach>
                                            

<div class="input-field col s12">
<button type="submit" name="update" class="waves-effect waves-light btn indigo m-b-xs">UPDATE</button>

</div>


                                        </div>
                                       
                                    </form>

                                </div>
                            </div>
                        </div>
                     
             
                   
                    </div>
                
                </div>
            </main>

        </div>
        <div class="left-sidebar-hover"></div>
        
        <!-- Javascripts -->
        <script src="../assets/plugins/jquery/jquery-2.2.0.min.js"></script>
        <script src="../assets/plugins/materialize/js/materialize.min.js"></script>
        <script src="../assets/plugins/material-preloader/js/materialPreloader.min.js"></script>
        <script src="../assets/plugins/jquery-blockui/jquery.blockui.js"></script>
        <script src="../assets/js/alpha.min.js"></script>
        <script src="../assets/js/pages/form_elements.js"></script>
        
       

<%@ include file="../include/footer.jsp" %>
