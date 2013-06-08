<%@page import="classes.GroupManager"%>
<%@page import="classes.Group"%>
<%@page import="classes.teacherManager"%>
<%@page import="classes.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.DBManager"%>
<%@page import="classes.User"%>
<%@page import="classes.SubjectManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teacher Page</title>
</head>
<body>
	<h1>Subjects:</h1>
	<b><ul>
	<%
		HttpSession ses = request.getSession();
		User user = (User) ses.getAttribute("user");
		int teacherId = user.getUserId();
		teacherManager tm = (teacherManager)getServletContext().getAttribute("teachermanager");
		ArrayList<Subject> arr = tm.getSubjectes(teacherId);
		
		for(Subject subj: arr){			
	%>	
			<li>
				<%=subj.getSubjectName()%> &nbsp;&nbsp;
				<form action="showGroup.jsp?groupID=<%=subj.getClassId()%>" method="post">
					Class:<select name="classList">
					<%
						for(Group gr: GroupManager.getGroupBySubject(subj.getSubjectName())){
					%>
							<option value="<%=gr.getClassId()%>"><%=gr.getClassName()%> </option>
					<% 
						}
					%>
					</select>
					<input type="submit" value="Select">
				</form>
			</li>
	<% 
		}
	%>		
	
	</ul></b>
</body>
</html>