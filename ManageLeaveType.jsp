<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.lang.*,java.io. *" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<% 
response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
if(session.getAttribute("username")==null){ 
    response.sendRedirect("index.jsp"); 
}
 %>
<%@ include file="header.jsp" %>
    <%@ include file="sidebar.jsp" %>

    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/db_login"
    user="root"  password=""/>
    
    <sql:update dataSource="${snapshot}"
    sql="DELETE FROM leavetype WHERE id =?">
    <sql:param value="${param.id }" />
</sql:update>

        <main class="mn-inner">
            <div class="row">
                <div class="col s12">
                    <div class="page-title">Manage Leave Types</div>
                </div>
                <div class="col s12 m12 l12">
                    <div class="card">
                        <div class="card-content">
                            <span class="card-title">Leave Type Info</span>


                           

                            <sql:query dataSource="${snapshot}" var="result">
                                SELECT * from leavetype;
                            </sql:query>

                            <table>
                                <tr>
                                    <th>Leave Id</th>
                                    <th>Leave Type</th>
                                    <th>Creation Date</th>
                                    <th>Action</th>
                                </tr>
                                <c:forEach var="row" items="${result.rows}">
                                    <tr>
                                        <td>
                                            <c:out value="${row.id}" />
                                        </td>
                                        <td>
                                            <c:out value="${row.LeaveType}" />
                                        </td>
                                        <td>
                                            <c:out value="${row.CreationDate}" />
                                        </td>
                                        <td><a href="EditLeaveType.jsp?id=${row.id}"><i
                                                    class="material-icons">mode_edit</i></a>
                                            <a href="ManageLeaveType.jsp?id=${row.id}" onclick="return confirm('Do you want to delete');"><i
                                                    class="material-icons">delete_forever</i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@ include file="../include/footer.jsp" %>