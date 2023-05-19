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
<a href="member.logout">로그아웃</a>
<a href="member.join.go">회원가입</a>
<a href="member.info">마이페이지</a>
<form action="member.delete" method="post">
	<button>탈퇴</button>
</form>
<a href="try.upload">프사 변경</a>
</body>
</html>
