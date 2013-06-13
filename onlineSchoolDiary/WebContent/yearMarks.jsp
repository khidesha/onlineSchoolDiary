

<%@page import="classes.DayComment"%>
<%@page import="classes.StudentManager"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="classes.Student"%>
<%@page import="java.util.Date"%>
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


<%
	Subject sb = SubjectManager.getSubject(Integer.parseInt(request
			.getParameter("subjectID")));
	HttpSession ses = request.getSession();
	User user = (User) ses.getAttribute("user");
	int studentId = user.user_id; 
	StudentManager st = (StudentManager) getServletContext()
			.getAttribute("studentmanager");
	ArrayList<Mark> ar = st.getSubjectMarks(studentId, sb.getSubjectId());
	%>
	<table border="8">


		<tr>
			<td>Subject</td>
	<% 
	for(int i = 0; i < ar.size(); i++) { %>
		<td> <%out.println(new SimpleDateFormat("yyyy-MM-dd").format(ar.get(i).mark_date));%></td>
		<% 	
	}%>
	</tr>
	<tr>
	<td><%out.println(sb.getSubjectName()); %></td>
	<%for(int i = 0; i < ar.size(); i++) { %>
		<td><%out.print(ar.get(i).getMark());%></td>
		<% }
%>
	</tr>
<title><%=sb.subject_name%></title>

</head>
<body>



</body>
</html>