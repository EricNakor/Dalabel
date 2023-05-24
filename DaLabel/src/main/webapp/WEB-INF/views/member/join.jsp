<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/dalabelCheck.js"></script>
<script type="text/javascript" src="resources/js/validChecker.js"></script>
<script type="text/javascript" src="resources/js/jQuery.js"></script>
</head>
<body>
	<form action="member.join.do" method="post" name="joinForm" onsubmit="return joinCheck();">
		<table id="joinTable">
			<tr>
				<th colspan="2">회원가입</th>
			</tr>
			<tr>
				<td class="td1" align="right">아이디</td>

				<td align="center"><input name="user_id">
				<button id="idChkBtn" type="button" onclick="idCheck();">중복확인</button></td>
			</tr>
			<tr>
				<td class="td1" align="right">비밀번호</td>
				<td align="center"><input type="password" name="user_pw"></td>
			</tr>
			<tr>
				<td class="td1" align="right">비밀번호 확인</td>
				<td align="center"><input type="password" name="user_pwCheck"></td>
			</tr>
			<tr>
				<td class="td1" align="right">이름</td>
				<td align="center"><input name="user_name"></td>
			</tr>
			<tr>
				<td class="td1" align="right">생일</td>
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
				<td colspan="2" align="center">
          <button>가입</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>