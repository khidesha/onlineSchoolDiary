package classes;

public class Student extends User {
	private int class_id;
	
	public Student(int userId, String userName, int schoolId, int classId, int status) {
		super(userId, userName, schoolId, status);
		this.class_id = classId;
	}
	
	public int getClassId() {
		return class_id;
	}
}