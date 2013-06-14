package classes;

import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;

public class Mark{
	private int mark_id;
	private int subject_id;
	private int student_id;
	private Date mark_date;
	private int mark;
	private String comment;
	
	public Mark(int markId, int subjectId, int studentId, Date markDate, int mark, String comment) {
		this.mark_id = markId;
		this.subject_id = subjectId;
		this.student_id = studentId;
		this.mark_date = markDate;
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
	
	public Date getMarkDate() {
		return  mark_date;
	}
	
	public int getMark() {
		return mark;
	}
	
	public String getComment() {
		return comment;
	}
	
	public void setMark(int new_mark) {
		this.mark = new_mark;
	}
}
