
package beans;
public class LeaveTypeBean {
    
    private int leavetypeId;
    private String leavetypeName;
    private String creation_date;

    public int getLeaveTypeId(){
        return  leavetypeId;
    }

    public void setLeaveTypeId(int  leavetypeId){
        this. leavetypeId= leavetypeId;
    }
    public String getLeaveTypeName(){
        return  leavetypeName;
    }
    public void setLeaveTypeName(String leavetypeName){
        this.leavetypeName=leavetypeName;
    }
    public String getCreationDate(){
        return  creation_date;
    }
    public void setCreationDate(String creation_date){
        this.creation_date=creation_date;
    }
}