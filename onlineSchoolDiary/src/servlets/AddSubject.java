package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.Subject;
import classes.SubjectManager;
import classes.User;

/**
 * Servlet implementation class addSubject
 */
@WebServlet("/addSubject")
public class AddSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSubject() {
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
		String subjectName = request.getParameter("subject");
		int teacherID = Integer.parseInt(request.getParameter("teacherID"));
		int groupID = Integer.parseInt(request.getParameter("groupID"));
		SubjectManager subject = (SubjectManager)getServletContext().getAttribute("subjectmanager");
		int subjectID = SubjectManager.getMaxID() + 1;
		User tmp = (User)request.getSession().getAttribute("user");
		int schoolID = tmp.getSchoolId();
		subject.createSubject(subjectID, subjectName, teacherID, groupID,schoolID);
		RequestDispatcher dispatch = request.getRequestDispatcher("/addSubject.jsp");
		dispatch.forward(request, response);
	}

}
