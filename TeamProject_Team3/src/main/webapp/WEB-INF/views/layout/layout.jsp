<%@page import="org.springframework.web.bind.annotation.RequestMapping"%>
<%@page import="org.springframework.stereotype.Controller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>


<html>
<head>
<link rel="stylesheet" href="resources/css/totalcss.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/total_js.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body id="layout_body">

	<div class="container-fluid">
		<div class="row">
			<header>

				<tiles:insertAttribute name="header" />

				<nav class="col-md-7 col-md-offset-3" id="navbar">
					<tiles:insertAttribute name="topmenu" />
				</nav>
				<div class="col-md-12" id="hr1"></div>
			</header>

			<section>
				<article class="col-md-2" id="sidemenu">
					<nav id="sidemenu_bar">
						<tiles:insertAttribute name="sidemenu" />
					</nav>
				</article>
				<article class="col-md-10" id="content">
					<tiles:insertAttribute name="content" />
				</article>
			</section>
			<footer class="col-md-12">
				<tiles:insertAttribute name="footer" />
			</footer>
		</div>
	</div>

</body>

</html>