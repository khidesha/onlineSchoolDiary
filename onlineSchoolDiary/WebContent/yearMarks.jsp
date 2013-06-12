

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
	Subject sm = SubjectManager.getSubject(Integer.parseInt(request
			.getParameter("subjectID")));
	HttpSession ses = request.getSession();
	User user = (User) ses.getAttribute("user");
	int studentID = user.user_id; 
	//ResultSet rs = statement.executeQuery("Select * from students where student_id = " + student_id + 
			//"and subject_id = " + subject_id );

%>

<title><%=sm.subject_name%></title>

</head>
<body>



</body>
</html>