<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.sql.*,java.util.*,java.lang.*,java.io. *" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


                <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
                    if(session.getAttribute("username")==null){ response.sendRedirect("index.jsp"); } %>
                    <%@ include file="header.jsp" %>
                        <%@ include file="sidebar.jsp" %>

                            <main class="mn-inner">
                                <div class="row">
                                    <div class="col s12">
                                        <div class="page-title" style="font-size:24px;">Leave Details</div>
                                    </div>
                                    <% String leaveid = request.getParameter("leaveid"); %>
                                    <div class="col s12 m12 l12">
                                        <div class="card">
                                            <div class="card-content">
                                                <span class="card-title">Leave Details</span>

                                                <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                                    url="jdbc:mysql://localhost/db_login" user="root" password="" />

                                                <sql:query dataSource="${snapshot}" var="result">
                                                    SELECT l.leaveid as
                                                    lid,e.empname,e.EmpId,e.id,e.Gender,e.mobile,e.email,l.LeaveType,l.ToDate,l.FromDate,l.Description,l.PostingDate,l.Status,l.AdminRemark,l.AdminRemarkDate
                                                    from leaves l, employee e
                                                    where l.empid=e.id and l.leaveid=<%=leaveid %>;

                                                </sql:query>

                                                <table id="example" class="display responsive-table ">
                                                    <c:forEach var="row" items="${result.rows}">
                                                        <tbody>

                                                            <tr>
                                                                <td style="font-size:16px;"> <b>Employe Name :</b></td>

                                                                <td>
                                                                    <c:out value="${row.empname}" />
                                                                </td>
                                                                <td style="font-size:16px;"><b>Emp Id :</b></td>
                                                                <td>
                                                                    <c:out value="${row.id}" />
                                                                </td>
                                                                <td style="font-size:16px;"><b>Gender :</b></td>
                                                                <td>
                                                                    <c:out value="${row.Gender}" />
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="font-size:16px;"><b>Emp Email id :</b></td>
                                                                <td>
                                                                    <c:out value="${row.email}" />
                                                                </td>
                                                                <td style="font-size:16px;"><b>Emp Contact No. :</b>
                                                                </td>
                                                                <td>
                                                                    <c:out value="${row.mobile}" />
                                                                </td>
                                                                <td>&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>

                                                            <tr>
                                                                <td style="font-size:16px;"><b>Leave Type :</b></td>
                                                                <td>
                                                                    <c:out value="${row.LeaveType}" />
                                                                </td>
                                                                <td style="font-size:16px;"><b>Leave Date . :</b></td>
                                                                <td>From
                                                                    <c:out value="${row.FromDate}" /> to
                                                                    <c:out value="${row.ToDate}" />
                                                                </td>
                                                                <td style="font-size:16px;"><b>Posting Date</b></td>
                                                                <td>
                                                                    <c:out value="${row.PostingDate}" />
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="font-size:16px;"><b>Employe Leave Description
                                                                        : </b></td>
                                                                <td colspan="5">
                                                                    <c:out value="${row.Description}" />
                                                                </td>

                                                            </tr>

                                                            <tr>
                                                                <td style="font-size:16px;"><b>leave Status :</b></td>
                                                                <td colspan="5">
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
                                                                            <span style="color: blue">waiting for
                                                                                approval</span>
                                                                            <br />
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="font-size:16px;"><b>Admin Remark: </b></td>
                                                                <td colspan="5">
                                                                    <c:choose>
                                                                        <c:when test="${row.AdminRemark=='NULL'}">
                                                                            <span style="color: blue">waiting for
                                                                                approval</span>
                                                                            <br />
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:out value="${row.AdminRemark}" />
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="font-size:16px;">
                                                                    <c:choose>
                                                                        <c:when test="${row.AdminRemarkDate=='NULL'}">
                                                                            <span style="color: blue">NA</span>
                                                                            <br />
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <c:out value="${row.AdminRemarkDate}" />
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                            </tr>


                                                            <tr>
                                                                <td colspan="5">
                                                                    <a class="modal-trigger waves-effect waves-light btn"
                                                                        href="#modal1">Take&nbsp;Action</a>
                                                                </td>
                                                            </tr>

                                                        </tbody>


                                                       

                                                    </c:forEach>
                                                </table>


                                                <form name="adminaction" method="post"
                                                action="beans/TakeAction">
                                                <div id="modal1" class="modal modal-fixed-footer"
                                                    style="height: 60%">
                                                    <div class="modal-content" style="width:90%">
                                                        <h4>Leave take action</h4>
                                                        <select class="browser-default" name="status"
                                                            required="">
                                                            <option value="">Choose your option</option>
                                                            <option value="1">Approved</option>
                                                            <option value="0">Not Approved</option>
                                                        </select></p>
                                                        <p><textarea id="textarea1" name="description"
                                                                class="materialize-textarea"
                                                                name="description" placeholder="Description"
                                                                length="500" maxlength="500"
                                                                required></textarea></p>
                                                  

                                                    </div>
                                                    <input type="hidden" name="leaveid" value="<%=leaveid%>">
                                                    <div class="modal-footer" style="width:90%">
                                                        <input type="submit"
                                                            class="waves-effect waves-light btn blue m-b-xs"
                                                            name="update" value="Submit">
                                                    </div>

                                                </div>
                                                </td>
                                                </tr>
                                            </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </main>

                            <%@ include file="../include/footer.jsp" %>