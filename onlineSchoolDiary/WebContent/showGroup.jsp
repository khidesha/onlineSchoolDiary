<%@page import="classes.StudentManager"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="classes.Group"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.Mark"%>
<%@page import="classes.GroupManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	Group gr = GroupManager.getGroup(Integer.parseInt(request
			.getParameter("groupID")));
%>
<title>Group <%=gr.getClassName()%></title>
</head>
<body>
	<%
		session.setAttribute("groupID", new Integer(gr.getClassId()));
		session.setAttribute("subjectID",
				new Integer(request.getParameter("subjectID")));
		String tmp = new SimpleDateFormat("dd/MM/yyyy").format(Calendar
				.getInstance().getTime());
		Calendar c = Calendar.getInstance();
		String daysWeek[] = { "monday", "tuesday", "wednesday", "thursday",
				"friday" };
	%>

	<form action="/onlineSchoolDiary/updateMarks" method="post" id="monday">
		<input type="hidden" name="date" value="monday">
	</form>
	<form action="/onlineSchoolDiary/updateMarks" method="post"
		id="tuesday">
		<input type="hidden" name="date" value="tuesday">
	</form>
	<form action="/onlineSchoolDiary/updateMarks" method="post"
		id="wednesday">
		<input type="hidden" name="date" value="wednesday">
	</form>
	<form action="/onlineSchoolDiary/updateMarks" method="post"
		id="thursday">
		<input type="hidden" name="date" value="thursday">
	</form>
	<form action="/onlineSchoolDiary/updateMarks" method="post" id="friday">
		<input type="hidden" name="date" value="friday">
	</form>



	<table border="8">

		<tr>
			<th>&nbsp;Student List&nbsp;</th>
			<th>&nbsp; <%
 	c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
 	out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
 	String monday = new SimpleDateFormat("yyyy-MM-dd").format(c
 			.getTime());
 %> &nbsp;
			</th>
			<th>&nbsp; <%
 	c.set(Calendar.DAY_OF_WEEK, Calendar.TUESDAY);
 	out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
 %> &nbsp;
			</th>
			<th>&nbsp; <%
 	c.set(Calendar.DAY_OF_WEEK, Calendar.WEDNESDAY);
 	out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
 %> &nbsp;
			</th>
			<th>&nbsp; <%
 	c.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY);
 	out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
 %> &nbsp;
			</th>
			<th>&nbsp; <%
 	c.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
 	out.println(new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
 	String friday = new SimpleDateFormat("yyyy-MM-dd").format(c
 			.getTime());
 %> &nbsp;

			</th>
		</tr>
		<%
			StudentManager sm = (StudentManager) getServletContext()
					.getAttribute("studentmanager");
			for (int i : GroupManager.getStundetsOfGroup(gr.getClassId())) {
				ArrayList<Mark> markArr = sm.getMarks(i);
		%>
		<tr>
			<td><%=StudentManager.getStudent(i).getUsername()%></td>
			<%
				Date date = null;
					int markName = -1;
					int dayOfWeek = -1;
					String note = "";
					ArrayList<Mark> subjectMark = new ArrayList<Mark>();
					for (int k = 0; k < markArr.size(); k++) {
						Mark mark = markArr.get(k);
						int subjectId = Integer.parseInt(request
								.getParameter("subjectID"));
						if (mark.getSubjectId() == subjectId) {
							date = mark.mark_date;
							String markDate = new SimpleDateFormat("yyyy-MM-dd")
									.format(date);
							if (((markDate.compareTo(monday) >= 0) && (markDate
									.compareTo(friday) <= 0))) {
								subjectMark.add(mark);
							} else {
								date = null;
							}
						}

					}

					if (subjectMark.size() == 0) {
						for (int j = 0; j <= daysWeek.length - 1; j++) {
			%>
			<td><select form="<%=daysWeek[j]%>" type="text" name="<%=i%>"">
					<option></option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
			</select></td>
			<%
				}
					} else {
						int count = 0;
						for (int j = 0; j <= daysWeek.length; j++) {
							if (j > 0 && count == 0) {
			%>
			<td><select form="<%=daysWeek[j-1]%>" type="text" name="<%=i%>"">
					<option></option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
			</select></td>
			<%
				}
							if (j != daysWeek.length) {
								count = 0;
								for (int m = 0; m < subjectMark.size(); m++) {
									if (subjectMark.get(m).mark_date.getDay() == j + 1) {
										count++;
										Mark mark1 = subjectMark.get(m);
										markName = mark1.mark;
										note = mark1.comment;
										date = mark1.mark_date;
										if (date != null) {
											c.setTime(date);
											dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
										}
										int n = dayOfWeek - 2;
			%>
			<td><select form="<%=daysWeek[j]%>" type="text" name="<%=i%>"">
					<option></option>
					<option>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
					<option>6</option>
					<option>7</option>
					<option>8</option>
					<option>9</option>
					<option>10</option>
			</select> <%
 	if (j == n){
 								out.print(markName + " (" + note + ") ");
 	break;
 	}
 %></td>
			<%
				}

								}
							}
						}
					}
			%>
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