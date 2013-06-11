<%@page import="classes.StudentManager"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="classes.Group"%>
<%@page import="classes.GroupManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%	
	Group gr = GroupManager.getGroup(Integer.parseInt(request.getParameter("groupID")));
%>
<title>Group <%=gr.getClassName()%></title>
</head>
<body>
	<% 
		session.setAttribute("groupID", new Integer(gr.getClassId()));
		session.setAttribute("subjectID", new Integer(request.getParameter("subjectID")));
		String tmp = new SimpleDateFormat("dd/MM/yyyy").format(Calendar
					.getInstance().getTime());
		Calendar c = Calendar.getInstance();
	%>
	
	<form action="/onlineSchoolDiary/updateMarks" method="post" id="monday">
		<input type="hidden" name="date" value="monday">
	</form>
	<form action="/onlineSchoolDiary/updateMarks" method="post" id="tuesday">
		<input type="hidden" name="date" value="tuesday">
	</form>
	<form action="/onlineSchoolDiary/updateMarks" method="post" id="wednesday">
		<input type="hidden" name="date" value="wednesday"></form>
	<form action="/onlineSchoolDiary/updateMarks" method="post" id="thursday">
		<input type="hidden" name="date" value="thursday">
	</form>
	<form action="/onlineSchoolDiary/updateMarks" method="post" id="friday">
		<input type="hidden" name="date" value="friday">
	</form>
	
	
	
	<table border="8">

		<tr>
			<th>&nbsp;Student List&nbsp;</th>
			<th>
				&nbsp;
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
					out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
				%>
				&nbsp;
			</th>
			<th>
				&nbsp;
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.TUESDAY);
					out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
				%>
				&nbsp;
			</th>
			<th>
				&nbsp;
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.WEDNESDAY);
					out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
				%>
				&nbsp;
			</th>
			<th>
				&nbsp;
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY);
					out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
				%>
				&nbsp;
			</th>
			<th>
				&nbsp;
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
					out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
				%>
				&nbsp;
			</th>
		</tr>
		<%
			for(int i: GroupManager.getStundetsOfGroup(gr.getClassId())){
		%>
				<tr>
					<td>
						<%= StudentManager.getStudent(i).getUsername() %>
					</td>
					<td>
						<input form="monday" type="text" name="<%=i%>">
					</td>
					<td>
						<input form="tuesday" type="text" name="<%=i%>">						
					</td>
					<td>
						<input form="wednesday" type="text" name="<%=i%>">						
					</td>
					<td>
						<input form="thursday" type="text" name="<%=i%>">						
					</td>
					<td>
						<input form="friday" type="text" name="<%=i%>">						
					</td>
				</tr>
		<%
			}
		%>
		
		<tr>
			<td></td>
			<td><input form="monday" type="submit" value="Submit"></td>
			<td><input form="tuesday" type="submit" value="Submit"></td>
			<td><input form="wednesday" type="submit" value="Submit"></td>
			<td><input form="thursday" type="submit" value="Submit"></td>
			<td><input form="friday" type="submit" value="Submit"></td>
		</tr>
		</table>
</body>
</html>