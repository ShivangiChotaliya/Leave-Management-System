package beans;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;

import beans.AdminDao;
import beans.EmployeeDao;
import beans.LeaveBean;


public class TakeAction extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
    { 

        int leaveStatus = Integer.parseInt(req.getParameter("status"));
        String description = req.getParameter("description");
        String leaveid = req.getParameter("leaveid");
       
        LeaveBean leaveBean = new LeaveBean();
        leaveBean.setStatus(leaveStatus);
        leaveBean.setDescription(description);
     
        leaveBean.setLeaveId(leaveid);


		
        
        if(AdminDao.TakeAction(leaveBean)){
           
           res.sendRedirect("../leaveDetails.jsp?leaveid=" +leaveid );
        }
        else{
            res.sendRedirect("../leaveDetails.jsp?leaveid=" +leaveid );
        }


    }
}
