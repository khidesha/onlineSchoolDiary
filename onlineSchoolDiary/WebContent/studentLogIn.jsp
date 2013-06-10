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
<%@page import =" java.sql.Statement" %>
<%@page import =" java.sql.ResultSet" %>
<%@page import = "classes.Mark" %>
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
					//Date d1 = new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
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
				//	Date d = c.getTime();
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
			for(int k = 0; k<markArr.size();k++){
				Mark mark = markArr.get(k);
				int subjectId = arr.get(i).subject_id;
				if(mark.getSubjectId() == subjectId){
					markName = mark.mark;
					date = mark.mark_date;
				//	if(!(date.before(d) && date.after(d1))) date = null;
					break;
				}
			
			}
			
			if(date!=null) {
				c.setTime(date);
				dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
			}
			    int n = dayOfWeek - 2;
			    
				for (int j = 0; j < 5; j++) {
					%>
						<%if(j == n) { %> <td><% out.print(markName);%></td>
						<%} else {%> <td> </td>
					<%
						}
				}
			%>
		</tr>
		<%
			}
							
				
		
		%>

	</table>
</body>
</html>
