package beans;

public class RegisterBean{
    private String empid;
    private String empname;
	private String department;
    private String position;
	private String email;
    private String password;
	private String gender;
    private String mobile;
	private String dob;
    private String address;

    public String getEid(){
        return empid;
    }

    public void setEid(String empid){
        this.empid=empid;
    }
    public String getEname(){
        return empname;
    }
    public void setEname(String empname){
        this.empname= empname;
    }
	 public String getDepartment(){
        return department;
    }

    public void setDepartment(String department){
        this.department=department;
    }
	 public String getPosition(){
        return position;
    }

    public void setPosition(String position){
        this.position=position;
    }
	 public String getEmail(){
        return email;
    }

    public void setEmail(String email){
        this.email=email;
    }
	 public String getPassword(){
        return password;
    }

    public void setPassword(String password){
        this.password=password;
    }
	 public String getGender(){
        return gender;
    }

    public void setGender(String gender){
        this.gender=gender;
    }
	 public String getMobile(){
        return mobile;
    }

    public void setMobile(String mobile){
        this.mobile=mobile;
    }
	 public String getDob(){
        return dob;
    }

    public void setDob(String dob){
        this.dob=dob;
    }
	 public String getAddress(){
        return address;
    }

    public void setAddress(String address){
        this.address=address;
    }
	 
}