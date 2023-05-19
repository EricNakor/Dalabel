<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  ${sessionScope.loginUserID}. </P>
<a href="login.go">로그인</a>
<a href="member.join.go">회원가입</a>
<a href="mypage.go">마이페이지</a>
<a href="member.delete">탈퇴</a>
</body>
</html>
