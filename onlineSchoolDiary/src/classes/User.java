package classes;

public class User {
	public int user_id;
	public String user_name;
	public int school_id;
	public int status;

	
	public User(int userId, String userName, int schoolId, int status) {
		this.user_id = userId;
		this.user_name = userName;
		this.school_id = schoolId;
		this.status = status;
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
	
	public int getStatus() {
		return status;
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
	
	public void setUserStatus(int status) {
		this.status = status;
	}
	

	
}
