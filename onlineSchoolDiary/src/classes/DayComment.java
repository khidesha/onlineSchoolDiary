package classes;

import java.sql.Date;

public class DayComment {
	public Date date;
	public String comment;
	public int subject_id;
	
	public DayComment(Date date, String com, int subjectId) {
		this.date = date;
		this.comment = com;
		this.subject_id = subjectId;
	}
	
	public Date getDate() {
		return date;
	}
	
	public String getComment() {
		return comment;
	}
	
	public int getSubjectId() {
		return subject_id;
	}
	
}