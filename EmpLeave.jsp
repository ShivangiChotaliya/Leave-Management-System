<%@ page language="java" contentType= "text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*,java.util.*,java.lang.*,java.io.*,java.util.Date, java.text.DateFormat,java.text.SimpleDateFormat"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        
        <!-- Title -->
        <title>Employee | Apply Leave</title>
        
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
        <meta charset="UTF-8">
        <meta name="description" content="Responsive Admin Dashboard Template" />
        <meta name="keywords" content="admin,dashboard" />
        <meta name="author" content="Steelcoders" />
        
        <!-- Styles -->
        <link type="text/css" rel="stylesheet" href="assets/plugins/materialize/css/materialize.min.css"/>
        <link href="http://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="assets/plugins/material-preloader/css/materialPreloader.min.css" rel="stylesheet"> 
        <link href="assets/css/alpha.min.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
  
<script>
    function check() {
    var startDate = document.getElementById("date1").value;
    var endDate = document.getElementById("date2").value;
    let today = new Date().toISOString().split('T')[0];
	
	 if (startDate >= endDate){
        alert("End date should be greater than Start date");
       return false;
    }
    else if(today >= startDate) {
	    alert("Enter a Valid Date");
		return false;
	}
	else{
	    return true;
	}
    return true;
};
</script>

    </head>
    <body>
        
    <%
    
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
    
        if(session.getAttribute("username")==null){
            response.sendRedirect("index.jsp");
        }
    %>
    
        <%@ include file="../include/header.jsp" %>
            
        <%@ include file="../include/sidebar.jsp" %>
   <main class="mn-inner">
                <div class="row">
                    <div class="col s12">
                        <div class="page-title">Apply for Leave</div>
                    </div>
                    <div class="col s12 m12 l8">
                        <div class="card">
                            <div class="card-content">
                                <form id="example-form" method="post" name="leave" action="beans/Leave">
                                    <div>
                                        <h3>Apply for Leave</h3>
                                        <section>
                                            <div class="wizard-content">
                                                <div class="row">
                                                    <div class="col m12">
                                              
											  <div class="row">
											  <% int eid = (Integer)session.getAttribute("userid");
                                                             %>
                                                            
     <input type="hidden" name="eid" value="<%=eid%>"/>

 <div class="input-field col  s12">
<select  name="leavetype" autocomplete="off">
<option value="">Select leave type...</option>
<%
try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/db_login","root","");
    Statement st = con.createStatement();
    String query = "select *from leavetype";
    ResultSet rs = st.executeQuery(query);
    while(rs.next()){

%>         

<option><%=rs.getString("LeaveType") %></option>
<%
                                                         }
                                                        }
                                                        catch(Exception e){

                                                        }
                                                 %>
</select>
</div>


<div class="input-field col m6 s12">
<label for="fromdate">From  Date</label><br>
<input placeholder="" id="date1" name="fromdate"  type="date" required>
</div>
<div class="input-field col m6 s12">
<label for="todate">To Date</label><br>
<input placeholder="" id="date2" name="todate"  type="date"  required>
</div>
<div class="input-field col m12 s12">
<label for="birthdate">Description</label>    

<textarea id="textarea1" name="description" class="materialize-textarea" length="500" required></textarea>
</div>
</div>
      <button type="submit" name="apply" id="apply" class="waves-effect waves-light btn indigo m-b-xs" onclick="return check();">Apply</button>                                             

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
        <script src="assets/js/pages/form_elements.js"></script>
        
    </body>
</html>
