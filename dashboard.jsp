
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.lang.*,java.io. *" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
if(session.getAttribute("username")==null){ response.sendRedirect("index.jsp"); } %>
<%@ include file="header.jsp" %>
<%@ include file="sidebar.jsp" %>
        <%
        
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
        
            if(session.getAttribute("username")==null){
                response.sendRedirect("index.jsp");
            }
        %>
     
            <main class="mn-inner">
                <div class="middle-content">
                    <div class="row no-m-t no-m-b">
                    <div class="col s12 m12 l4">
                        <div class="card stats-card">
                            <div class="card-content">
                            
                                <span class="card-title">Totle Regd Employee</span>
                                <span class="stats-counter">

                                    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                    url="jdbc:mysql://localhost/db_login" user="root" password="" />
    
                                     <sql:query dataSource="${snapshot}" var="result">
                                        SELECT count(*) as res1 from employee;
                                      
                                    </sql:query>
                                    <c:forEach var="row" items="${result.rows}">
                                        <c:out value="${row.res1}" />
                                    </c:forEach>
                            </div>
                            <div id="sparkline-bar"></div>
                        </div>
                    </div>
                        <div class="col s12 m12 l4">
                        <div class="card stats-card">
                            <div class="card-content">
                            
                                <span class="card-title">Listed Departments </span>
                                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                    url="jdbc:mysql://localhost/db_login" user="root" password="" />
    
                                     <sql:query dataSource="${snapshot}" var="result">
                                        SELECT count(*) as res2 from department;
                                      
                                    </sql:query>
                                    <c:forEach var="row" items="${result.rows}">
                                        <c:out value="${row.res2}" />
                                    </c:forEach>
    
                                </div>
                            <div id="sparkline-line"></div>
                        </div>
                    </div>
                    <div class="col s12 m12 l4">
                        <div class="card stats-card">
                            <div class="card-content">
                                <span class="card-title">Listed leave Type</span>
                                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                url="jdbc:mysql://localhost/db_login" user="root" password="" />

                                 <sql:query dataSource="${snapshot}" var="result">
                                    SELECT count(*) as res3 from leavetype;
                                  
                                </sql:query>
                                <c:forEach var="row" items="${result.rows}">
                                    <c:out value="${row.res3}" />
                                </c:forEach>
                            </div>
                            <div class="progress stats-card-progress">
                                <div class="determinate" style="width: 70%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                 
                    <div class="row no-m-t no-m-b">
                        <div class="col s12 m12 l12">
                            <div class="card invoices-card">
                                <div class="card-content">
                                 
                                    <span class="card-title">Latest Leave Applications</span>
                                    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                    url="jdbc:mysql://localhost/db_login" user="root" password="" />
    
                                     <sql:query dataSource="${snapshot}" var="result">
                                        SELECT l.leaveid ,e.empname,e.empid,e.id,l.LeaveType,l.PostingDate,l.Status 
                                        from leaves l, employee e
                                        where l.empid=e.empid order by l.leaveid desc limit 6;
                                      
                                    </sql:query>
    
                                    <table id="example" class="display responsive-table ">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th width="200">Employe Name</th>
                                                <th width="120">Leave Type</th>
    
                                                 <th width="180">Posting Date</th>                 
                                                <th>Status</th>
                                                <th align="center">Action</th>
                                            </tr>
                                        </thead>
                                        <c:forEach var="row" items="${result.rows}">
                                            <tr>
                                               
                                                <td>
                                                    <c:out value="${row.leaveid}" />
                                                   
                                                </td>
                                                <td>
                                                    <c:out value="${row.empname}" />
    
                                                </td>
                                                <td>
                                                    <c:out value="${row.LeaveType}" />
                                                </td>
                                                <td>
                                                    <c:out value="${row.PostingDate}" />
                                                </td>
                                                <td>            
                                                    <c:choose>
                                                        <c:when test="${row.Status=='0'}">
                                                            <span style="color: red">Not Approved</span>
                                                            <br />
                                                        </c:when>  
                                                        <c:when test="${row.Status=='1'}">
                                                            <span style="color: green">Approved</span>
                                                            <br />
                                                        </c:when>   
                                                        <c:otherwise>
                                                            <span style="color: blue">waiting for approval</span>
                                                            <br />
                                                        </c:otherwise>
                                                    </c:choose>                     
                                                </td>
                                              
                                               
                                                <td><a href="leaveDetails.jsp?leaveid=${row.leaveid}" class="waves-effect waves-light btn blue m-b-xs"  > View Details</a></td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
              
            </main>
 
        
        
        <%@ include file="../include/footer.jsp" %>