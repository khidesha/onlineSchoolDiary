package classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

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
						+ ",\'" + fullName + "\'," + schoolId + ");");

			}
			if (userStatus == "2" && classId != 0) {
				statement.executeUpdate("Insert into students values(" + userId
						+ ",\'" + fullName + "\'," + classId + "," + schoolId
						+ ");");

			}
			statement.executeUpdate("Insert into users values(" + userId
					+ ",\'" + userName + "\',\'" + pass + "\',\'" + userStatus
					+ "\');");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean editUser(int userId, String userName, int schoolId,
			String pass, String userStatus, String fullName, int classId) {
		try {
			if (userStatus == "1") {
				statement.executeUpdate("Update teachers SET teacher_name=\'"
						+ fullName + "\' WHERE school_id=" + schoolId
						+ " and teacher_id =" + userId + ";");

			}
			if (userStatus == "2" && classId != 0) {
				statement.executeUpdate("Update students SET student_name=\'"
						+ fullName + "\' WHERE school_id=" + schoolId
						+ " and student_id =" + userId + ";");
			}
			statement.executeUpdate("Update users SET user_pass=\'"
					+ pass + "\', user_name=\'"
					+ userName + "\' WHERE user_id =" + userId + ";");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static String getUserPassword(String username){
		String res = "";
		try {
			ResultSet rs = statement.executeQuery("Select * from users where user_name = '" + username +"'");
			rs.next();
			res = rs.getString("user_pass");
		} catch (SQLException e) {
			return res;
		}
		return res;
	}
	
	public static int getUserIdWithLoginInfo(String userName, String password) {
		try {

			ResultSet set = statement
					.executeQuery("Select * from users where user_name=\'"
							+ userName + "\' and user_pass=\'" + password
							+ "\';");
			set.next();
			int id = set.getInt("user_id");
			return id;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static int getUserTupeWithLoginInfo(String userName, String password) {
		try {

			ResultSet set = statement
					.executeQuery("Select * from users where user_name="
							+ userName + " and user_pass=" + password);
			set.next();
			int type = set.getInt("user_type");
			return type;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}

	public static User getUser(int userId) {
		try {
			ResultSet set = statement
					.executeQuery("select * from users where user_id ="
							+ userId);

			set.next();
			String status = set.getString("user_type");
			if (status.equals("0")) {
				ResultSet set1 = statement
						.executeQuery("Select * from school where school_id="
								+ userId);
				set1.next();
				String name = set1.getString("school_name");
				School school = new School(userId, name, userId, 0);
				return school;
			}
			if (status.equals("1")) {
				ResultSet set1 = statement
						.executeQuery("Select * from teachers where teacher_id="
								+ userId);
				set1.next();
				String name = set1.getString("teacher_name");
				int schoolId = set1.getInt("school_id");
				Teacher teacher = new Teacher(userId, name, schoolId, 1);
				return teacher;
			}
			if (status.equals("2")) {
				ResultSet set1 = statement
						.executeQuery("Select * from students where student_id="
								+ userId);
				set1.next();
				String name = set1.getString("student_name");
				int schoolId = set1.getInt("school_id");
				int classId = set1.getInt("class_id");
				Student student = new Student(userId, name, schoolId, classId,
						2);
				return student;
			}
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static int getUserCount() {
		int count = 0;
		try {
			ResultSet set = statement
					.executeQuery("SELECT count(*) from users");
			set.next();
			count = set.getInt("count(*)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

	
	public static boolean userNameAlreadyExists(String username){
		int count = 0;
		try {
			ResultSet set = statement
					.executeQuery("SELECT count(*) from users where user_name=\'"+username+"\'");
			set.next();
			count = set.getInt("count(*)");
			if(count>0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
}
