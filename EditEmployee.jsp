<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.lang.*,java.io. *" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
if(session.getAttribute("username")==null){ response.sendRedirect("index.jsp"); } %>
<%@ include file="header.jsp" %>
    <%@ include file="sidebar.jsp" %>


                        <!-- <script type="text/javascript">
                            function validate() {

                                if (!document.addemp.ename.value.match(/^[a-zA-Z- ']+$/) || document.addemp.ename.value.length > 50) {
                                    alert("Please Enter Proper Name");
                                    return false;
                                }
                                else if (!document.addemp.email.value.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/)) {
                                    alert("please enter valid email address");
                                    return false;
                                }
                                else if (!document.addemp.password.value.match(/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/)) {
                                    alert("Password Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters");
                                    return false;
                                }
                                else if (!document.addemp.conpass.value.match(document.form1.password.value)) {
                                    alert("password must be same");
                                    return false;
                                }
                                else if (!documnet.addemp.mobile.value.match(/^\d{10}$/)) {
                                    alert("please enter 10 digits Only");
                                    return false;
                                }

                                else {
                                    return true;
                                }
                            }

                        </script> -->


                    </head>

    


     <main class="mn-inner">
         <div class="row">
            <div class="col s12 m12 l12">
                <div class="card">
                     <div class="card-content">
                        <form id="example-form" method="post" name="addemp" action="beans/EditEmployee">
                            <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                                                    url="jdbc:mysql://localhost/db_login"
                                                    user="root"  password=""/>
                                                     <% String id = request.getParameter("id");%>
                                                    <sql:query dataSource="${snapshot}" var="result">
                                                    
                                                        SELECT * from employee where empid=<%=id%>;
                                                    </sql:query>
                                                    <c:forEach  var="row" items="${result.rows}">  
                             <div>
                               <h3> Update Employee Details</h3>
                                <section>
                                 <div class="wizard-content">
                                   <div class="row">
                                     <div class="col m6">
                                        <div class="row">
                                          <!-- <div class="input-field col  s12">
                                             <label for="empcode">Employee Code(Must be unique)</label>-->
                                                <input name="eid" id="empcode" type="hidden" autocomplete="off" value="<c:out value='${row.empid}'/>" required> 
                                                 <!-- <span id="empid-availability" style="font-size:12px;"></span> -->
                                           <!-- </div> --> 
                                           <div class="input-field col m6 s12">
                                             <label for="firstName">Employee's name</label>
                                                <input id="firstName" name="ename" type="text" value="<c:out value='${row.empname}' />" required>
                                            </div>

                                            
                                             <div class="input-field col m6 s12">
                                                <select name="department" autocomplete="off" value="<c:out value='${row.department}' />">
                                                 <option value="">Select Department </option>
                                                 <%
                                                     try{
                                                         Class.forName("com.mysql.jdbc.Driver");
                                                         Connection con = DriverManager.getConnection("jdbc:mysql://localhost/db_login","root","");
                                                         Statement st = con.createStatement();
                                                         String query = "select * from department";
                                                         ResultSet rs = st.executeQuery(query);
                                                         while(rs.next()){
                                                     
                                                 %>
                                                 <option><%=rs.getString("departmentName") %> </option>
                                                 <%
                                                         }
                                                        }
                                                        catch(Exception e){

                                                        }
                                                 %> 
                                                
                                                </select>
                                                </div>
                                                
                                                       <div class="input-field col s12">
                                                        <label for="email">Email</label>
                                                        <input name="email" type="email" id="email" autocomplete="off" value="<c:out value='${row.email}' />" required>
                                                        <span id="emailid-availability" style="font-size:12px;"></span>
                                                        </div>

                                                       
                                                     </div>
                                                    </div>

                                                    <div class="col m6">
                                                        <div class="row">
                                                            <div class="input-field col m6 s12">
                                                                <select name="gender" autocomplete="off">
                                                                                <option value="">Select Gender</option>
                                                                                <option value="Male">Male</option>
                                                                                <option value="Female">Female</option>
                                                                                <option value="Other">Other</option>
                                                                            </select>
                                                                        </div>
                                                          <div class="input-field col m6 s12">
                                                            <input id="birthdate" name="dob" type="date" value="<c:out value='${row.dob}' />"autocomplete="off">
                                                               </div>



                                                                        <div class="input-field col m6 s12">
                                                                            <select name="position" autocomplete="off" value="<c:out value='${row.position}' />">
                                                                                <option value="">Select Position
                                                                                </option>
                                                                                <option value="Manager">Manager</option>
                                                                                <option value="Developer">Developer
                                                                                </option>
                                                                                <option value="HR">HR</option>
                                                                                <option value="Accontant">Accontant
                                                                                </option>
                                                                                <option value="Receptionist">
                                                                                    Receptionist</option>
                                                                            </select>
                                                                        </div>

                                                                        <div class="input-field col s12">
                                                                            <label for="phone">Mobile number</label>
                                                                            <input id="phone" name="mobile" type="tel"
                                                                                maxlength="10" autocomplete="off" value="<c:out value='${row.mobile}' />"
                                                                                required>
                                                                        </div>

                                                                        <div class="input-field col m6 s12">
                                                                            <label for="address">Address</label>
                                                                            <input id="address" name="address"
                                                                                type="text" autocomplete="off" value="<c:out value='${row.address}' />"required>
                                                                        </div>


                                                                   


                                                                        <div class="input-field col s12">
                                                                            <div class="input-field col s12">
                                                                                <button type="submit" name="update" onclick="return validate()" class="waves-effect waves-light btn indigo m-b-xs">UPDATE</button>
                                                                                
                                                                                </div>
                                                                           
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </section>


                                                    </section>
                                                </div>
                                                </c:forEach>
                                            </form>
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
                        <script src="assets/js/alpha.min.js"></script>
                        <!-- <script src="assets/js/pages/form_elements.js"></script> -->

                    
                    <%@ include file="../include/footer.jsp" %>