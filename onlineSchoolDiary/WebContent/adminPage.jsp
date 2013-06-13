<%@page import="classes.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	User usr = (User) session.getAttribute("user");
%>
<link rel="stylesheet" type="text/css" href="style.css" />
<title>Welcome <%=usr.getUsername()%></title>
</head>
<body>
<body>
	<div id="container">
		<div id="header">
			<h1>
				ელ. დღიური <span class="off">სკოლის ადმინისტრატორი</span>
			</h1>
			<h2>მოგესალმებით <%=usr.getUsername()%></h2>
		</div>

		<div id="menu">
			<ul>
				<li class="menuitem"><a href="/onlineSchoolDiary/adminPage.jsp">მთავარი გვერდი</a></li>
				<li class="menuitem"><a href="/onlineSchoolDiary/login.jsp">სისტემიდან გამოსვლა</a></li>
			</ul>
		</div>

		<div id="leftmenu">

			<div id="leftmenu_top"></div>

			<div id="leftmenu_main">

				<h3>Links</h3>

				<ul>
					<li><a href="/onlineSchoolDiary/addTeacher.jsp"
						target="iframe_a">მასწავლებლის დამატება</a></li>
					<li><a href="/onlineSchoolDiary/addStudent.jsp"
						target="iframe_a">მოსწავლის დამატება</a></li>
					<li><a href="/onlineSchoolDiary/addSubject.jsp"
						target="iframe_a">საგნის დამატება</a></li>
					<li><a href="/onlineSchoolDiary/addGroup.jsp"
						target="iframe_a">კლასის დამატება</a></li>
					<li><a href="/onlineSchoolDiary/editTeacher.jsp"
						target="iframe_a">მასწავლებსის რედაქტირება</a></li>
					<li><a href="/onlineSchoolDiary/editStudent.jsp"
						target="iframe_a">სტუდენტის რედაქტირება</a></li>
					<li><a href="/onlineSchoolDiary/editSubject.jsp"
						target="iframe_a">საგნის რედაქტირება</a></li>
					<li><a href="/onlineSchoolDiary/editGroup.jsp"
						target="iframe_a">კლასის რედაქტირება</a></li>
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
</body>
</html>