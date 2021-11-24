package beans;

import java.io.IOException;
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
            session.setAttribute("userid", userid);
            session.setAttribute("usertype","Employee");
           res.sendRedirect("../EmpLeave.jsp");
        }
        else{
            res.sendRedirect("../index.jsp");
        }
    }
}
