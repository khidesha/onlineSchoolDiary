package classes;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DayCommentManager {

	static Statement statement;

	public DayCommentManager(Statement statement) {
		this.statement = statement;
	}

		public boolean createDayComment(Date date, String com, int subjectId) {
		try {
			statement.executeUpdate("Insert notes into  values("
					+ date + ",/'" + com + "/',"+ subjectId + ");");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public void deleteGroup(Date date) {
		try {
			statement.executeUpdate("delete from notes where note_date=" + date + ";");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static DayComment getGroup(Date date) {
		try {

			ResultSet set = statement.executeQuery("Select * from notes where note_date=" + date);
			set.next();
			String comment = set.getString("note");
			int subjectId = set.getInt("subject_id");
			DayComment daycom = new DayComment(date, comment, subjectId);
			return daycom;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
