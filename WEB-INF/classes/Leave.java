package beans;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import beans.EmployeeDao;
import beans.LeaveBean;


public class Leave extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
    { 
        String leavetype = req.getParameter("leavetype");
        String fromdate = req.getParameter("fromdate");
		String todate = req.getParameter("todate");
		String description = req.getParameter("description");
		
        LeaveBean leaveBean = new LeaveBean();
        leaveBean.setLeaveType(leavetype);
        leaveBean.setFromDate(fromdate);
		leaveBean.setToDate(todate);
        leaveBean.setDescription(description);
		
        
       
        if(EmployeeDao.ApplyLeave(leaveBean)){
           
            
           res.sendRedirect("../EmpLeave.jsp");
        }
        else{
            res.sendRedirect("../index.jsp");
        }
    }
}
