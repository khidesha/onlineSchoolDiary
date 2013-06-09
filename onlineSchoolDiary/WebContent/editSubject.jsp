<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="classes.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Edit Subject</title>
<link rel="stylesheet" type="text/css" href="form.css" />
</head>
<body>
	<form action="/onlineSchoolDiary/editSubject" method="post">
		საგანი: 
		<br>
		<select class="select" name="subject">
			<%
				HttpSession ses = request.getSession();
				User user = (User) ses.getAttribute("user");
				int schoolId = user.getUserId();
				schoolManager sm = (schoolManager) getServletContext()
						.getAttribute("schoolmanager");
				ArrayList<Subject> arr = sm.getSubjects(schoolId);
				for (int i = 0; i < arr.size(); i++) {
					out.println("<option value=" + arr.get(i).getSubjectId() + ">"
							+ arr.get(i).getSubjectId() + " "
							+ arr.get(i).getSubjectName() + "</option>");
				}
			%>
			</select>
			<br>
		საგნის სახელი:<input class="input" type="text" name="subjectName">
		მასწავლებელი:
		<br>
		<select class="select" name="teacherID">
			<%
				ArrayList<Teacher> arr2 = sm.getTeachers(schoolId);
				for (int i = 0; i < arr2.size(); i++) {
					out.println("<option value=" +arr2.get(i).getUserId() +">" +arr2.get(i).getUserId() +" "+ arr2.get(i).getUsername()+"</option>");
				}
			%>
		</select>
		<br>
		კლასი:
		<br>
		<select class="select" name="groupID">
			<%
				ArrayList<Group> arr1 = sm.getClasses(schoolId);
				for (int i = 0; i < arr1.size(); i++) {
					out.println("<option value=" +arr1.get(i).getClassId() +">" +arr1.get(i).getClassId() +" "+ arr1.get(i).getClassName()+"</option>");
				}
			%>
		</select>
		<input class="input" type="submit" value="Submit">
	</form>
	
</body>
</html>