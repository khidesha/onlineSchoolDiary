package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DBManager {
	public static final String DBS_MANAGER = "DBSmanager";
	private Connection connection;
	
	
	public DBManager(String server, String username, String password,String database) {
		connectToDatabase(server, username, password, database);	
	}

	/**
	 * Makes connection to database based on given parameters. TableModel uses
	 * this database to get data.
	 * 
	 * @param server
	 *            server name(String)
	 * @param username
	 *            database account number(String)
	 * @param password
	 *            database account password(String)
	 * @param database
	 *            database to connect with(String)
	 */
	private void connectToDatabase(String server, String username,String password, String database) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://"
					+ server, username, password);
			Statement statement = connection.createStatement();
			statement.executeQuery("USE " + database);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * creates and returns new {@link Statement}
	 * @return
	 */
	public Statement getStatement(){
		try {
			return connection.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}