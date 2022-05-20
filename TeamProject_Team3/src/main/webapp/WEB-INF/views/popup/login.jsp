<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
<link rel="stylesheet" href="resources/css/totalcss.css">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div class="container">
      <div class="row">
        <div class="page-header">
          <h2>로그인</h2>
        </div>
        <div class="col-md-4  col-md-offset-4">
        <div align="center">
	        <c:if test="${logo != null}">
			<img src="resources/upload/${logo}" class="img-responsive"
			class="img-circle">
			</c:if>
			<c:if test="${logo == null}">
			<img src="resources/images/essence2.png" class="img-responsive"
			>
			</c:if>
        
        </div>
        
          <div class="login-box well">
           <form action="/erp/j_spring_security_check" accept-charset="UTF-8" role="form" method="post">
            <legend>로그인</legend>
            <div class="form-group">
                <label for="username-email">ID (사번)</label>
                <input name="u_id" id="username-email" placeholder="ID를 입력하세요." type="text" class="form-control" />
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input name="u_pwd" id="password" placeholder="비밀번호를 입력하세요." type="password" class="form-control" />
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-default btn-login-submit btn-block m-t-md" value="Login" />
            </div>
            <span class='text-center'><a href="pass_search" class="text-sm">비밀번호 찾기</a></span>
            <hr />
				<c:if test="${not empty param.fail}">
				<div align="center">
				<font color="red">아이디 비밀번호를 다시 확인 해 주세요.</font>
				</div>
				<c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION"/>
				</c:if>
        </form>
          </div>
        </div>
      </div>
    </div>
    
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/total_js.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</body>
</html>