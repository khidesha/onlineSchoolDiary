package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.Sha1Hash;
import classes.User;
import classes.UserManager;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String username = request.getParameter("userName");
		String password = request.getParameter("pass");
		String passwordHash = "";
		try {
			passwordHash = Sha1Hash.SHA1(password);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		UserManager userMan =  (UserManager)getServletContext().getAttribute("usermanager");
		String userPassword = UserManager.getUserPassword(username);
		if(userPassword.equals(passwordHash)){
			User user = userMan.getUser(userMan.getUserIdWithLoginInfo(username, passwordHash));
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			if(user.getStatus() == 0){
				RequestDispatcher dispatch = request
						.getRequestDispatcher("adminPage.jsp");
				dispatch.forward(request, response);
			}
			if(user.getStatus() == 1){
				RequestDispatcher dispatch = request
						.getRequestDispatcher("teacherLogIn.jsp");
				dispatch.forward(request, response);
			}
			if(user.getStatus() == 2){
				RequestDispatcher dispatch = request
						.getRequestDispatcher("studentLogIn.jsp");
				dispatch.forward(request, response);
			}
		}else{
			RequestDispatcher dispatch = request
					.getRequestDispatcher("login.jsp?error=1");
			dispatch.forward(request, response);
		}
	}
		

}
