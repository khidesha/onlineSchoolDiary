package classes;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class StudentManager {
	static Statement statement;

	public StudentManager(Statement statement) {
		this.statement = statement;
	}


	public static ArrayList<Subject> getSubjectes(int classId) {
		try {
			ArrayList<Subject> arr = new ArrayList<Subject>();
			int subjectId;
			int teacherId;
			String subjectName;
			Subject subject;
			int schoolId;
			ResultSet set = statement.executeQuery("Select * from subjects where class_id=" + classId);
			while (set.next()) {
				subjectId = set.getInt("subject_id");
				subjectName = set.getString("subject_name");
				teacherId = set.getInt("teacher_id");
				schoolId = set.getInt("school_id");
				subject = new Subject(subjectId, subjectName, teacherId, classId,schoolId);
				arr.add(subject);
			}
			return arr;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static ArrayList<Mark> getMarks(int studentId) {
		try {
			ArrayList<Mark> markArr = new ArrayList<Mark>();
			int subjectId;
			int markId;
			int markName;
			Date date; 
			String comm;
			Mark mark;
			ResultSet set = statement.executeQuery("Select * from mark where student_id =" + studentId);
			
			while (set.next()) {
				subjectId = set.getInt("subject_id");
				markName = set.getInt("mark");
				markId = set.getInt("mark_id");
				date = set.getDate("mark_date");
				comm = set.getString("mark_comment");
				mark = new Mark(markId, subjectId, studentId, date, markName, comm);
				markArr.add(mark);
			}
			return markArr;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	
}
