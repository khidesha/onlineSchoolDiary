package servlets;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.GroupManager;
import classes.Sha1Hash;
import classes.User;
import classes.UserManager;

/**
 * Servlet implementation class addTeacher
 */
@WebServlet("/addTeacher")
public class AddTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddTeacher() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		String passwordHash = "";
		try {
			passwordHash = Sha1Hash.SHA1(password);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		User tmp = (User) request.getSession().getAttribute("user");
		int schoolID = tmp.getSchoolId();
		UserManager addUser = (UserManager) getServletContext().getAttribute(
				"usermanager");
		int countID = UserManager.getUserCount() + 1;
		if (UserManager.userNameAlreadyExists(name)) {
		} else {
			addUser.createUser(countID, name, schoolID, passwordHash, "1",
					fullname, 0);
			RequestDispatcher dispatch = request
					.getRequestDispatcher("/addTeacher.jsp");
			dispatch.forward(request, response);
		}
	}

}
