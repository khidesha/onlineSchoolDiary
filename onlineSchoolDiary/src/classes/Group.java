package classes;

public class Group {
	private int classId;
	private String className;
	private int schoolId;
	public Group(int class_id, String className, int schoolId) {
		this.classId = class_id;
		this.className = className;
		this.schoolId = schoolId;
	}
	
	int getClassId(){
		return classId;
	}
	
	
	String getClassName(){
		return className;
	}
	
	int getSchoolId(){
		return schoolId;
	}
}
