<%@page import="classes.DayComment"%>
<%@page import="classes.DayCommentManager"%>
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

	<%
		String d = "";
	%>

	<table border="8" id="table-2">

		<tr>
			<th>&nbsp;სდუდენტი&nbsp;</th>
			<th>&nbsp; <%
 	c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
 	out.println("ორშაბათი "
 			+ new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
 	String monday = new SimpleDateFormat("yyyy-MM-dd").format(c
 			.getTime());
 	out.println(" ნიშანი        /     კომენტარი");
 	if (DayCommentManager.dayCommentAlreadyExists(
 			Integer.parseInt(request.getParameter("subjectID")),
 			new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()))) {
 		DayComment dc = DayCommentManager.getDayComment(
 				Integer.parseInt(request.getParameter("subjectID")),
 				monday);
 		d = dc.comment;
 	}
 %> &nbsp;

				<form action="/onlineSchoolDiary/updateMarks" method="POST">
					<textarea form="monday" name="dayNote<%=c.getTime().getDay()%>"
						cols="4" rows="1"><%=d%></textarea>
				</form>
			</th>
			<th>&nbsp; <%
 	d = "";
 	c.set(Calendar.DAY_OF_WEEK, Calendar.TUESDAY);
 	out.println("სამშაბათი "
 			+ new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
 	out.println(" ნიშანი        /     კომენტარი");
 	if (DayCommentManager.dayCommentAlreadyExists(
 			Integer.parseInt(request.getParameter("subjectID")),
 			new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()))) {
 		DayComment dc = DayCommentManager.getDayComment(
 				Integer.parseInt(request.getParameter("subjectID")),
 				new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()));
 		d = dc.comment;
 	}
 %> &nbsp;
				<form action="/onlineSchoolDiary/updateMarks" method="POST">
					<textarea form="tuesday" name="dayNote<%=c.getTime().getDay()%>"
						cols="4" rows="1"><%=d%></textarea>
				</form>
			</th>
			<th>&nbsp; <%
 	d = "";
 	c.set(Calendar.DAY_OF_WEEK, Calendar.WEDNESDAY);
 	out.println("ოთხშაბათი "
 			+ new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
 	out.println(" ნიშანი        /     კომენტარი");
 	if (DayCommentManager.dayCommentAlreadyExists(
 			Integer.parseInt(request.getParameter("subjectID")),
 			new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()))) {
 		DayComment dc = DayCommentManager.getDayComment(
 				Integer.parseInt(request.getParameter("subjectID")),
 				new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()));
 		d = dc.comment;
 	}
 %> &nbsp;
				<form action="/onlineSchoolDiary/updateMarks" method="POST">
					<textarea form="wednesday" name="dayNote<%=c.getTime().getDay()%>"
						cols="4" rows="1"><%=d%></textarea>
				</form>
			</th>
			<th>&nbsp; <%
 	d = "";
 	c.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY);
 	out.println("ხუთშაბათი "
 			+ new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
 	out.println(" ნიშანი        /     კომენტარი");
 	if (DayCommentManager.dayCommentAlreadyExists(
 			Integer.parseInt(request.getParameter("subjectID")),
 			new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()))) {
 		DayComment dc = DayCommentManager.getDayComment(
 				Integer.parseInt(request.getParameter("subjectID")),
 				new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()));
 		d = dc.comment;
 	}
 %> &nbsp;
				<form action="/onlineSchoolDiary/updateMarks" method="POST">
					<textarea form="thursday" name="dayNote<%=c.getTime().getDay()%>"
						cols="4" rows="1"><%=d%></textarea>
				</form>
			</th>
			<th>&nbsp; <%
 	d = "";
 	c.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
 	out.println("პარასკევი "
 			+ new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
 	String friday = new SimpleDateFormat("yyyy-MM-dd").format(c
 			.getTime());
 	out.println(" ნიშანი        /     კომენტარი");
 	if (DayCommentManager.dayCommentAlreadyExists(
 			Integer.parseInt(request.getParameter("subjectID")),
 			new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()))) {
 		DayComment dc = DayCommentManager.getDayComment(
 				Integer.parseInt(request.getParameter("subjectID")),
 				new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()));
 		d = dc.comment;
 	}
 %> &nbsp;
				<form action="/onlineSchoolDiary/updateMarks" method="POST">
					<textarea form="friday" name="dayNote<%=c.getTime().getDay()%>"
						cols="4" rows="1"><%=d%></textarea>
				</form>
			</th>
		</tr>
		<%
			StudentManager sm = (StudentManager) getServletContext()
					.getAttribute("studentmanager");
			for (int i : GroupManager.getStundetsOfGroup(gr.getClassId())) {
				ArrayList<Mark> markArr = sm.getMarks(i);
		%>
		<tr>
			<td><a href="oneStudentMarks.jsp?studentID=<%=StudentManager.getStudent(i).getUserId()%>" ><%=StudentManager.getStudent(i).getUsername()%></a></td>
			<%
				Date date = null;
					int markName = -1;
					int dayOfWeek = -1;
					String note = ":";
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
			<td><select form="<%=daysWeek[j]%>" type="text" name="<%=i%>">
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
			</select>
				<form style="float: right;" action=""
					/onlineSchoolDiary/updateMarks" method="POST">
					<textarea style="float: right;" form="<%=daysWeek[j]%>"
						name="<%=i%>C" cols="4" rows="1"><%=note%></textarea>
				</form></td>
			<%
				}
					} else {
						int count = 0;
						for (int j = 0; j <= daysWeek.length; j++) {
							if (j > 0 && count == 0) {
			%>

			<td><select form="<%=daysWeek[j - 1]%>" type="text"
				name="<%=i%>"">
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
			</select>
				<form style="float: right;" action="/onlineSchoolDiary/updateMarks"
					method="POST">
					<textarea style="float: right;" form="<%=daysWeek[j - 1]%>"
						name="<%=i%>C" cols="4" rows="1"><%=note%>
		</textarea>
				</form></td>
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
					<%
						if (markName > 0) {
					%>
					<option><%=markName%></option>
					<%
						} else {
					%>
					<option></option>
					<%
						}
					%>
					<option>X</option>
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
 	if (j == n) {
 %>
				<form style="float: right;" action="/onlineSchoolDiary/updateMarks"
					method="POST">
					<textarea style="float: right;" form="<%=daysWeek[j]%>"
						name="<%=i%>C" cols="4" rows="1"><%=note%></textarea>
				</form> <%
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