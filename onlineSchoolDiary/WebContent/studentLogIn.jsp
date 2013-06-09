<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="classes.Student"%>
<%@page import="java.sql.Date"%>
<%@page import="classes.teacherManager"%>
<%@page import="classes.StudentManager"%>
<%@page import="classes.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.DBManager"%>
<%@page import="classes.User"%>
<%@page import="classes.SubjectManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Subjects:</h1>
	<%
		HttpSession ses = request.getSession();
		Student student = (Student) ses.getAttribute("user");
		int classId = student.getClassId();
		StudentManager sm = (StudentManager) getServletContext()
				.getAttribute("studentmanager");
		ArrayList<Subject> arr = sm.getSubjectes(classId);
		//		for (int i = 0; i < arr.size(); i++) {
		//			System.out.println(arr.get(i).subject_name);
		//			out.println("<b><ul><li><a href=\"groupsForLectures.jsp?subject="
		//					+ arr.get(i).subject_name
		//					+ "\">"
		//					+ arr.get(i).subject_name + "</a></li></ul></b>");
		//		}
		String tmp = new SimpleDateFormat("dd/MM/yyyy").format(Calendar
				.getInstance().getTime());
		Calendar c = Calendar.getInstance();
	%>
	<table border="8">


		<tr>
			<td></td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
					out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
				%>
			</td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.TUESDAY);
					out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
				%>
			</td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.WEDNESDAY);
					out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
				%>
			</td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY);
					out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
				%>
			</td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
					out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
				%>
			</td>
		</tr>
		<%
			for (int i = 0; i < arr.size(); i++) {
		%>
		<tr>
			<a href="url">
			<td>
				<%
					out.println(arr.get(i).subject_name);
				%> </a>
			</td>
			<%
				for (int j = 0; j < 5; j++) {
			%>
			<td></td>
			<%
				}
			%>
		</tr>
		<%
			}
		%>

	</table>
</body>
</html>