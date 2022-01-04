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
                            <div class="page-title">Add Department</div>
                        </div>
                        <div class="col s12 m12 l6">
                            <div class="card">
                                <div class="card-content">

                                    <div class="row">
                                        <form class="col s12" name="chngpwd" method="post" action="beans/Department">

                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <input id="departmentname" type="text" class="validate"
                                                        autocomplete="off" name="departmentname" required>
                                                    <label for="deptname">Department Name</label>
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
                <%@ include file="../include/footer.jsp" %>