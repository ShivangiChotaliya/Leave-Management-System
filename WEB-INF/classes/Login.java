package beans;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import beans.LoginDao;
import beans.EmpRegisterDao;



public class Login extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
    { 
        String username = req.getParameter("username");
        String password = req.getParameter("password");
     
        LoginBean loginBean = new LoginBean();
        loginBean.setUsername(username);
        loginBean.setPassword(password);

        RegisterBean registerBean = new RegisterBean();
        
        registerBean.setEmail(username);
        registerBean.setPassword(password);

        int userid =LoginDao.validateAdmin(loginBean);
        int empid =LoginDao.validateEmployee(registerBean);
        int employeeId;

        if(userid!=-1){
            
            HttpSession session = req.getSession();
            session.setAttribute("username",username);
            session.setAttribute("userid", userid);
            session.setAttribute("usertype","Admin");

           res.sendRedirect("../changePassword.jsp");
        }
        else if( (userid =LoginDao.validateEmployee(registerBean))!=-1){
            HttpSession session = req.getSession();
            session.setAttribute("username",username);
            session.setAttribute("userid", empid);
            session.setAttribute("usertype","Employee");
           
           res.sendRedirect("../EmpLeave.jsp");
        }
        else{
            res.setContentType("text/html");
            PrintWriter out = res.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Please Provide valid Email and password!');");
            out.println("location='../index.jsp';");
            out.println("</script>");
          
           // res.sendRedirect("../index.jsp");
        }
    }
}
