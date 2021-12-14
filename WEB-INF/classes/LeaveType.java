package beans;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import beans.AdminDao;
import beans.LeaveTypeBean;


public class LeaveType extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
    { 
        String leavetype= req.getParameter("leavetype");
        int days= Integer.parseInt(req.getParameter("days"));

        String msg;
        res.setContentType("text/html");

        PrintWriter out = res.getWriter();
        LeaveTypeBean  leavetypeBean = new  LeaveTypeBean();
        leavetypeBean.setLeaveTypeName(leavetype);
        leavetypeBean.setDays(days);
        
        
        if(AdminDao.AddleaveType(leavetypeBean)){
             res.sendRedirect("../ManageLeaveType.jsp");
             
           }
        
        else{
           
        }
    }
}
