
package beans;

public class LeaveBean{
    private String leaveid;
    private String leavetype;
    private String todate;
	private String fromdate;
    private String description;
	private String postingdate;
    private int status;
	private String empid;

    
    public String getLeaveId(){
        return leaveid;
    }

    public void setLeaveId(String leaveid){
        this.leaveid=leaveid;
    }
    
    public String getLeaveType(){
        return leavetype;
    }

    public void setLeaveType(String leavetype){
        this.leavetype=leavetype;
    }
    public String getToDate(){
        return todate;
    }
    public void setToDate(String todate){
        this.todate= todate;
    }
	 public String getFromDate(){
        return fromdate;
    }

    public void setFromDate(String fromdate){
        this.fromdate=fromdate;
    }
	 public String getDescription(){
        return description;
    }

    public void setDescription(String description){
        this.description=description;
    }
	 public String getPostingDate(){
        return postingdate;
    }

    public void setPostingDate(String postingdate){
        this.postingdate=postingdate;
    }
	 public int getStatus(){
        return status;
    }

    public void setStatus(int status){
        this.status=status;
    }
	 public String getEmpId(){
        return empid;
    }

    public void setEmpId(String empid){
        this.empid=empid;
    }
	
}