package classes;

import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class MarkManager {

	static Statement statement;

	public MarkManager(Statement statement) {
		this.statement = statement;
	}

	public boolean createMark(int markId, int subjectId, int studentId,
			String markDay, int mark, String comment) {
		try {
			statement.executeUpdate("Insert into mark values(" + markId + ","
					+ subjectId + "," + studentId + ", \'" + markDay + "\',"
					+ mark + ",\'" + comment + "\');");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean editMark(int markId, int subjectId, int studentId,
			String markDay, int mark, String comment) {
		try {
			statement.executeUpdate("Update mark SET mark=" + mark
					+ ", mark_comment=\'" + comment + "\' WHERE subject_id="
					+ subjectId + " and mark_id=" + markId + " and mark_date=\'"
					+ markDay + "\';");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public static boolean markAlreadyExists(int subjectID, int studentID,
			String date) {
		int count = 0;
		try {
			ResultSet rs = statement
					.executeQuery("Select count(*) from mark where subject_id = "
							+ subjectID
							+ " and student_id = "
							+ studentID
							+ " and mark_date = \'" + date + "\';");
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

	public static Mark getMarkByDate(int subjectID, int studentID, String date) {
		try {
			ResultSet rs = statement
					.executeQuery("Select * from mark where subject_id = "
							+ subjectID + " and student_id = " + studentID
							+ " and mark_date = \'" + date + "\'");
			rs.next();
			int markID = rs.getInt("mark_id");
			int mark = rs.getInt("mark");
			String comment = rs.getString("mark_comment");
			Date markDate = rs.getDate("mark_date");
			Mark m = new Mark(markID, subjectID, studentID, markDate, mark, comment);
			return m;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public void deleteMark(int markId) {
		try {
			statement.executeUpdate("delete from mark where mark_id=" + markId
					+ ";");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Mark getMark(int markId) {
		try {
			ResultSet set = statement
					.executeQuery("Select * from mark where mark_id=" + markId);
			set.next();
			int subjectId = set.getInt("subject_id");
			int studentId = set.getInt("student_id");
			Date date = set.getDate("mark_date");
			int score = set.getInt("mark");
			String comment = set.getString("mark_comment");
			Mark mark = new Mark(markId, subjectId, studentId, date, score,
					comment);
			return mark;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static int getMarkID() {
		int mark = 0;
		try {
			ResultSet rs = statement.executeQuery("Select count(*) from mark");
			rs.next();
			mark = rs.getInt("count(*)") + 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mark;
	}
}
