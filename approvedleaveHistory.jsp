<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.lang.*,java.io. *" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
if(session.getAttribute("username")==null){ response.sendRedirect("index.jsp"); } %>
<%@ include file="header.jsp" %>
<%@ include file="sidebar.jsp" %>
<style>

    </style>

  
       <main class="mn-inner">
                <div class="row">
                    <div class="col s12">
                        <div class="page-title">Leave History</div>
                    </div>
                   
                    <div class="col s12 m12 l12">
                        <div class="card">
                            <div class="card-content">
                                <span class="card-title">Leave History</span>
                                                              
                                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                url="jdbc:mysql://localhost/db_login" user="root" password="" />

                                 <sql:query dataSource="${snapshot}" var="result">
                                    SELECT l.leaveid as lid,e.empname,e.empid,e.id,l.LeaveType,l.PostingDate,l.Status 
                                    from leaves l, employee e
                                    where l.empid=e.empid and l.Status=1  order by lid desc;
                                    
                                    
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
                                                <c:out value="${row.lid}" />
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
                                            <td><a href="leaveDetails.jsp?leaveid=${row.id}" class="waves-effect waves-light btn blue m-b-xs"  > View Details</a></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            

            <%@ include file="../include/footer.jsp" %>