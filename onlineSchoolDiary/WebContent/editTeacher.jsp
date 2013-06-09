<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="classes.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Teacher</title>
</head>
<body>
	<form action="/onlineSchoolDiary/editTeacher" method="post">
		Teacher: <select name="teacher">
			<%
				HttpSession ses = request.getSession();
				User user = (User) ses.getAttribute("user");
				int schoolId = user.getUserId();
				schoolManager sm = (schoolManager) getServletContext()
						.getAttribute("schoolmanager");
				ArrayList<Teacher> arr = sm.getTeachers(schoolId);
				for (int i = 0; i < arr.size(); i++) {
					out.println("<option value=" + arr.get(i).getUserId() + ">"
							+ arr.get(i).getUserId() + " "
							+ arr.get(i).getUsername() + "</option>");
				}
			%>
		</select>Username:<input type="text" name="username">
		Password:<input type="password" name="password">
		Fullname:<input type="text" name="fullname">
		<input type="submit" value="Submit">
	</form>
	
	<br>
	<a href="/onlineSchoolDiary/adminPage.jsp">Back to Admin Page</a>
</body>
</html>