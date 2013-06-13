<%@page import="classes.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="green style.css" />
<title>Student Page</title>
</head>
<body>
	<%
		HttpSession ses = request.getSession();
		Student student = (Student) ses.getAttribute("user");
		int classId = student.getClassId();
		StudentManager sm = (StudentManager) getServletContext()
				.getAttribute("studentmanager");
		ArrayList<Subject> arr = sm.getSubjectes(classId);
	%>
	<div id="container">
		<div id="header">
			<h1>
				ელ. დღიური <span class="off">მოსწავლის გვერდი</span>
			</h1>
			<h2>
				მოგესალმებით
				<%=student.getUsername()%></h2>
		</div>

		<div id="menu">
			<ul>
				<li class="menuitem"><a
					href="/onlineSchoolDiary/studentLogIn.jsp">მთავარი გვერდი</a></li>
				<li class="menuitem"><FORM>
						<small><a href='/onlineSchoolDiary/logOut'>სისტემიდან
								გამოსვლა</a></small>
					</FORM>
				</li>
			</ul>
		</div>

		<div id="leftmenu">

			<div id="leftmenu_top"></div>

			<div id="leftmenu_main">

				<h3>საგანი</h3>

				<ul>
					<%
						for (Subject subj : arr) {
					%>
					<li><a href="yearMarks.jsp?subjectID=<%=subj.getSubjectId()%>"
						target="iframe_a"><%=subj.getSubjectName()%></a></li>
					<%
						}
					%>
				</ul>
			</div>


			<div id="leftmenu_bottom"></div>
		</div>




		<div id="content">


			<div id="content_top"></div>
			<div id="content_main">
				<iframe src="showWeek.jsp" width="650" height="315" name="iframe_a"></iframe>
			</div>
			<div id="content_bottom"></div>

			<div id="footer">
				<h3>
					<a>სკოლების ერთიანი ელექტრონული ჟურნალი. &copy; თამარ ჯაფარიძე,
						თამარ კეშელავა, ზურაბ ნატროშვილი, ვამეხ გოიათი, ირაკლი ხიდეშელი</a>
				</h3>
			</div>
		</div>
	</div>
</body>
</html>