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


public class Department extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
    { 
        String departmentName= req.getParameter("departmentname");
       
        DepartmentBean  departmentBean = new  DepartmentBean();
        departmentBean.setDepartmentName(departmentName);
        
        
        
        if(AdminDao.AddDepartment(departmentBean)){
             
           
             res.sendRedirect("../ManageDepartment.jsp");
             
           }
        
        else{
            
            res.sendRedirect("../ManageDepartment.jsp");

        }
    }
}
