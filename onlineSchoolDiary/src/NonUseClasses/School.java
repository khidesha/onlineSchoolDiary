package user;

public class School {
	public int school_id;
	public String school_name;
	public int administrator_id;
	
	public School(int schoolId, String schoolName, int administratorId) {
		this.school_id = schoolId;
		this.school_name = schoolName;
		this.administrator_id = administratorId;
	}
	
	public int getSchoolId() {
		return school_id;
	}
	
	public String getSchoolName() {
		return school_name;
	}
	
	public int getAdministratorId() {
		return administrator_id;
	}
}
