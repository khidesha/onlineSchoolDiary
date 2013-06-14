<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Group</title>
<link rel="stylesheet" type="text/css" href="form.css" />
</head>
<body>
	<form action="/onlineSchoolDiary/editGroup" method="post">
		კლასი: <br> <select class="select" name="group">
			<%
				HttpSession ses = request.getSession();
					User user = (User) ses.getAttribute("user");
					int schoolId = user.getUserId();
					SchoolManager sm = (SchoolManager) getServletContext()
							.getAttribute("schoolmanager");
					ArrayList<Group> arr = sm.getClasses(schoolId);
					for (int i = 0; i < arr.size(); i++) {
						out.println("<option value=" + arr.get(i).getClassId() + ">"
								+ arr.get(i).getClassId() + " "
								+ arr.get(i).getClassName() + "</option>");
					}
			%>
		</select> 
		<br>
		კლასის სახელი:<input class="input" type="text" name="groupname">
		<input class="input" type="submit" value="Submit">
	</form>
</body>
</html>