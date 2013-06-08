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

	public boolean createGroup(String className, int classId, int schoolId) {
		try {
			statement.executeUpdate("Insert into class values( " + classId
					+ ", \'" + className + "\', " + schoolId + ");");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean editGroup(String className, int classId, int schoolId) {
			try {
				statement.executeUpdate("Update class SET class_name=\'"+className+ "\' WHERE class_id=" +classId+";");
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}

	public int getGroupId(String group_name, int subject_id) {
		try {
			ResultSet rs = statement
					.executeQuery("Select class_id from class where class_name='"
							+ group_name + ";");
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
			ResultSet rs = statement
					.executeQuery("Select student_id from students where class_id="
							+ group_id + ";");
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
			statement.executeUpdate("Update class set class_name=\'"
					+ group_name + "\' where class_id='" + group_id + "';");
			statement.executeUpdate("Update students set class_id=\'"
					+ group_id + "\' where class_id='" + group_id + "';");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void deleteGroup(int group_id) {
		try {
			statement.executeUpdate("delete from class where class_id="
					+ group_id + ";");
			statement.executeUpdate("delete from students where class_id="
					+ group_id + ";");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Group getGroup(int group_id) {
		try {

			ResultSet set = statement
					.executeQuery("Select * from class where class_id="
							+ group_id);
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

	public static ArrayList<Group> getGroupBySubject(String subjectName) {
		ArrayList<Group> groups = new ArrayList<Group>();
		try {
			ResultSet rs = statement
					.executeQuery("select c1.class_id, c1.class_name, c1.school_id from class c1 left join subjects on subjects.class_id = c1.class_id where subject_name ='"
							+ subjectName + "' order by c1.class_name");
			while (rs.next()) {
				int groupID = rs.getInt("class_id");
				String className = rs.getString("class_name");
				int schoolId = rs.getInt("school_id");
				Group gr = new Group(groupID, className, schoolId);
				groups.add(gr);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("group_size =" + groups.size());
		return groups;
	}

	public static int getGroupCount() {
		int count = 0;
		try {
			ResultSet res = statement
					.executeQuery("Select COUNT(*) from class");
			res.next();
			count = res.getInt("count(*)");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}

}
