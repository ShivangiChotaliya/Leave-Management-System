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
	    String empid = req.getParameter("eid");
        String leavetype = req.getParameter("leavetype");
        String fromdate = req.getParameter("fromdate");
		String todate = req.getParameter("todate");
		String description = req.getParameter("description");
		
        LeaveBean leaveBean = new LeaveBean();
		 leaveBean.setEmpId(empid);
        leaveBean.setLeaveType(leavetype);
        leaveBean.setFromDate(fromdate);
		leaveBean.setToDate(todate);
        leaveBean.setDescription(description);
		
        
       
        if(EmployeeDao.ApplyLeave(leaveBean)){
           
            res.setContentType("text/html");
            PrintWriter out = res.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Leave Added Successfully!');");
            out.println("location='../EmpLeave.jsp';");
            out.println("</script>");
          
          
        }
        else{
            res.sendRedirect("../index.jsp");
        }
    }
}
