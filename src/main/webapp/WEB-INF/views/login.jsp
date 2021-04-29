<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	
	
	<div class="wrapper fadeInDown">
		<c:if test="${param.accessDenied != null}">
					<div class="alert alert-danger">
							You are not Authorized
					</div>
		</c:if>
		  <div id="formContent">
		    <!-- Tabs Titles -->
		    <h2 class="active"> Sign In </h2>
		    <h2 class="inactive underlineHover">Sign Up </h2>
		
			<c:if test="${param.incorrectAccount != null}">
					<div class="alert alert-danger">
							Username or password incorrect
					</div>
			</c:if>

		    <!-- Login Form -->
		    <!-- action = login-processing-url in security.xml -->
		    <form action="j_spring_security_check" id="formLogin" method="post">
		      
					<!-- name = username-parameter in security.xml -->
					<input type="text" class="fadeIn second" id="userName" name="j_username"
							placeholder="Tên đăng nhập">
			
		      		<!-- name = password-parameter in security.xml -->
					<input type="password" class="fadeIn third" id="password" name="j_password"
							placeholder="Mật khẩu">
		      		
		      		
		      <input type="submit" class="fadeIn fourth" value="Log In">
		    </form>
		
		    <!-- Remind Passowrd -->
		    <div id="formFooter">
		      <a class="underlineHover" href="#">Forgot Password?</a>
		    </div>
	
	  		</div>
	</div>
</body>
</html>