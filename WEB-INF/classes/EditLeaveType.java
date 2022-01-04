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


public class EditLeaveType extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
    { 

        String leavetype= req.getParameter("leavetype");
        String id  = req.getParameter("id"); 
        int days = Integer.parseInt( req.getParameter("days"));
    
        int leavetypeid = Integer.parseInt(id); 
        
        LeaveTypeBean  editleavetypebean = new LeaveTypeBean();
        editleavetypebean.setLeaveTypeName(leavetype);
        editleavetypebean.setLeaveTypeId(leavetypeid);
        editleavetypebean.setDays(days);
        
        
        
        if(AdminDao.EditLeaveType(editleavetypebean)){
             
           
             res.sendRedirect("../ManageLeaveType.jsp");
             
           }
        
        else{
            
            res.sendRedirect("../ManageLeaveType.jsp");

        }
    }
}
