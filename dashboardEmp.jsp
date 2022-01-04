
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.lang.*,java.io. *" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
if(session.getAttribute("username")==null){ response.sendRedirect("index.jsp"); } %>
<%@ include file="../include/header.jsp" %>     
<%@ include file="../include/sidebar.jsp" %>
        <%
        
            response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
        
            if(session.getAttribute("username")==null){
                response.sendRedirect("index.jsp");

            }


            int eid = (Integer)session.getAttribute("userid");
            
        %>
     
            <main class="mn-inner">
                <div class="middle-content">
                    <div class="row no-m-t no-m-b">
                    <div class="col s12 m12 l4">
                        <div class="card stats-card">
                            <div class="card-content">
                            
                                <span class="card-title">Yearly Seek Leave</span>
                                <span class="stats-counter">

                                    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                    url="jdbc:mysql://localhost/db_leave" user="root" password="" />
    
                                     <sql:query dataSource="${snapshot}" var="result">
                                                                            
                                        SELECT days from leavetype where LeaveType="Sick Leave (SL)";                                   
                                      
                                    </sql:query>
                                    <c:forEach var="row" items="${result.rows}">
                                        <c:set var="one" scope="session" value="${row.days}"/>  
                                        <c:set var="two" scope="session" value="${row.cnt}"/> 
                                        <c:out value="${one-two}" />
                                        
                                      
                                    </c:forEach>
                            </div>
                            <div id="sparkline-bar"></div>
                        </div>
                    </div>
                        <div class="col s12 m12 l4">
                        <div class="card stats-card">
                            <div class="card-content">
                            
                                <span class="card-title">Yearly Annual Leave</span>
                                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                    url="jdbc:mysql://localhost/db_leave" user="root" password="" />
    
                                     <sql:query dataSource="${snapshot}" var="result">
                                        SELECT days from leavetype where LeaveType="Annual Leave";
                                       
                                        
                                    </sql:query>
                                    <c:forEach var="row" items="${result.rows}">
                                        <c:out value="${row.days}" />
                                    </c:forEach>
    
                                </div>
                            <div id="sparkline-line"></div>
                        </div>
                    </div>
                    <div class="col s12 m12 l4">
                        <div class="card stats-card">
                            <div class="card-content">
                                <span class="card-title">Yearly Early Leave</span>
                                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                url="jdbc:mysql://localhost/db_leave" user="root" password="" />

                                 <sql:query dataSource="${snapshot}" var="result">
                                    SELECT days from leavetype where LeaveType="Early Leave";
                                  
                                </sql:query>
                                <c:forEach var="row" items="${result.rows}">
                                    <c:out value="${row.days}" />
                                </c:forEach>
                            </div>
                            <div class="progress stats-card-progress">
                                <div class="determinate" style="width: 70%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                 



                </div>
              
                <div class="middle-content">
                    <div class="row no-m-t no-m-b">
                    <div class="col s12 m12 l4">
                        <div class="card stats-card">
                            <div class="card-content">
                            
                                <span class="card-title">Used Seek Leave</span>
                                <span class="stats-counter">

                                    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                    url="jdbc:mysql://localhost/db_leave" user="root" password="" />
    
                                     <sql:query dataSource="${snapshot}" var="result">
                                        Select COUNT(l.empid) as cnt
                                        FROM leavetype lt, leaves l, employee emp 
                                        where lt.LeaveType = l.LeaveType and l.empid = emp.empid and emp.id =<%=eid%> and l.LeaveType="Sick Leave (SL)";
                                      
                                      
                                    </sql:query>
                                    <c:forEach var="row" items="${result.rows}">
                                        <c:out value="${row.cnt}" />
                                    </c:forEach>
                            </div>
                            <div id="sparkline-bar"></div>
                        </div>
                    </div>
                        <div class="col s12 m12 l4">
                        <div class="card stats-card">
                            <div class="card-content">
                            
                                <span class="card-title">Used Annual Leave</span>
                                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                    url="jdbc:mysql://localhost/db_leave" user="root" password="" />
    
                                     <sql:query dataSource="${snapshot}" var="result">
                                        Select COUNT(l.empid) as cnt
                                        FROM leavetype lt, leaves l, employee emp 
                                        where lt.LeaveType = l.LeaveType and l.empid = emp.empid and emp.id =<%=eid%> and l.LeaveType="Annual Leave";
                                        
                                    </sql:query>
                                    <c:forEach var="row" items="${result.rows}">
                                        <c:out value="${row.cnt}" />
                                    </c:forEach>
    
                                </div>
                            <div id="sparkline-line"></div>
                        </div>
                    </div>




                    <div class="col s12 m12 l4">
                        <div class="card stats-card">
                            <div class="card-content">
                                <span class="card-title">Used Early Leave</span>
                                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                url="jdbc:mysql://localhost/db_leave" user="root" password="" />

                                 <sql:query dataSource="${snapshot}" var="result">
                                      Select COUNT(l.empid) as cnt
                                FROM leavetype lt, leaves l, employee emp 
                                where lt.LeaveType = l.LeaveType and l.empid = emp.empid and emp.id =<%=eid%> and l.LeaveType="Early Leave";
                           
                                  
                                </sql:query>
                                <c:forEach var="row" items="${result.rows}">
                                    <c:out value="${row.cnt}" />
                                </c:forEach>
                            </div>
                            <div class="progress stats-card-progress">
                                <div class="determinate" style="width: 70%"></div>
                            </div>
                        </div>
                    </div>

                </div>
                


                <div class="middle-content">
                    <div class="row no-m-t no-m-b">
                    <div class="col s12 m12 l4">
                        <div class="card stats-card">
                            <div class="card-content">
                            
                                <span class="card-title">Remaining Seek Leave</span>
                                <span class="stats-counter">

                                    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                    url="jdbc:mysql://localhost/db_leave" user="root" password="" />
    
                                     <sql:query dataSource="${snapshot}" var="result">
                                                                            
                                        (Select lt.days,COUNT(l.empid) as cnt
                                        FROM leavetype lt, leaves l, employee emp 
                                        where lt.LeaveType = l.LeaveType and l.empid = emp.empid and emp.id =<%=eid%> and l.LeaveType="Sick Leave (SL)")
                                                                        
                                                                        
                                      
                                    </sql:query>
                                    <c:forEach var="row" items="${result.rows}">
                                        <c:set var="one" scope="session" value="${row.days}"/>  
                                        <c:set var="two" scope="session" value="${row.cnt}"/> 
                                        <c:out value="${one-two}" />
                                        
                                      
                                    </c:forEach>
                            </div>
                            <div id="sparkline-bar"></div>
                        </div>
                    </div>
                        <div class="col s12 m12 l4">
                        <div class="card stats-card">
                            <div class="card-content">
                            
                                <span class="card-title">Remaining Annual Leave</span>
                                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                    url="jdbc:mysql://localhost/db_leave" user="root" password="" />
    
    
                                    <sql:query dataSource="${snapshot}" var="result">
                                                                            
                                        (Select lt.days,COUNT(l.empid) as cnt
                                        FROM leavetype lt, leaves l, employee emp 
                                        where lt.LeaveType = l.LeaveType and l.empid = emp.empid and emp.id =<%=eid%> and l.LeaveType="Annual Leave")
                                                                        
                                                                        
                                      
                                    </sql:query>
                                    <c:forEach var="row" items="${result.rows}">
                                        <c:set var="one" scope="session" value="${row.days}"/>  
                                        <c:set var="two" scope="session" value="${row.cnt}"/> 
                                        <c:out value="${one-two}" />
                                        
                                      
                                    </c:forEach>
                                </div>
                            <div id="sparkline-line"></div>
                        </div>
                    </div>
                    <div class="col s12 m12 l4">
                        <div class="card stats-card">
                            <div class="card-content">
                                <span class="card-title">Remaining Early Leave</span>
                                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                url="jdbc:mysql://localhost/db_leave" user="root" password="" />

                                <sql:query dataSource="${snapshot}" var="result">
                                                                            
                                    (Select lt.days,COUNT(l.empid) as cnt
                                    FROM leavetype lt, leaves l, employee emp 
                                    where lt.LeaveType = l.LeaveType and l.empid = emp.empid and emp.id =<%=eid%> and l.LeaveType="Early Leave")
                                                                    
                                                                    
                                  
                                </sql:query>
                                <c:forEach var="row" items="${result.rows}">
                                    <c:set var="one" scope="session" value="${row.days}"/>  
                                    <c:set var="two" scope="session" value="${row.cnt}"/> 
                                    <c:out value="${one-two}" />
                                    
                                  
                                </c:forEach>
                            </div>
                            <div class="progress stats-card-progress">
                                <div class="determinate" style="width: 70%"></div>
                            </div>
                        </div>
                    </div>
                </div>
                 

            </main>
 
        
        
        <%@ include file="../include/footer.jsp" %> 