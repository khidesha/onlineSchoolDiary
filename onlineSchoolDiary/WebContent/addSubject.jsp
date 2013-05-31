<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Subject</title>
</head>
<body>
	<form action="/addSubject" method="post">
		Subject name:<input type="text" name="subject">
		Teacher ID:<input type="text" name="teacherID">
		Group ID:<input type="text" name="groupID">
	</form>
</body>
</html>