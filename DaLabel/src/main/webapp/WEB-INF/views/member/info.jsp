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
	<form action="member.needlogin.update.go" method="get">
		<table id="infoTbl">
			<th>회원정보</th>
			<tr>
				<td align="left">아이디</td>
				<td>${memberInfo.user_id }</td>
			</tr>
			<tr>
				<td align="left">이메일</td>
				<td><input value="${memberInfo.user_email }" name="user_email"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td align="left">이름</td>
				<td><input value="${memberInfo.user_name }" name="user_name"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td align="left">비밀번호</td>
				<td><input value="${memberInfo.user_pw }" type="password"
					name="user_pw" readonly="readonly"></td>
			</tr>
			<tr>
				<td align="left">비밀번호 확인</td>
				<td><input value="${memberInfo.user_pw }" type="password"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td align="left">생일</td>
				<td><fmt:formatDate value="${memberInfo.user_birth }"
						type="date" dateStyle="long" /></td>
			</tr>
			<tr>
				<td align="left">프로필 사진</td>
				<td><img
					src="resources/image/profile/${sessionScope.loginUserIMG }"></td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<button>수정</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>