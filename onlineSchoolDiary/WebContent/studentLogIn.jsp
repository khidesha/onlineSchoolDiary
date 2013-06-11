<%@page import="classes.StudentManager"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="classes.Student"%>
<%@page import="java.sql.Date"%>
<%@page import="classes.teacherManager"%>
<%@page import="classes.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.DBManager"%>
<%@page import="classes.User"%>
<%@page import="classes.SubjectManager"%>
<%@page import=" java.sql.Statement"%>
<%@page import=" java.sql.ResultSet"%>
<%@page import="classes.Mark"%>
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
		String tmp = new SimpleDateFormat("dd/MM/yyyy").format(Calendar
				.getInstance().getTime());
		Calendar c = Calendar.getInstance();

		int studentId = student.getUserId();
		ArrayList<Mark> markArr = sm.getMarks(studentId);
		//markArr =
	%>
	<table border="8">


		<tr>
			<td></td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
					out.println(new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()));
					String monday = new SimpleDateFormat("yyyy-MM-dd").format(c
							.getTime());
				%>
			</td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.TUESDAY);
					out.println(new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()));
				%>
			</td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.WEDNESDAY);
					out.println(new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()));
				%>
			</td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY);
					out.println(new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()));
				%>
			</td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
					out.println(new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()));
					String friday = new SimpleDateFormat("yyyy-MM-dd").format(c
							.getTime());
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
					%>
			
			</a>
			</td>
			<%
				Date date = null;
					int markName = -1;
					int dayOfWeek = -1;
					String note = "";
					ArrayList<Mark> subjectMark = new ArrayList();
					for (int k = 0; k < markArr.size(); k++) {
						Mark mark = markArr.get(k);
						int subjectId = arr.get(i).subject_id;
						if (mark.getSubjectId() == subjectId) {
							date = mark.mark_date;
							String markDate = new SimpleDateFormat("yyyy-MM-dd")
									.format(date);
							if (((markDate.compareTo(monday) >= 0) && (markDate
									.compareTo(friday) <= 0))) {
								subjectMark.add(mark);
							} else {
								date = null;
							}
						}

					}

					if (subjectMark.size() == 0) {
						for (int j = 0; j < 5; j++) {
			%>
			<td></td>
			<%
				}
					} else {
						for (int m = 0; m < subjectMark.size(); m++) {
							Mark mark1 = subjectMark.get(m);
							markName = mark1.mark;
							note = mark1.comment;
							date = mark1.mark_date;
							if (date != null) {
								c.setTime(date);
								dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
							}
							int n = dayOfWeek - 2;

							for (int j = 0; j < 5; j++) {
			%>
			<%
				if (j == n) {
			%>
			<td>
				<%
					out.print(markName + " (" + note + ") ");
				%>
			</td>
			<%
				} else {
			%>
			<td></td>
			<%
				}
							}
			%>
		</tr>
		<%
			}
				}
			}
		%>

	</table>
</body>
</html>
