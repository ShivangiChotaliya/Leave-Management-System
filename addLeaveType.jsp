
    <% response.setHeader("Cache-Control","no-cache,no-store,must-revalidate" );
        if(session.getAttribute("username")==null){ response.sendRedirect("index.jsp"); } %>
        <%@ include file="header.jsp" %>
            <%@ include file="sidebar.jsp" %>
                <main class="mn-inner">
                    <div class="row">
                        <div class="col s12">
                            <div class="page-title">Add Leave Type</div>
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
                                                <input id="days" type="number" class="validate" autocomplete="off"
                                                    name="days" required>
                                                <label for="days">Number of days</label>
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
                <%@ include file="../include/footer.jsp" %>