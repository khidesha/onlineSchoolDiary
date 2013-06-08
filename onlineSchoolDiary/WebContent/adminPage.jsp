<%@page import="classes.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	User usr = (User) session.getAttribute("user");
%>
<title>Welcome <%=usr.getUsername()%></title>
</head>
<body>
	<a href="/onlineSchoolDiary/addTeacher.jsp">Add Teacher</a>
	<a href="/onlineSchoolDiary/addStudent.jsp">Add Student</a>
	<a href="/onlineSchoolDiary/addSubject.jsp">Add Subject</a>
	<a href="/onlineSchoolDiary/addGroup.jsp">Add Group</a>
	<a href="/onlineSchoolDiary/editTeacher.jsp">Edit Teacher</a>
	<a href="/onlineSchoolDiary/editStudent.jsp">Edit Student</a>
	<a href="/onlineSchoolDiary/editSubject.jsp">Edit Subject</a>
	<a href="/onlineSchoolDiary/editGroup.jsp">Edit Group</a>
</body>
</html>