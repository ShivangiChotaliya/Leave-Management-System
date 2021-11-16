package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.io.ObjectInputFilter.Status;
import java.sql.*;
import beans.DepartmentBean;
import beans.AdminBean;

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

    public static boolean changePassword(AdminBean bean) {

        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost/db_login";
       
        Connection con = null;

        String USER = "root";
        String PASS = "";

        try {
          
            String password = bean.getPassword();
            String newPassword = bean.getNewPassword();
            int id = bean.getId();
           
            Class.forName(JDBC_DRIVER);

            con = DriverManager.getConnection(DB_URL, USER, PASS);

            String sql = "UPDATE ADMIN SET password = '"+ newPassword +"' where id ='"+id+"' ";

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

    
    public static boolean changeOldPassword(AdminBean bean){

        String JDBC_DRIVER ="com.mysql.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost/db_login";
    
        Connection con = null;
        
        String USER="root";
        String PASS="";
    
        try 
        {
            String password = bean.getPassword();
            String newPassword = bean.getNewPassword();
            String id = Integer.toString(bean.getId());
            
            Class.forName(JDBC_DRIVER);
        
            con = DriverManager.getConnection(DB_URL,USER,PASS);
           
            String sql =  "SELECT * FROM admin WHERE password=? and id=? ";
           

            PreparedStatement pst = con.prepareStatement(sql);
            pst.setString(1,password);
            pst.setString(2,id);
           
            ResultSet rs = pst.executeQuery();
           
            if(rs.next()){
               
                return true;
            }
            
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } 
        return false;
    }
    

    public static boolean TakeAction(LeaveBean bean){

        String JDBC_DRIVER ="com.mysql.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost/db_login";
    
        Connection con = null;
        
        String USER="root";
        String PASS="";
    
        try 
        {
            
            int status = bean.getStatus();
            String description = bean.getDescription();
            int leaveid = Integer.parseInt( bean.getLeaveId());
            
            
            Class.forName(JDBC_DRIVER);
        
            con = DriverManager.getConnection(DB_URL,USER,PASS);
              
                        
            PreparedStatement stmt=con.prepareStatement("update leaves set Description=?, Status=? where leaveid=?");  
            stmt.setString(1,description); 
            stmt.setInt(2, status);
            stmt.setInt(3,leaveid);  
            
            int rs=stmt.executeUpdate();  

            if (rs > 0) {

                return true;

            }   
            
        }
        catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        } 
        return false;
    }
    
    
    public static boolean EditDepartment(DepartmentBean bean) {

        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost/db_login";
       
        Connection con = null;

        String USER = "root";
        String PASS = "";

        try {
          
            String departmentName = bean.getDepartmentName();
            int id = bean.getDepartmentId();

             DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
             Date dateobj = new Date(); 
             String date=df.format(dateobj);
            
           
          
            Class.forName(JDBC_DRIVER);

            con = DriverManager.getConnection(DB_URL, USER, PASS);

            String sql = "UPDATE department SET departmentName='"+departmentName+"', creation_date='"+date+"' where departmentId='"+id+"' ";

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