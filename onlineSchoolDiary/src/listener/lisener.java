package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import classes.DayCommentManager;
import classes.MarkManager;
import classes.StudentManager;
import classes.UserManager;
import classes.DBManager;
import classes.GroupManager;
import classes.SubjectManager;
import classes.schoolManager;
import classes.teacherManager;

import com.mysql.jdbc.Statement;

/**
 * Application Lifecycle Listener implementation class lisener
 *
 */
@WebListener
public class lisener implements ServletContextListener {

	
	private static final String SERVER = "localhost";
	private static final String USER_NAME = "root";
	private static final String PASSWORD = "zorba017";
	private static final String DATABASE = "projectdata";
    /**
     * Default constructor. 
     */
    public lisener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0) {

    	DBManager manager = new DBManager(SERVER, USER_NAME, PASSWORD, DATABASE);
		arg0.getServletContext().setAttribute(DBManager.DBS_MANAGER, manager);
		arg0.getServletContext().setAttribute("usermanager",
				new UserManager(manager.getStatement()));
		arg0.getServletContext().setAttribute("subjectmanager",
				new SubjectManager(manager.getStatement()));
		arg0.getServletContext().setAttribute("groupmanager",
				new GroupManager((Statement) manager.getStatement()));
		arg0.getServletContext().setAttribute("markmanager",
				new MarkManager((Statement) manager.getStatement()));
		arg0.getServletContext().setAttribute("commentmanager",
				new DayCommentManager((Statement) manager.getStatement()));
		arg0.getServletContext().setAttribute("teachermanager",
				new teacherManager((Statement) manager.getStatement()));
		arg0.getServletContext().setAttribute("schoolmanager",
				new schoolManager((Statement) manager.getStatement()));
		arg0.getServletContext().setAttribute("id_count", new Integer(1));
		
		arg0.getServletContext().setAttribute("studentmanager",
				new StudentManager((Statement) manager.getStatement()));
		
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    }
	
}
