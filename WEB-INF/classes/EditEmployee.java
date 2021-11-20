package beans;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import beans.AdminDao;
import beans.RegisterBean;


public class EditEmployee extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
    { 
        String empname= req.getParameter("ename");
        String id  = req.getParameter("eid"); 
        String depname = req.getParameter("department"); 
        String email = req.getParameter("email"); 
        String gender = req.getParameter("gender"); 
        String date = req.getParameter("dob"); 
        String mobile = req.getParameter("mobile"); 
        String address = req.getParameter("address"); 
        String position = req.getParameter("position"); 
       
        
        RegisterBean  editemployeebean = new RegisterBean();
        editemployeebean.setEid(id);
        editemployeebean.setEname(empname);
        editemployeebean.setDepartment(depname);
        editemployeebean.setPosition(position);
        editemployeebean.setEmail(email);
        editemployeebean.setGender(gender);
        editemployeebean.setMobile(mobile);
        editemployeebean.setDob(date);
        editemployeebean.setAddress(address);
        
        
        if(AdminDao.EditEmployee(editemployeebean)){
             
           
             res.sendRedirect("../manageEmployee.jsp");
             
           }
        
        else{
            
            res.sendRedirect("../manageEmployee.jsp");

        }
    }
}
