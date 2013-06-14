package classes;

import java.sql.Date;

public class DayComment {
	private String date;
	private String comment;
	private int subject_id;
	
	public DayComment(String date, String com, int subjectId) {
		this.date = date;
		this.comment = com;
		this.subject_id = subjectId;
	}
	
	public String getDate() {
		return date;
	}
	
	public String getComment() {
		return comment;
	}
	
	public int getSubjectId() {
		return subject_id;
	}
	
}