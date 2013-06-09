<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Student</title>
</head>
<body>
	<form action="/onlineSchoolDiary/editStudent" method="post">
		Student: <select name="student">
			<%
				HttpSession ses = request.getSession();
				User user = (User) ses.getAttribute("user");
				int schoolId = user.getUserId();
				schoolManager sm = (schoolManager) getServletContext()
						.getAttribute("schoolmanager");
				ArrayList<Student> arr = sm.getStudents(schoolId);
				for (int i = 0; i < arr.size(); i++) {
					out.println("<option value=" + arr.get(i).getUserId() + ">"
							+ arr.get(i).getUserId() + " "
							+ arr.get(i).getUsername() + " Class: "+ arr.get(i).class_id+ "</option>");
				}
			%>
		</select> Username:<input type="text" name="username"> Password:<input
			type="password" name="password"> Fullname:<input type="text"
			name="fullname"> Class:<select name="group">
			<%
				ArrayList<Group> arr1 = sm.getClasses(schoolId);
				for (int i = 0; i < arr1.size(); i++) {
					out.println("<option value=" + arr1.get(i).getClassId() + ">"
							+ arr1.get(i).getClassId() + " "
							+ arr1.get(i).getClassName() + "</option>");
				}
			%>
		</select> <input type="submit" value="Submit">
	</form>
	
	<br>
	<a href="/onlineSchoolDiary/adminPage.jsp">Back to Admin Page</a>
</body>
</html>