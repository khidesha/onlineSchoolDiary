package classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class schoolManager {
	static Statement statement;

	public schoolManager(Statement statement) {
		this.statement = statement;
	}


	public static ArrayList<Group> getClasses(int schoolId) {
		try {
			ArrayList<Group> arr = new ArrayList<Group>();
			int classId;
			String className;
			Group group;
			ResultSet set = statement.executeQuery("Select * from class where school_id=" + schoolId);
			while (set.next()) {
				classId = set.getInt("class_id");
				className = set.getString("class_name");
				group = new Group(classId, className, schoolId);
				arr.add(group);
			}
			return arr;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static ArrayList<Teacher> getTeachers(int schoolId) {
		try {
			ArrayList<Teacher> arr = new ArrayList<Teacher>();
			int teacherId;
			String teacherName;
			Teacher teacher;
			ResultSet set = statement.executeQuery("Select * from teachers where school_id=" + schoolId);
			while (set.next()) {
				teacherId = set.getInt("teacher_id");
				teacherName = set.getString("teacher_name");
				teacher = new Teacher(teacherId, teacherName, schoolId,1);
				arr.add(teacher);
			}
			return arr;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static ArrayList<Student> getStudents(int schoolId) {
		try {
			ArrayList<Student> arr = new ArrayList<Student>();
			int studentId;
			int classId;
			String studentName;
			Student student;
			ResultSet set = statement.executeQuery("Select * from students where school_id=" + schoolId);
			while (set.next()) {
				studentId = set.getInt("student_id");
				classId = set.getInt("class_id");
				studentName = set.getString("student_name");
				student = new Student(studentId, studentName,schoolId, classId,2);
				arr.add(student);
			}
			return arr;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static ArrayList<Subject> getSubjects(int schoolId) {
		try {
			ArrayList<Subject> arr = new ArrayList<Subject>();
			int subjectId;
			int classId;
			String subjectName;
			int teacherId;
			Subject subject;
			ResultSet set = statement.executeQuery("Select * from subjects where school_id=" + schoolId);
			while (set.next()) {
				subjectId = set.getInt("subject_id");
				classId = set.getInt("class_id");
				teacherId = set.getInt("teacher_id");
				subjectName = set.getString("subject_name");
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
