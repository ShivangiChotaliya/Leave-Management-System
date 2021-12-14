
package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
import beans.LeaveBean;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

 
        

public class  EmployeeDao {

    public static boolean ApplyLeave(LeaveBean bean) {

        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost/db_login";
       
        Connection con = null;

        String USER = "root";
        String PASS = "";

        try {
               String empid = bean.getEmpId();
            String leavetype = bean.getLeaveType();
            String fromdate = bean.getFromDate();
            String todate = bean.getToDate();
            String description = bean.getDescription();
            String image = bean.getFileName();
           
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date dateobj = new Date(); 
            String date=df.format(dateobj);
            int status = 0;
            Class.forName(JDBC_DRIVER);

            con = DriverManager.getConnection(DB_URL, USER, PASS);
            int eid = Integer.parseInt(empid);

        
            String query = "SELECT empid from employee where id=?";
           PreparedStatement pst = con.prepareStatement(query);
           pst.setInt(1,eid);
           
           ResultSet r = pst.executeQuery();
           
           String emid=null;
           while (r.next()){
             emid = r.getString("empid");
           }
            String sql = "INSERT INTO leaves(LeaveType,ToDate,FromDate,Description,PostingDate,Status,empid,Attachement)VALUES('"+leavetype+"','"+todate+"','"+fromdate+"','"+description+"','"+date+"','"+status+"','"+emid+"','"+image+"')";
             pst = con.prepareStatement(sql);
            

            int rs = pst.executeUpdate(sql);
            if (rs > 0) {

                return true;

            }

        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
}  
