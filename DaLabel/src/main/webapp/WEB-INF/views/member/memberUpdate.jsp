<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="member.update.do">
		<table id="infoTbl">
			<th>회원정보</th>
			<tr>
				<td align="left">아이디</td>
				<td>${memberInfo.user_id }</td>
			</tr>
			<tr>
				<td align="left">이메일</td>
				<td><input value="${memberInfo.user_email }" name="user_email"></td>
			</tr>
			<tr>
				<td align="left">이름</td>
				<td><input value="${memberInfo.user_name }" name="user_name"></td>
			</tr>
			<tr>
				<td align="left">비밀번호</td>
				<td><input value="${memberInfo.user_pw }" type="password" name="user_pw"></td>
			</tr>
			<tr>
				<td align="left">비밀번호 확인</td>
				<td><input value="${memberInfo.user_pw }" type="password"></td>
			</tr>
			<tr>
				<td align="left">생일</td>
				<td align="center"><select name="year">
						<c:forEach var="y" begin="1923" end="2023">
							<option>${y }</option>
						</c:forEach>
				</select>년&nbsp;&nbsp; <select name="month">
						<c:forEach var="m" begin="1" end="12">
							<option>${m }</option>
						</c:forEach>
				</select>월&nbsp;&nbsp; <select name="day">
						<c:forEach var="d" begin="1" end="31">
							<option>${d }</option>
						</c:forEach>
				</select>일</td>
			</tr>
			<tr>
				<td align="left">프로필 사진</td>
				<td><img src="resources/image/profile/${memberInfo.user_img }"></td>
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