<%@ page language="java" contentType= "text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.lang.*,java.io.*"%>
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
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/db_leave"
    user="root"  password=""/>
    <% String id = request.getParameter("id");%>
    <sql:update dataSource="${snapshot}" var="delete">
        Delete from employee where empid =<%=id%>;
    </sql:update>

            <main class="mn-inner">
                <div class="row">
                    <div class="col s12">
                        <div class="page-title">Manage Employees</div>
                    </div>
                    <div class="col s12 m12 l12">
                        <div class="card">
                            <div class="card-content">
                                <span class="card-title">Departments Info</span>
                               
                            
                                <sql:query dataSource="${snapshot}" var="result">
                                    SELECT * from employee;
                                </sql:query>
                                
                                <table>
                                    <tr>
                                        <th>Employee Id</th>
                                        <th>Employee Name</th>
                                        <th>Department</th>
                                        <th>Position</th>
                                        <th>Email</th>
                                        <th>Gender</th>
                                        <th>Mobile No.</th>
                                        <th>Date of Birth</th>
                                        <th>Address</th>
                                        <th>Action</th>
                                    </tr>
                                <c:forEach  var="row" items="${result.rows}">
                                <tr>
                                    <td><c:out value="${row.empid}"/></td>
                                    <td><c:out value="${row.empname}"/></td>
                                    <td><c:out value="${row.department}"/></td>
                                    <td><c:out value="${row.position}"/></td>
                                    <td><c:out value="${row.email}"/></td>
                                    <td><c:out value="${row.gender}"/></td>
                                    <td><c:out value="${row.mobile}"/></td>
                                    <td><c:out value="${row.dob}"/></td>
                                    <td><c:out value="${row.address}"/></td>
                                    <td><a href="EditEmployee.jsp?id=${row.empid}"><i class="material-icons">mode_edit</i></a>
                                        <a href="manageEmployee.jsp?id=${row.empid}" onclick="return confirm('Do you want to delete');"><i class="material-icons">delete_forever</i></a></td>
                                </tr>
                                </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </main>
         
        <%@ include file="../include/footer.jsp" %>