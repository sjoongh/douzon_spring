<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<div class="col-md-1">
	<a href="main">
		<c:if test="${sessionScope.logo != null}">
		<img src="resources/upload/${ sessionScope.logo }" id="logo_main"
		class="img-responsive img-circle">
		</c:if>
		<c:if test="${sessionScope.logo == null}">
		<img src="resources/images/essence1.png" id="logo_main"
		class="img-responsive img-circle">
		</c:if>
		</a>
</div>
<div class="col-md-1">
<div align="center" style="margin-top: 5px;">
	<p>${sessionScope.login_id}님<br>
	환영합니다.<br>
	<a href="${pageContext.request.contextPath}/logout">
로그아웃</a>
</p>
		</div>
</div>