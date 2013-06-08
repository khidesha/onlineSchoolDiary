package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.GroupManager;
import classes.User;

/**
 * Servlet implementation class editGroup
 */
@WebServlet("/editGroup")
public class editGroup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editGroup() {
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
		String groupName = request.getParameter("groupname");
		int groupID = Integer.parseInt(request.getParameter("group"));
		User tmp = (User)request.getSession().getAttribute("user");
		int schoolID = tmp.getSchoolId();
		GroupManager grManager = (GroupManager)getServletContext().getAttribute("groupmanager");
		grManager.editGroup(groupName, groupID, schoolID);
		RequestDispatcher dispatch = request.getRequestDispatcher("/editGroup.jsp");
		dispatch.forward(request, response);
	}

}
