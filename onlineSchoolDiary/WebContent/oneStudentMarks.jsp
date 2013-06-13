

<%@page import="classes.markComperator"%>
<%@page import="classes.DayComment"%>
<%@page import="classes.StudentManager"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="classes.Student"%>
<%@page import="java.util.Date"%>
<%@page import="classes.teacherManager"%>
<%@page import="classes.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.DBManager"%>
<%@page import="classes.User"%>
<%@page import="classes.SubjectManager"%>
<%@page import=" java.sql.Statement"%>
<%@page import=" java.sql.ResultSet"%>
<%@page import="classes.Mark"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body {
	background-image: url(images/bg.png);
}

select {
	-webkit-appearance: button;
	-webkit-border-radius: 2px;
	-webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
	-webkit-padding-end: 8px;
	-webkit-padding-start: 1px;
	-webkit-user-select: none;
	background-image: url(../images/select-arrow.png),
		-webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
	background-position: center right;
	background-repeat: no-repeat;
	border: 1px solid #AAA;
	color: #555;
	font-size: inherit;
	margin: 0;
	overflow: hidden;
	padding-top: 2px;
	padding-bottom: 2px;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#table-2 {
	border: 1px solid #e3e3e3;
	background-color: #f2f2f2;
	width: 100%;
	border-radius: 6px;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
}

#table-2 td,#table-2 th {
	padding: 5px;
	color: #333;
}

#table-2 thead {
	font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
	padding: .2em 0 .2em .5em;
	text-align: center;
	color: #4B4B4B;
	background-color: #C8C8C8;
	background-image: -webkit-gradient(linear, left top, left bottom, from(#f2f2f2),
		to(#e3e3e3), color-stop(.6, #B3B3B3) );
	background-image: -moz-linear-gradient(top, #D6D6D6, #B0B0B0, #B3B3B3 90%);
	border-bottom: solid 1px #999;
}

#table-2 th {
	font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
	font-size: 9px;
	line-height: 20px;
	font-style: normal;
	font-weight: normal;
	text-align: center;
	text-shadow: white 1px 1px 1px;
}

#table-2 td {
	line-height: 20px;
	font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
	font-size: 14px;
	border-bottom: 1px solid #fff;
	border-top: 1px solid #fff;
}

#table-2 td:hover {
	background-color: #fff;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<%
	Student stud = StudentManager.getStudent(Integer.parseInt(request
		.getParameter("studentID")));
	HttpSession ses = request.getSession();
 	int subjectID = (Integer)ses.getAttribute("subjectID");
	int studentId = stud.getUserId(); 
	StudentManager st = (StudentManager) getServletContext()
			.getAttribute("studentmanager");
	Subject subj = SubjectManager.getSubject(subjectID);
	List<Mark> ar = st.getSubjectMarks(studentId, subjectID);
	Collections.sort(ar,new markComperator());
	%>
	<table border="8" id="table-2">


		<tr>
			<td>Student</td>
	<%
	for(int i = 0; i < ar.size(); i++) { 
	%>
		<td> <%out.println(new SimpleDateFormat("yyyy-MM-dd").format(ar.get(i).mark_date));%></td>
		<% 	
	}%>
	</tr>
	<tr>
	<td><%out.println(subj.getSubjectName()); %></td>
	<%for(int i = 0; i < ar.size(); i++) { %>
		<td><%out.print(ar.get(i).getMark());%></td>
		<% }
%>
	</tr>
<title><%subj.getSubjectName();%></title>

</head>
<body>



</body>
</html>