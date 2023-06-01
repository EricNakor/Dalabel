<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
<script type="text/javascript" src="resources/js/upload.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="member.needlogin.update.do" method="post">
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
				<td><input value="${memberInfo.user_pw }" type="password"
					name="user_pw"></td>
			</tr>
			<tr>
				<td align="left">비밀번호 확인</td>
				<td><input value="${memberInfo.user_pw }" type="password"></td>
			</tr>
			<tr>
				<td align="left">생일</td>
				<td><input value="20220905" name="birth"></td>
			</tr>
			<tr>
				<td align="left">프로필 사진</td>
				<td><img id="profile"
					src="resources/image/profile/${sessionScope.loginUserIMG }"
					alt="${sessionScope.loginUserIMG }"> <a
					onclick="profileUpload()">프사변경</a></td>
			</tr>
			<tr>
				<td align="center">
					<button>수정</button>
					</form>
				</td>
				<td>
					<form action="member.needlogin.delete" method="post">
						<button>탈퇴</button>
					</form>
				</td>
			</tr>
		</table>
</body>
</html>