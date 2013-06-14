package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.SubjectManager;
import classes.User;

/**
 * Servlet implementation class editSubject
 */
@WebServlet("/editSubject")
public class EditSubject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditSubject() {
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
		String subjectName = request.getParameter("subjectName");
		int teacherID = Integer.parseInt(request.getParameter("teacherID"));
		int groupID = Integer.parseInt(request.getParameter("groupID"));
		SubjectManager subject = (SubjectManager)getServletContext().getAttribute("subjectmanager");
		int subjectID = Integer.parseInt(request.getParameter("subject"));
		User tmp = (User)request.getSession().getAttribute("user");
		int schoolID = tmp.getSchoolId();
		subject.editSubject(subjectID, subjectName, teacherID, groupID,schoolID);
		RequestDispatcher dispatch = request.getRequestDispatcher("/editSubject.jsp");
		dispatch.forward(request, response);
	}

}
