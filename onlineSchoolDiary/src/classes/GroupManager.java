package classes;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class GroupManager {

	static Statement statement;

	public GroupManager(Statement statement) {
		this.statement = statement;
	}

		public boolean createGroup(String className, int classId) {
		try {
			statement.executeUpdate("Insert into class values("
					+ classId + "," + className + ");");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	
	public int getGroupId(String group_name, int subject_id) {
		try {
			ResultSet rs = statement.executeQuery("Select class_id from class where class_name='" + group_name
					+ ";");
			if (rs.next())
				return rs.getInt("group_id");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}




	public static ArrayList<Integer> getStundetsOfGroup(int group_id) {
		ArrayList<Integer> arr = new ArrayList<Integer>();
		try {
			ResultSet rs = statement.executeQuery("Select student_id from students where class_id=" + group_id + ";");
			while (rs.next()) {
				arr.add(rs.getInt("student_id"));
			}
			return arr;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return arr;
	}

	public void renameGroup(int group_id, String group_name) {
		try {
			statement.executeUpdate("Update class set class_name=\'" + group_name + "\' where class_id='"
					+ group_id + "';");
			statement.executeUpdate("Update students set class_id=\'" + group_id + "\' where class_id='"
					+ group_id + "';");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteGroup(int group_id) {
		try {
			statement.executeUpdate("delete from class where class_id=" + group_id + ";");
			statement.executeUpdate("delete from students where class_id=" + group_id + ";");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Group getGroup(int group_id) {
		try {

			ResultSet set = statement.executeQuery("Select * from class where group_id=" + group_id);
			set.next();
			String className = set.getString("class_name");
			int schoolId = set.getInt("school_id");
			Group group = new Group(group_id, className, schoolId);
			return group;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static int getGroupCount(int schoolID){
		int count = 0;
		try {
			ResultSet res = statement.executeQuery("Select COUNT(*) from class where school_id = "+ schoolID);
			count = res.getInt("count(*)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

}
