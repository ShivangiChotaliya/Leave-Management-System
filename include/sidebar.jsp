<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.lang.*,java.io. *" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<aside id="slide-out" class="side-nav white fixed">
    <div class="side-nav-wrapper">
        <div class="sidebar-profile">
            <div class="sidebar-profile-image">
                <img src="assets/images/profile-image.png" class="circle" alt="">
            </div>
            <div class="sidebar-profile-info">
                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                                    url="jdbc:mysql://localhost/db_login"
                                                    user="root"  password=""/>
                <% String uid = String.valueOf(session.getAttribute("userid")); %>
                <sql:query dataSource="${snapshot}" var="result">
                                                    
                                                        SELECT * from employee where id=<%=uid%>;
                                                    </sql:query>
                                                    <c:forEach  var="row" items="${result.rows}">  
                                                              <p>${row.empname}</p>  
                                                              <p>${row.empid}</p>
                                                      
            </div>
        </div>

    <ul class="sidebar-menu collapsible collapsible-accordion" data-collapsible="accordion">
        <li class="no-padding"><a class="waves-effect waves-grey" href="dashboardEmp.jsp"><i class="material-icons">settings_input_svideo</i>Dashboard</a></li>
<li class="no-padding"><a class="waves-effect waves-grey" href="EditProfile.jsp?id=${row.empid}"><i class="material-icons">account_box</i>My Profiles</a></li>
<li class="no-padding"><a class="waves-effect waves-grey" href="changePassword.jsp"><i class="material-icons">settings_input_svideo</i>Change Password</a></li>
        <li class="no-padding">
            <a class="collapsible-header waves-effect waves-grey"><i class="material-icons">apps</i>Leaves<i class="nav-drop-icon material-icons">keyboard_arrow_right</i></a>
            <div class="collapsible-body">
                <ul>
                    <li><a href="EmpLeave.jsp">Apply Leave</a></li>
                    <li><a href="LeaveHistory.jsp?id=${row.empid}">Leave History</a></li>
                </ul>
            </div>
        </li>
    </c:forEach>


    <li class="no-padding">
        <a class="waves-effect waves-grey" href="logout.jsp"><i class="material-icons">exit_to_app</i>Sign Out</a>
    </li>


    </ul> 
    </div>
</aside>
