package servlets;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.Sha1Hash;
import classes.User;
import classes.UserManager;

/**
 * Servlet implementation class editTeacher
 */
@WebServlet("/editTeacher")
public class EditTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTeacher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		User tmp = (User)request.getSession().getAttribute("user");
		int schoolID = tmp.getSchoolId();
		UserManager addUser = (UserManager)getServletContext().getAttribute("usermanager");
		int teacherId = Integer.parseInt(request.getParameter("teacher"));
		addUser.editUser(teacherId, name, schoolID, passwordHash, "1", fullname, 0);
		RequestDispatcher dispatch = request.getRequestDispatcher("/editTeacher.jsp");
		dispatch.forward(request, response);
	}

}
