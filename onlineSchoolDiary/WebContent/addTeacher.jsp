<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Teacher</title>
<link rel="stylesheet" type="text/css" href="form.css" />
</head>
<body>
	<form action="/onlineSchoolDiary/addTeacher" method="post">
		მომხმარებლის სახელი:<input class="input" type="text" name="username">
		პაროლი:<input class="input" type="password" name="password">
		სახელი და გვარი:<input class="input" type="text" name="fullname">
		<input class="input" type="submit" value="Submit">
	</form>
	<br>
</body>
</html>