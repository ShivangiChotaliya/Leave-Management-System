<!DOCTYPE html>
<html lang="en">
<body>

    <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
        if(session.getAttribute("username")==null){ response.sendRedirect("index.jsp"); } %>
        <%@ include file="header.jsp" %>
            <%@ include file="sidebar.jsp" %>
                <main class="mn-inner">
                    <div class="row">
                        <div class="col s12">
                            <div class="page-title">Add Employee</div>
                        </div>
                        <div class="col s12 m12 l6">
                            <div class="card">
                                <div class="card-content">

                                    <div class="row">
                                        <form class="col s12" name="chngpwd" method="post" action="beans/LeaveType">


                                            <div class="input-field col s12">
                                                <input id="leavetype" type="text" class="validate" autocomplete="off"
                                                    name="leavetype" required>
                                                <label for="leavetype">Leave Type</label>
                                            </div>



                                            <div class="input-field col s12">
                                                <button type="submit" name="add"
                                                    class="waves-effect waves-light btn indigo m-b-xs">ADD</button>
                                            </div>
                                    </div>

                                    </form>
                                </div>
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