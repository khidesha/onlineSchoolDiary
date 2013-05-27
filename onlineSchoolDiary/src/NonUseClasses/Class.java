package NonUseClasses;

public class Class {
	private int classId;
	private String className;

	public Class(int class_id, String className) {
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
