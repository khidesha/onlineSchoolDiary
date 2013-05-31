package classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UserManager {

	static Statement statement;
	public UserManager(Statement statement) {
		this.statement = statement;
	}

	public boolean createUser(int userId, String userName, int schoolId,
			String pass, String userStatus, String fullName, int classId) {
		try {
			if (userStatus == "1") {
				statement.executeUpdate("Insert into teachers values(" + userId
						+ ",/'" + fullName + "/'," + schoolId + ");");

			}
			if (userStatus == "2" && classId != 0) {
				statement.executeUpdate("Insert into students values(" + userId
						+ ",/'" + fullName + "/'," + classId + "," + schoolId
						+ ");");

			}
			statement.executeUpdate("Insert into users values(" + userId
					+ ",/'" + userName + "/',/'" + pass + "/',/'" + userStatus
					+ "/');");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static User getUser(int userId) {
		try {

			ResultSet set = statement
					.executeQuery("Select * from users where user_id=" + userId);
			set.next();
			String status = set.getString("user_type");
			if(status == "0") {
				ResultSet set1 = statement.executeQuery("Select * from school where school_id=" + userId);
				String name = set1.getString("school_name");
				School school = new School(userId, name, userId);
				return school;
			}
			if(status == "1") {
				ResultSet set1 = statement.executeQuery("Select * from teachers where teacher_id=" + userId);
				String name = set1.getString("teacher_name");
				int schoolId = set1.getInt("school_id");
				Teacher teacher = new Teacher(userId, name, schoolId);
				return teacher;
			}
			if(status == "2") {
				ResultSet set1 = statement.executeQuery("Select * from studentes where student_id=" + userId);
				String name = set1.getString("student_name");
				int schoolId = set1.getInt("school_id");
				int classId = set1.getInt("class_id");
				Student student = new Student(userId, name, schoolId, classId);
				return student;
			}
			return null;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
