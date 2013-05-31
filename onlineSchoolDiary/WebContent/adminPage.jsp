<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome <%= request.getParameter("userName") %></title>
</head>
<body>
<a href="/addTeacher.jsp">Add Teacher</a>
<a href="/addStudent.jsp">Add Student</a>
<a href="/addSubject.jsp">Add Subject</a>
<a href="/addGroup.jsp">Add Group</a>
</body>
</html>