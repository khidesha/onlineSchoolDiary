package classes;

public class Mark {
	public int mark_id;
	public int subject_id;
	public int student_id;
	public int day_id;
	public String mark;
	public String comment;
	
	public Mark(int markId, int subjectId, int studentId, int dayId, String mark, String comment) {
		this.mark_id = markId;
		this.subject_id = subjectId;
		this.student_id = studentId;
		this.day_id = dayId;
		this.mark = mark;
		this.comment = comment;
	}
	
	public int getMarkId() {
		return mark_id;
	}
	
	public int getSubjectId() {
		return subject_id;
	}
	
	public int getStudentId() {
		return student_id;
	}
	
	public int getDayId() {
		return day_id;
	}
	
	public String getMark() {
		return mark;
	}
	
	public String getComment() {
		return comment;
	}
	
	public void setMark(String new_mark) {
		this.mark = new_mark;
	}
	
}
