
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
                        <div class="page-title">Update Leave Type</div>
                    </div>
                    <div class="col s12 m12 l6">
                        <div class="card">
                            <div class="card-content">
                              
                                <div class="row">                                          

                                        <div class="row">
                                            <div class="input-field col s12">
                                                
                                                   
                                                   <form class="col s12" name="editdepartment" method="post" action="beans/EditLeaveType">

                                                    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                                    url="jdbc:mysql://localhost/db_leave"
                                                    user="root"  password=""/>
                                                     <% int id = Integer.parseInt(request.getParameter("id"));%>
                                                    <sql:query dataSource="${snapshot}" var="result">
                                                    
                                                        SELECT * from leavetype where id=<%=id%>;
                                                    </sql:query>
                                                    <c:forEach  var="row" items="${result.rows}">               
                                                   
          <div class="input-field col s12">
         <input type="hidden" name="id" value="<c:out value='${row.id}' />" /> 
          

         <input id="leavetype" type="text"  class="validate" autocomplete="off" name="leavetype" value="<c:out value='${row.LeaveType}' />" required />
                                                <label for="leavetype">Leave Type</label>

        <input id="days" type="number"  class="validate" autocomplete="off" name="days" value="<c:out value='${row.days}' />" required />
        <label for="days">Leave Type</label>
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
