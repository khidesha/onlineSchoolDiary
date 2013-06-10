package classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class StudentManager {
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
	
	public static ArrayList<Subject> getMarks(int classId) {
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

}
