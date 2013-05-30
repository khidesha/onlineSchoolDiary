package classes;

public class User {
	public int user_id;
	public String user_name;
	public int school_id;
	public String user_status;
	public String password;
	
	public User(int userId, String userName, int schoolId, String pass, String userStatus) {
		this.user_id = userId;
		this.user_name = userName;
		this.school_id = schoolId;
		this.user_status = userStatus;
		this.password = pass;
	}
	
	public int getUserId() {
		return user_id;
	}
	
	public String getUsername() {
		return user_name;
	}
	
	public int getSchoolId() {
		return school_id;
	}
	
	public String getPassword() {
		return password;
	}
	
	public String getUserStatus() {
		return user_status;
	}
	
	public void setPassword(String pass) {
		this.password = pass;
	}
	
	public void setUserStatus(String status) {
		this.user_status = status;
	}
	
	public void setUserId(int userId) {
		this.user_id = userId;
	}
	
	public void setUserName(String userName) {
		this.user_name = userName;
	}
	
	public void setSchoolId(int schoolId) {
		this.school_id = schoolId;
	}
	
	
}
