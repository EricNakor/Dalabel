<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="joinMember.do">
		<table id="joinTable">
			<tr>
				<th colspan="2">회원가입</th>
			</tr>
			<tr>
				<td class="td1" align="right">아이디</td>
				<td align="center"><input>
				<button>중복확인</button></td>
			</tr>
			<tr>
				<td class="td1" align="right">비밀번호</td>
				<td align="center"><input type="password"></td>
			</tr>
			<tr>
				<td class="td1" align="right">비밀번호 확인</td>
				<td align="center"><input type="password"></td>
			</tr>
			<tr>
				<td class="td1" align="right">이름</td>
				<td align="center"><input></td>
			</tr>
			<tr>
				<td class="td1" align="right">이메일</td>
				<td align="center"><input> @ <input></td>
				<td><button>인증번호 받기</button></td>
			</tr>
			<tr>
				<td class="td1" align="right">생일</td>
				<td align="center"><select name="y">
						<c:forEach var="y" begin="1923" end="2023">
							<option>${y }</option>
						</c:forEach>
				</select>년&nbsp;&nbsp; <select name="m">
						<c:forEach var="m" begin="1" end="12">
							<option>${m }</option>
						</c:forEach>
				</select>월&nbsp;&nbsp; <select name="d">
						<c:forEach var="d" begin="1" end="31">
							<option>${d }</option>
						</c:forEach>
				</select>일</td>
			</tr>
			<tr>
				<td class="td1" align="right">프사</td>
				<td align="center"><input type="file" name="m_photo"></td>
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