
package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
import beans.DepartmentBean;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

 
        

public class AdminDao {

    public static boolean AddDepartment(DepartmentBean bean) {

        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost/db_login";
       
        Connection con = null;

        String USER = "root";
        String PASS = "";

        try {
          
            String departmentName = bean.getDepartmentName();

            DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
            Date dateobj = new Date(); 
            String date=df.format(dateobj);
  

            Class.forName(JDBC_DRIVER);

            con = DriverManager.getConnection(DB_URL, USER, PASS);

            String sql = "INSERT INTO department(departmentName,creation_date)VALUES('"+departmentName+"','"+date+"')";

            PreparedStatement pst = con.prepareStatement(sql);
          
            
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
    public static boolean AddleaveType(LeaveTypeBean bean) {

        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost/db_login";
       
        Connection con = null;

        String USER = "root";
        String PASS = "";

        try {
          
            String leavetypeName = bean.getLeaveTypeName();

            DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
            Date dateobj = new Date(); 
            String date=df.format(dateobj);
  

            Class.forName(JDBC_DRIVER);

            con = DriverManager.getConnection(DB_URL, USER, PASS);

            String sql = "INSERT INTO leavetype(LeaveType,CreationDate)VALUES('"+leavetypeName+"','"+date+"')";

            PreparedStatement pst = con.prepareStatement(sql);
          
            
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