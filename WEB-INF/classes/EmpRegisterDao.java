package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;
import beans.RegisterBean;

public class EmpRegisterDao {

    public static boolean validate(RegisterBean bean) {

        String JDBC_DRIVER = "com.mysql.jdbc.Driver";
        String DB_URL = "jdbc:mysql://localhost/db_login";

        Connection con = null;

        String USER = "root";
        String PASS = "";

        try {
            String eid = bean.getEid();
            String ename = bean.getEname();
            String department = bean.getDepartment();
            String position = bean.getPosition();
            String email = bean.getEmail();
            String password = bean.getPassword();
            String gender = bean.getGender();
            String mobile = bean.getMobile();
            String dob = bean.getDob();
            String address = bean.getAddress();

            Class.forName(JDBC_DRIVER);

            con = DriverManager.getConnection(DB_URL, USER, PASS);

            String sql = "INSERT INTO employee(empid,empname,department,position,email,password,gender,mobile,dob,address)VALUES('"+eid+"','"+ename+"','"+department+"','"+position+"','"+email+"','"+password+"','"+gender+"','"+mobile+"','"+dob+"','"+address+"')";

            PreparedStatement pst = con.prepareStatement(sql);
            // pst.setString(1, eid);
            // pst.setString(2, ename);
            // pst.setString(3, department);
            // pst.setString(4, position);
            // pst.setString(5, email);
            // pst.setString(6, password);
            // pst.setString(7, gender);
            // pst.setString(8, mobile);
            // pst.setString(9, dob);
            // pst.setString(10, address);

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