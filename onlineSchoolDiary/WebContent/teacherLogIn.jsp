<%@page import="classes.teacherManager"%>
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
		User user = (User) ses.getAttribute("user");
		int teacherId = user.getUserId();
		teacherManager tm = (teacherManager)getServletContext().getAttribute("teachermanager");
		ArrayList<Subject> arr = tm.getSubjectes(teacherId);
		for (int i = 0; i < arr.size(); i++) {
			System.out.println(arr.get(i).subject_name);
			out.println("<b><ul><li><a href=\"groupsForLectures.jsp?subject="
					+ arr.get(i).subject_name + "\">" + arr.get(i).subject_name
					+ "</a></li></ul></b>");
		}
	%>
</body>
</html>