<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <aside id="slide-out" class="side-nav white fixed">
        <div class="side-nav-wrapper">
            <div class="sidebar-profile">
                <div class="sidebar-profile-image">
                    <img src="assets/images/profile-image.png" class="circle" alt="">
                </div>
                <div class="sidebar-profile-info">
                    <p>Admin</p>
                </div>
            </div>
            <ul class="sidebar-menu collapsible collapsible-accordion" data-collapsible="accordion">
                <li class="no-padding"><a class="waves-effect waves-grey" href="dashboard.jsp"><i
                            class="material-icons">settings_input_svideo</i>Dashboard</a></li>
                <li class="no-padding">
                    <a class="collapsible-header waves-effect waves-grey"><i class="material-icons">apps</i>Department<i
                            class="nav-drop-icon material-icons">keyboard_arrow_right</i></a>
                    <div class="collapsible-body">
                        <ul>
                            <li><a href="addDepartment.jsp">Add Department</a></li>
                            <li><a href="ManageDepartment.jsp">Manage Department</a></li>
                        </ul>
                    </div>
                </li>
                <li class="no-padding">
                    <a class="collapsible-header waves-effect waves-grey"><i class="material-icons">code</i>Leave Type<i
                            class="nav-drop-icon material-icons">keyboard_arrow_right</i></a>
                    <div class="collapsible-body">
                        <ul>
                            <li><a href="addLeaveType.jsp">Add Leave Type</a></li>
                            <li><a href="ManageLeaveType.jsp">Manage Leave Type</a></li>
                        </ul>
                    </div>
                </li>
                <li class="no-padding">
                    <a class="collapsible-header waves-effect waves-grey"><i
                            class="material-icons">account_box</i>Employees<i
                            class="nav-drop-icon material-icons">keyboard_arrow_right</i></a>
                    <div class="collapsible-body">
                        <ul>
                           
                            <li><a href="manageEmployee.jsp">Manage Employee</a></li>

                        </ul>
                    </div>
                </li>

                <li class="no-padding">
                    <a class="collapsible-header waves-effect waves-grey"><i
                            class="material-icons">desktop_windows</i>Leave Management<i
                            class="nav-drop-icon material-icons">keyboard_arrow_right</i></a>
                    <div class="collapsible-body">
                        <ul>
                            <li><a href="leaves.jsp">All Leaves </a></li>
                            <li><a href="pendingLeavehistory.jsp">Pending Leaves </a></li>
                            <li><a href="approvedleaveHistory.jsp">Approved Leaves</a></li>
                            <li><a href="notapprovedLeaves.jsp">Not Approved Leaves</a></li>

                        </ul>
                    </div>
                </li>
                <li class="no-padding">
                    <a class="waves-effect waves-grey" href="Logout"><i class="material-icons">exit_to_app</i>Sign Out</a>
                </li>

            </ul>
        </div>
    </aside>