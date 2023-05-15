<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HiddenLayer</title>
</head>
<body>
	<h1>Login Page</h1>
	<form action="login.do" method="post">
		<input type="text" name="id" placeholder="아이디">
		<input type="password" name="password" placeholder="비밀번호">
		<input type="checkbox" name="remember"> Remember me
		<input type="submit" value="login"> 
		<a href="#">비밀번호를 잃어버리셨습니까?</a>
		<a href="#">회원가입 하러가기</a>
	</form>
</body>
</html>