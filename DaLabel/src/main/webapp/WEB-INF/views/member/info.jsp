<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="">
		<table id="infoTbl">
			<th>회원정보</th>
			<tr>
				<td align="left">아이디</td>
				<td>${sessionScope. }</td>
			</tr>
			<tr>
				<td align="left">이메일</td>
				<td><input value="${sessionScope. }"></td>
			</tr>
			<tr>
				<td align="left">비밀번호</td>
				<td><input value="${sessionScope. }" type="password"></td>
			</tr>
			<tr>
				<td align="left">비밀번호 확인</td>
				<td><input value="${sessionScope. }" type="password"></td>
			</tr>
			<tr>
				<td align="left">생일</td>
				<td><fmt:formatDate value="${sessionScope.}" type="date" dateStyle="long"/> </td>
			</tr>
			<tr>
				<td align="left">닉네임</td>
				<td><input value="${sessionScope. }"></td>
			</tr>
			<tr>
				<td align="left">프로필 사진</td>
				<img src="img/${sessionScope. }">
				<td><input type="file"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<button >수정</button>
	</form>
				<button onclick="">탈퇴</button>
				</td>
			</tr>
	</table>
</body>
</html>