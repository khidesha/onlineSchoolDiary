package classes;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;

public class StudentManager{
	static Statement statement;

	public StudentManager(Statement statement) {
		this.statement = statement;
	}
	
	public static Student getStudent(int student_id){
		try {
			ResultSet rs = statement.executeQuery("Select * from students where student_id = " + student_id);
			rs.next();
			int studentID = rs.getInt("student_id");
			String studentName = rs.getString("student_name");
			int classID = rs.getInt("class_id");
			int schoolID = rs.getInt("class_id");
			return (new Student(studentID, studentName, schoolID, classID, 2));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
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
	
	public static ArrayList<DayComment> getNotes(int subjectId) {
		try {
			ArrayList<DayComment> noteArr = new ArrayList<DayComment>();
			Date date; 
			String homework;
			DayComment note;
			ResultSet set = statement.executeQuery("Select * from notes where subject_id =" + subjectId);
			
			while (set.next()) {
				subjectId = set.getInt("subject_id");
				date = set.getDate("note_date");
				String dt = new SimpleDateFormat("yyyy-MM-dd")
				.format(date);
				homework = set.getString("note");
				note = new DayComment(dt, homework, subjectId);	
				noteArr.add(note);
			}
			return noteArr;
			
		} catch (SQLException e) {
			System.out.println("aaaaaaaaaaaa");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static ArrayList<Mark> getSubjectMarks(int studentId, int subId) {
		try {
			ArrayList<Mark> markArr = new ArrayList<Mark>();
			int markId;
			int subjectId;
			int markName;
			Date date; 
			String comm;
			Mark mark;
			ResultSet set = statement.executeQuery("Select * from mark where student_id =" + studentId);
			while (set.next()) {
				subjectId = set.getInt("subject_id");
				if(subjectId == subId) {
					markName = set.getInt("mark");
					markId = set.getInt("mark_id");
					date = set.getDate("mark_date");
					comm = set.getString("mark_comment");
					mark = new Mark(markId, subjectId, studentId, date, markName, comm);
					markArr.add(mark);
				}
			}
			return markArr;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
