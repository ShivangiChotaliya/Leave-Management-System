<%@ page language="java" contentType= "text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.lang.*,java.io. *"%>
<!DOCTYPE html>
    <html lang="en">

    <head>

     <!-- Title -->
     <title>Admin | Add Employee</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta charset="UTF-8">
    <meta name="description" content="Responsive Admin Dashboard Template" />
     <meta name="keywords" content="admin,dashboard" />
    <meta name="author" content="Steelcoders" />

                        <!-- Styles -->
                        <link type="text/css" rel="stylesheet"
                            href="assets/plugins/materialize/css/materialize.min.css" />
                        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                        <link href="assets/plugins/material-preloader/css/materialPreloader.min.css" rel="stylesheet">
                        <link href="assets/css/alpha.min.css" rel="stylesheet" type="text/css" />
                        <link href="assets/css/custom.css" rel="stylesheet" type="text/css" />
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

                        <script type="text/javascript">
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

                        </script>


                    </head>

      <body>
         <header class="mn-header navbar-fixed">
             <nav class="cyan darken-1">
                <div class="nav-wrapper row">
                  <section class="material-design-hamburger navigation-toggle">
                  </section>
                  <div class="header-title col s4">
                     <span class="chapter-title"> Employee Leave Management System</span>
                  </div>
                 </div>
            </nav>
        </header>


     <main class="mn-inner">
         <div class="row">
            <div class="col s12 m12 l12">
                <div class="card">
                     <div class="card-content">
                        <form id="example-form" method="post" name="addemp" action="beans/Register">
                             <div>
                                <h3>Sign Up</h3>
                                <section>
                                 <div class="wizard-content">
                                   <div class="row">
                                     <div class="col m6">
                                        <div class="row">
                                          <div class="input-field col  s12">
                                             <label for="empcode">Employee Code(Must be unique)</label>
                                                <input name="eid" id="empcode" type="text" autocomplete="off" required>
                                                 <span id="empid-availability" style="font-size:12px;"></span>
                                           </div>
                                           <div class="input-field col m6 s12">
                                             <label for="firstName">Employee's name</label>
                                                <input id="firstName" name="ename" type="text" required>
                                            </div>

                                            
                                             <div class="input-field col m6 s12">
                                                <select name="department" autocomplete="off">
                                                 <option value="">Select Department </option>
                                                 <%
                                                     try{
                                                         Class.forName("com.mysql.jdbc.Driver");
                                                         Connection con = DriverManager.getConnection("jdbc:mysql://localhost/db_login","root","");
                                                         Statement st = con.createStatement();
                                                         String query = "select *from department";
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
                                                                                <input name="email" type="email"
                                                                                    id="email" autocomplete="off"
                                                                                    required>
                                                                                <span id="emailid-availability"
                                                                                    style="font-size:12px;"></span>
                                                                            </div>

                                                                            <div class="input-field col s12">
                                                                                <label for="password">Password</label>
                                                                                <input id="password" name="password"
                                                                                    type="password" autocomplete="off"
                                                                                    required>
                                                                            </div>

                                                                            <div class="input-field col s12">
                                                                                <label for="confirm">Confirm
                                                                                    password</label>
                                                                                <input id="confirm"
                                                                                    name="confirmpassword"
                                                                                    type="password" autocomplete="off"
                                                                                    required>
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

                                                                            <input id="birthdate" name="dob" type="date"
                                                                                autocomplete="off">
                                                                        </div>



                                                                        <div class="input-field col m6 s12">
                                                                            <select name="position" autocomplete="off">
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
                                                                                maxlength="10" autocomplete="off"
                                                                                required>
                                                                        </div>

                                                                        <div class="input-field col m6 s12">
                                                                            <label for="address">Address</label>
                                                                            <input id="address" name="address"
                                                                                type="text" autocomplete="off" required>
                                                                        </div>





                                                                        <div class="input-field col s12">
                                                                            <input type="submit" name="Register"
                                                                                id="add"
                                                                                class="waves-effect waves-light btn indigo m-b-xs"
                                                                                onclick="return validate()">
                                                                            <div>Already have an Account <a
                                                                                    href="index.jsp">Sign In</a>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </section>


                                                    </section>
                                                </div>
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

                    </body>
                   
                    </html>