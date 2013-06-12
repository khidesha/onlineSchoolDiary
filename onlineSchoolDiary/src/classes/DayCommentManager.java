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

		public static boolean createDayComment(String date, String com, int subjectId) {
		try {
			statement.executeUpdate("Insert into notes values(\'"
					+ date + "\',\'" + com + "\',"+ subjectId + ");");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
		
		public static boolean editDayComment(String date, String com, int subjectId) {
			try {
				statement.executeUpdate("Update notes SET note=\'" + com + "\' WHERE subject_id="
						+ subjectId + " and note_date=\'"
						+ date + "\';");
				return true;
			} catch (SQLException e) {
				e.printStackTrace();
				return false;
			}
		}

	public static boolean dayCommentAlreadyExists(int subjectID,String date) {
		int count = 0;
		try {
			ResultSet rs = statement
					.executeQuery("Select count(*) from notes where subject_id = "
							+ subjectID	+ " and note_date = \'" + date + "\';");
			rs.next();
			count = rs.getInt("count(*)");
			if (count > 0)
				return true;
			else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public static DayComment getDayComment(int subjectID, String date) {
		try {

			ResultSet set = statement.executeQuery("Select * from notes where subject_id="+subjectID+" and note_date=\'" + date + "\';");
			set.next();
			String comment = set.getString("note");
			DayComment daycom = new DayComment(date, comment, subjectID);
			return daycom;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
