package classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.print.attribute.HashAttributeSet;

public class TeacherManager {
	static Statement statement;

	public TeacherManager(Statement statement) {
		this.statement = statement;
	}


	public static ArrayList<Subject> getSubjectes(int teacherId) {
		try {
			ArrayList<Subject> arr = new ArrayList<Subject>();
			Set<String> subjects = new HashSet<String>();
			int subjectId;
			int classId;
			String subjectName;
			Subject subject;
			int schoolId;
			ResultSet set = statement.executeQuery("Select * from subjects where teacher_id=" + teacherId);
			while (set.next()) {
				subjectId = set.getInt("subject_id");
				classId = set.getInt("class_id");
				subjectName = set.getString("subject_name");
				schoolId = set.getInt("school_id");
				subject = new Subject(subjectId, subjectName, teacherId, classId,schoolId);
				if(!subjects.contains(subjectName)){
					arr.add(subject);
					subjects.add(subjectName);
				}
			}
			return arr;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
