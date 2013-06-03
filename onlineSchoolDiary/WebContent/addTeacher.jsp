<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Teacher</title>
</head>
<body>
	<form action="/onlineSchoolDiary/addTeacher" method="post">
		Username:<input type="text" name="username">
		Password:<input type="password" name="password">
		Fullname:<input type="text" name="fullname">
		<input type="submit" value="Submit">
	</form>
	<br>
	<a href="/onlineSchoolDiary/adminPage.jsp">Back to Admin Page</a>
</body>
</html>