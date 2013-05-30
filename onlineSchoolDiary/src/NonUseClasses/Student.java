package user;

public class Student extends User {
	public int class_id;
	
	public Student(int userId, String userName, int schoolId, int classId) {
		super(userId, userName, schoolId);
		this.class_id = classId;
	}
	
	public int getClassId() {
		return class_id;
	}
	
	
}