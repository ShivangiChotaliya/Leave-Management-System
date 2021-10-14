package beans;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import beans.EmpRegisterDao;


public class Register extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
    { 
        String empid = req.getParameter("eid");
        String empname = req.getParameter("ename");
		String depname = req.getParameter("department");
		String position = req.getParameter("position");
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		String gender = req.getParameter("gender");
		String mob = req.getParameter("mobile");
		String dob = req.getParameter("dob");
		String address = req.getParameter("address");
     
        RegisterBean registerBean = new RegisterBean();
        registerBean.setEid(empid);
        registerBean.setEname(empname);
		registerBean.setDepartment(depname);
        registerBean.setPosition(position);
		registerBean.setEmail(email);
        registerBean.setPassword(pass);
		registerBean.setGender(gender);
        registerBean.setMobile(mob);
		registerBean.setDob(dob);
        registerBean.setAddress(address);
        
       
        if(EmpRegisterDao.validate(registerBean)){
           
          
           res.sendRedirect("../index.jsp");
        }
        else{
            res.sendRedirect("../index.jsp");
        }
    }
}
