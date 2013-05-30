package user;

import java.util.ArrayList;

public class Class {
	public int class_id;
	public String class_name;
	public ArrayList<Student> student_list;
	
	public Class(int classId, String className) {
		this.class_id = classId;
		this.class_name = className;
		////////////  listis shekmna
	}
	
	//// es ar vici zustad sachiroa tu ara
	/*public ArrayList<Student> getStudentList() {
		return student_list;
	}*/
	
	
	public int getClassId() {
		return class_id;
	}
	
	public String getClassName() {
		return class_name;
	}
	
	
}
