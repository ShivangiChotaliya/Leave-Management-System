package beans;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import beans.AdminDao;
import beans.AdminBean;

public class AdminHome extends HttpServlet {

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String oldPassword = req.getParameter("password");
        String newPassword = req.getParameter("newpassword");
        String confirmPassword = req.getParameter("confirmpassword");

        AdminBean adminBean = new AdminBean();
        adminBean.setPassword(oldPassword);
        adminBean.setNewPassword(newPassword);
        HttpSession session = req.getSession();

        String userType = (String) session.getAttribute("usertype");
        int userid = (int) session.getAttribute("userid");

        if (userType.equals("Admin")) {
            adminBean.setId(userid);

            if (AdminDao.changeOldPasswordAdmin(adminBean)) {
                if (newPassword.equals(confirmPassword)) {

                    if (AdminDao.changePasswordAdmin(adminBean)) {

                        res.sendRedirect("../changePassword.jsp?result=Password Change Successfully");
                    } else {
                        res.sendRedirect("../changePassword.jsp?result=Password not changed");
                    }
                } else {
                    res.sendRedirect("../changePassword.jsp?result=New Password And confirm Password is not same");
                }
            } else {
                res.sendRedirect("../changePassword.jsp?result=Current Password is invalid");
            }
        } else {

            adminBean.setId(userid);
            if (AdminDao.changeOldPasswordEmployee(adminBean)) {
                if (newPassword.equals(confirmPassword)) {

                    if (AdminDao.changePasswordEmployee(adminBean)) {

                        res.sendRedirect("../changePassword.jsp?result=Password Change Successfully");
                    } else {
                        res.sendRedirect("../changePassword.jsp?result=Password not changed");
                    }
                } else {
                    res.sendRedirect("../changePassword.jsp?result=New Password And Old Password is not same");
                }
            } else {
                res.sendRedirect("../changePassword.jsp?result=Current Password is invalid");
            }
        }

    }

}
