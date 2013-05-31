package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.GroupManager;
import classes.User;
import classes.UserManager;

/**
 * Servlet implementation class addTeacher
 */
@WebServlet("/addTeacher")
public class addTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addTeacher() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		User tmp = (User)request.getAttribute("user");
		int schoolID = tmp.getSchoolId();
		UserManager addUser = (UserManager)getServletContext().getAttribute("usermanager");
		GroupManager groupCount = (GroupManager)getServletContext().getAttribute("groupmanager");
		int countID = (Integer)getServletContext().getAttribute("id_count");
		addUser.createUser(countID, name, schoolID, password, "1", fullname, 0);
		countID ++;
		getServletContext().setAttribute("id_count", countID);
		RequestDispatcher dispatch = request.getRequestDispatcher("/addTeacher.jsp");
		dispatch.forward(request, response);
	}

}
