package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
import beans.LoginBean;
import beans.RegisterBean;

public class LoginDao{
   

public static boolean validateAdmin(LoginBean bean){

    String JDBC_DRIVER ="com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost/db_login";

    Connection con = null;
    
    String USER="root";
    String PASS="";

    try 
    {
        String uname = bean.getUsername();
        String pwd = bean.getPassword(); 
        
        Class.forName(JDBC_DRIVER);
    
        con = DriverManager.getConnection(DB_URL,USER,PASS);
        
        String sql = "SELECT * FROM admin WHERE username=? and password=? ";
       
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1,uname);
        pst.setString(2,pwd);
       
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
public static boolean validateEmployee(RegisterBean bean){

    String JDBC_DRIVER ="com.mysql.jdbc.Driver";
    String DB_URL = "jdbc:mysql://localhost/db_login";

    Connection con = null;
    
    String USER="root";
    String PASS="";

    try 
    {
        String email = bean.getEmail();
        String password = bean.getPassword(); 
        
        Class.forName(JDBC_DRIVER);
    
        con = DriverManager.getConnection(DB_URL,USER,PASS);
        String sql =  "SELECT * FROM employee WHERE email=? and password=? ";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1,email);
        pst.setString(2,password);
       
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



}