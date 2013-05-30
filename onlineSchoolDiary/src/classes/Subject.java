package classes;

public class Subject {
	public int subject_id;
	public String subject_name;
	public int teacher_id;
	public int class_id;
	
	public Subject(int subjectId, String subjectName, int teacherId, int classId) {
		this.subject_id = subjectId;
		this.subject_name = subjectName;
		this.teacher_id = teacherId;
		this.class_id = classId;
	}
	
	public int getSubjectId() {
		return subject_id;
	}
	
	public String getSubjectName() {
		return subject_name;
	}
	
	public int getTeacherId() {
		return teacher_id;
	}
	
	public int getClassId() {
		return class_id;
	}
	
	
}
