package classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class SubjectManager {

	static Statement statement;

	public SubjectManager(Statement statement) {
		this.statement = statement;
	}

	public boolean createSubject(int subjectId, String subjectName,
			int teacherId, int classId, int schoolId) {
		try {
			statement.executeUpdate("Insert into subjects values(" + subjectId
					+ ",\'" + subjectName + "\'," + teacherId + "," + classId
					+ "," + schoolId + ");");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean editSubject(int subjectId, String subjectName,
			int teacherId, int classId, int schoolId) {
		try {
			statement.executeUpdate("Update subjects SET subject_name=\'"
					+ subjectName + "\',teacher_id="
					+ teacherId + ",class_id="
					+ classId + " WHERE subject_id=" + subjectId + ";");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public void deleteSubject(int subjectId) {
		try {
			statement.executeUpdate("delete from subjects where subject_id="
					+ subjectId + ";");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Subject getSubject(int subjectId) {
		try {
			ResultSet set = statement
					.executeQuery("Select * from subjects where subject_id="
							+ subjectId);
			set.next();
			String subjectName = set.getString("subject_name");
			int teacherId = set.getInt("teacher_id");
			int classId = set.getInt("class_id");
			int schoolId = set.getInt("school_id");
			Subject subject = new Subject(subjectId, subjectName, teacherId,
					classId, schoolId);
			return subject;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static int getSubjectCount() {
		int count = 0;
		try {
			ResultSet set = statement
					.executeQuery("Select count(*) from subjects");
			set.next();
			count = set.getInt("count(*)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	

	public static int getMaxID(){
		int max = 0;
		try {
			ResultSet rs = statement.executeQuery("Select MAX(subject_id) as subject_id from subjects;");
			rs.next();
			max = rs.getInt("subject_id");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return max;
	}


}
