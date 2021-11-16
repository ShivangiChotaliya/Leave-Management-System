package beans;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import beans.AdminDao;
import beans.DepartmentBean;


public class EditDepartment extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
    { 
        String departmentName= req.getParameter("departmentname");
        String id  = req.getParameter("departmentid"); 
    
        int departmentId = Integer.parseInt(id); 
        
        DepartmentBean  editdepartmentbean = new DepartmentBean();
        editdepartmentbean.setDepartmentName(departmentName);
        editdepartmentbean.setDepartmentId(departmentId);
        
        
        
        if(AdminDao.EditDepartment(editdepartmentbean)){
             
           
             res.sendRedirect("../ManageDepartment.jsp");
             
           }
        
        else{
            
            res.sendRedirect("../ManageDepartment.jsp");

        }
    }
}
