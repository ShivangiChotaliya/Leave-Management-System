package beans;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpSession;



public class Logout extends HttpServlet {
    
    public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
    {       
        HttpSession session = req.getSession();
        session.removeAttribute("username");
        session.invalidate();
        res.sendRedirect("../index.jsp");
    }
}
