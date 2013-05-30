package classes;

public class Group {
	private int classId;
	private String className;

	public Group(int class_id, String className) {
		this.classId = class_id;
		this.className = className;
	}
	
	int getClassId(){
		return classId;
	}
	
	
	String getClassName(){
		return className;
	}
	
	
}
