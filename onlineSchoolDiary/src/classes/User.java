package classes;

public class User {
	public int user_id;
	public String user_name;
	public int school_id;
	
	public User(int userId, String userName, int schoolId) {
		this.user_id = userId;
		this.user_name = userName;
		this.school_id = schoolId;
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
	
	
}
