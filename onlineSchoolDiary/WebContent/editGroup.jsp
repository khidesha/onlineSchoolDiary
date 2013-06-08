<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Group</title>
</head>
<body>
	<form action="/onlineSchoolDiary/editGroup" method="post">
		Class: <select name="group">
			<%
				HttpSession ses = request.getSession();
				User user = (User) ses.getAttribute("user");
				int schoolId = user.getUserId();
				schoolManager sm = (schoolManager) getServletContext()
						.getAttribute("schoolmanager");
				ArrayList<Group> arr = sm.getClasses(schoolId);
				for (int i = 0; i < arr.size(); i++) {
					out.println("<option value=" + arr.get(i).getClassId() + ">"
							+ arr.get(i).getClassId() + " "
							+ arr.get(i).getClassName() + "</option>");
				}
			%>
		</select> 
		Group name:<input type="text" name="groupname"> <input
			type="submit" value="Submit">
	</form>
	<br>
	<a href="/onlineSchoolDiary/adminPage.jsp">Back to Admin Page</a>
</body>
</html>