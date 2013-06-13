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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1></h1>
	<%
		HttpSession ses = request.getSession();
		Student student = (Student) ses.getAttribute("user");
		int classId = student.getClassId();
		StudentManager sm = (StudentManager) getServletContext()
				.getAttribute("studentmanager");
		ArrayList<Subject> arr = sm.getSubjectes(classId);
		String tmp = new SimpleDateFormat("dd/MM/yyyy").format(Calendar
				.getInstance().getTime());
		Calendar c = Calendar.getInstance();

		int studentId = student.getUserId();
		ArrayList<Mark> markArr = sm.getMarks(studentId);
		
	%>
	<table border="8" id="table-2">


		<tr>
			<td></td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
				out.println("ორშაბათი "
			 			+ new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
			 	String monday = new SimpleDateFormat("yyyy-MM-dd").format(c
			 			.getTime());
			 	out.println(" ნიშანი        /     კომენტარი");
				%>
			</td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.TUESDAY);
				out.println("სამშაბათი "
			 			+ new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
			 	out.println(" ნიშანი        /     კომენტარი");
				%>
			</td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.WEDNESDAY);
				out.println("ოთხშაბათი "
			 			+ new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
			 	out.println(" ნიშანი        /     კომენტარი");
				%>
			</td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.THURSDAY);
				out.println("ხუთშაბათი "
			 			+ new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
			 	out.println(" ნიშანი        /     კომენტარი");
				%>
			</td>
			<td>
				<%
					c.set(Calendar.DAY_OF_WEEK, Calendar.FRIDAY);
				out.println("პარასკევი "
			 			+ new SimpleDateFormat("dd/MM/yyyy").format(c.getTime()));
			 	out.println(" ნიშანი        /     კომენტარი");
					String friday = new SimpleDateFormat("yyyy-MM-dd").format(c
							.getTime());
				%>
			</td>
		</tr>
		<%
			for (int i = 0; i < arr.size(); i++) {
		%>
		<tr>
			<td>
			 <%=arr.get(i).getSubjectName()%>
			</td>
			<%
				Date date = null;
					int markName = -1;
					int dayOfWeek = -1;
					String note = "";
					int subjectId = -1;
					ArrayList<Mark> subjectMark = new ArrayList();
					for (int k = 0; k < markArr.size(); k++) {
						Mark mark = markArr.get(k);
						subjectId = arr.get(i).subject_id;
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
						for (int j = 0; j < 5; j++) {
			%>
			<td></td>
			<%
				}
					} else {
						for (int j = 0; j < 5; j++) {
							for (int m = 0; m < subjectMark.size(); m++) {
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
			<%
				if (j == n) {
					%><td><%
					if(markName>0){
			%>
			<b><big><%=markName%></big></b>
			<% } %>
			<form name=myform style="float: right;">
				<textarea name=mytextarea style="float: right;" cols="3" rows="1" readonly><%=note%></textarea>
			</form>
			</td>

			<%
				break;
								} else {

									if (m == subjectMark.size() - 1) {
			%>
			<td></td>
			<%
				}
								}
							}

						}
					}
			%>
		</tr>
		<tr>
			<td>
				<%
					out.println("Homework");
				%>

			</td>
			<%
				ArrayList<DayComment> noteArr = sm.getNotes(subjectId);
					String homeWork = "";
					if (noteArr.size() == 0) {
						for (int j = 0; j < 5; j++) {
			%>
			<td></td>
			<%
				}}
					for (int j = 0; j < 5; j++) {
						for (int l = 0; l < noteArr.size(); l++) {
							homeWork = noteArr.get(l).comment;
							String noteD = noteArr.get(l).date;
							SimpleDateFormat dateFormat = new SimpleDateFormat(
									"yyyy-MM-dd");
							Date noteDate = dateFormat.parse(noteD);
							c.setTime(noteDate);
							int noteN = c.get(Calendar.DAY_OF_WEEK);
							noteN = noteN - 2;
							if (((noteD.compareTo(monday) >= 0) && (noteD
									.compareTo(friday) <= 0))) {
								if (j == noteN) {
			%>
			<td>
			<form name=myform style="float: right;">
				<textarea name=mytextarea style="float: right;" cols="8" rows="2" readonly><%=homeWork%></textarea>
			</form>
			</td>

			<%
				break;
								} else {

									if (l == noteArr.size() - 1) {
			%>
			<td></td>
			<%
				}
								}
							}  else {

	%>
			<td></td>
			<%

						}
					}
					}
			%>

		</tr>
		<%
			}
		%>

	</table>
</body>
</html>
