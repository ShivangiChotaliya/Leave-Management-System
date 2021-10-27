

package beans;
public class DepartmentBean {
    
    private int departmentId;
    private String departmentName;
    private String creation_date;

    public int getDepartmentId(){
        return  departmentId;
    }

    public void setDepartmentId(int  departmentId){
        this. departmentId= departmentId;
    }
    public String getDepartmentName(){
        return  departmentName;
    }
    public void setDepartmentName(String departmentName){
        this.departmentName=departmentName;
    }
    public String getCreationDate(){
        return  creation_date;
    }
    public void setCreationDate(String creation_date){
        this.creation_date=creation_date;
    }
}