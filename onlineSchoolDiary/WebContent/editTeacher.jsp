<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="classes.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Teacher</title>
<link rel="stylesheet" type="text/css" href="form.css" />
</head>
<body>
	<form action="/onlineSchoolDiary/editTeacher" method="post">
		მასწავლებელი: 
		<br>
		<select name="teacher">
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
		</select>
		<br>
		მომხმარებელი:<input class="input" type="text" name="username">
		პაროლი:<input class="input" type="password" name="password">
		სახელი და გვარი:<input class="input" type="text" name="fullname">
		<input type="submit" class="input" value="Submit">
	</form>
	
	<br>
</body>
</html>