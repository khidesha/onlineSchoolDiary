<%@page import="classes.GroupManager"%>
<%@page import="classes.Group"%>
<%@page import="classes.teacherManager"%>
<%@page import="classes.Subject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.DBManager"%>
<%@page import="classes.User"%>
<%@page import="classes.SubjectManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="gray style.css" />
<title>Teacher Page</title>
</head>
<body>
<%
		HttpSession ses = request.getSession();
		User user = (User) ses.getAttribute("user");
		int teacherId = user.getUserId();
		teacherManager tm = (teacherManager)getServletContext().getAttribute("teachermanager");
		ArrayList<Subject> arr = tm.getSubjectes(teacherId);		
	%>	
	<div id="container">
		<div id="header">
			<h1>
				ელ. დღიური <span class="off">მასწავლებლის გვერდი</span>
			</h1>
			<h2>მოგესალმებით <%=user.getUsername()%></h2>
		</div>

		<div id="menu">
			<ul>
				<li class="menuitem"><a href="/onlineSchoolDiary/teacherLogIn.jsp">მთავარი გვერდი</a></li>
				<li class="menuitem"><a href="/onlineSchoolDiary/login.jsp">სისტემიდან გამოსვლა</a></li>
			</ul>
		</div>

		<div id="leftmenu">

			<div id="leftmenu_top"></div>

			<div id="leftmenu_main">

				<h3>საგანი/ჯგუფი</h3>

				<ul><%
					for(Subject subj: arr){
					%>	
					<li><a href="showGroup.jsp?groupID=<%=subj.getClassId()%>&subjectID=<%=subj.getSubjectId() %>"
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
				<iframe src="" width="650" height="315" style="background-image:url(images/bg2.png)" name="iframe_a"></iframe>
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