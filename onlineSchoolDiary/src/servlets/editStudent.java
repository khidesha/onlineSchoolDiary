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
 * Servlet implementation class editStudent
 */
@WebServlet("/editStudent")
public class editStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editStudent() {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String fullname = request.getParameter("fullname");
		int group = Integer.parseInt(request.getParameter("group"));
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
		int studentId = Integer.parseInt(request.getParameter("student"));
		addUser.editUser(studentId, username, schoolID, passwordHash, "2", fullname, group);		
		RequestDispatcher dispatch = request.getRequestDispatcher("/editStudent.jsp");
		dispatch.forward(request, response);
	}

}
