package beans;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import beans.EmployeeDao;
import beans.LeaveBean;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.*;

@MultipartConfig(
  fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
  maxFileSize = 1024 * 1024 * 20,      // 20 MB
  maxRequestSize = 1024 * 1024 * 100   // 100 MB
)

public class Leave extends HttpServlet {
    
    public void doPost(HttpServletRequest req, HttpServletResponse res)throws ServletException,IOException
    { 

      
    
        String empid = req.getParameter("eid");
        String leavetype = req.getParameter("leavetype");
        String fromdate = req.getParameter("fromdate");
		String todate = req.getParameter("todate");
		String description = req.getParameter("description");
        
    
      
             
		
        LeaveBean leaveBean = new LeaveBean();
		 leaveBean.setEmpId(empid);
        leaveBean.setLeaveType(leavetype);
        leaveBean.setFromDate(fromdate);
		leaveBean.setToDate(todate);
        leaveBean.setDescription(description);
		
        if(leavetype.equals("Sick Leave (SL)")){
            Part filePart2 = req.getPart("file");
            String image = getSubmittedFileName(filePart2);
            leaveBean.setFileName(image);
            uploadImage(filePart2,req);
                 
         }
       
        if(EmployeeDao.ApplyLeave(leaveBean)){

           
            res.setContentType("text/html");
            PrintWriter out = res.getWriter();
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Leave Added Successfully!');");
            out.println("location='../EmpLeave.jsp';");
            out.println("</script>");
          
          
        }
        else{
            res.sendRedirect("../index.jsp");
        }
      
      
         
       // res.sendRedirect(req.getContextPath() + "/EmpLeave.jsp?");
        
  }

      
    
      private static void uploadImage(Part filePart,HttpServletRequest request) throws ServletException, IOException
      {
    
        String fileName = getSubmittedFileName(filePart);
    
        String appPath = request.getServletContext().getRealPath("");
    
        String finalPath=appPath+"/imgs"+ File.separator + fileName;
    
        OutputStream out = null;
        InputStream filecontent = null;
    
        System.out.println("image name: "+ finalPath);
        try 
        {
          out = new FileOutputStream(new File(finalPath));
          filecontent = filePart.getInputStream();
    
          int read = 0;
          final byte[] bytes = new byte[1024];
    
          while ((read = filecontent.read(bytes)) != -1) 
          {
              out.write(bytes, 0, read);
          }
    
        }
        catch(Exception e)
        {
          e.printStackTrace();
        }
      
    
      }
    
      private static String getSubmittedFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
                return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
            }
        }
        return null;
    }
    
    
    private static String getValue(Part part) throws IOException {
      BufferedReader reader = new BufferedReader(new InputStreamReader(part.getInputStream(), "UTF-8"));
      StringBuilder value = new StringBuilder();
      char[] buffer = new char[1024];
      for (int length = 0; (length = reader.read(buffer)) > 0;) {
          value.append(buffer, 0, length);
      }
      return value.toString();
    }
    
    
	   
}
