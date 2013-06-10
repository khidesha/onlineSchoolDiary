package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.GroupManager;
import classes.MarkManager;

/**
 * Servlet implementation class updateMarks
 */
@WebServlet("/updateMarks")
public class updateMarks extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateMarks() {
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
		int groupID = (Integer)request.getSession().getAttribute("groupID");
		GroupManager grManager = (GroupManager)request.getServletContext().getAttribute("groupmanager");
		MarkManager markManager = (MarkManager)request.getServletContext().getAttribute("markmanager");
		int mark;
		for(int i: grManager.getStundetsOfGroup(groupID)){
			mark = Integer.parseInt(request.getParameter(Integer.toString(i)));
		}
	}

}
