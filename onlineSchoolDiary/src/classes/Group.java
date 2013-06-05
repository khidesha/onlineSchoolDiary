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
	
	public int getClassId(){
		return classId;
	}
	
	
	public String getClassName(){
		return className;
	}
	
	public int getSchoolId(){
		return schoolId;
	}
}
