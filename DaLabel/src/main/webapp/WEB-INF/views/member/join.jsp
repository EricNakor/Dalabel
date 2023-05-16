<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				<td align="center"><input name="user_id"></td>
				<td><button>중복확인</button></td>
			</tr>
			<tr>
				<td class="td1" align="right">비밀번호</td>
				<td colspan="2" align="center"><input type="password"
					name="user_pw"></td>
			</tr>
			<tr>
				<td class="td1" align="right">비밀번호 확인</td>
				<td colspan="2" align="center"><input type="password"
					name="user_pwchk"></td>
			</tr>
			<tr>
				<td class="td1" align="right">이름</td>
				<td colspan="2" align="center"><input name="user_name"></td>
			</tr>
			<tr>
				<td class="td1" align="right">이메일</td>
				<td align="center"><input name="user_email"> @ <input></td>
				<td><button>인증번호 받기</button></td>
			</tr>
			<tr>
				<td class="td1" align="right">생일</td>
				<td colspan="2" align="center"><select name="year">
						<c:forEach var="y" begin="${2023 - 100 }" end="${2023 }">
							<%-- 나중에 curYear로 바꿔야 함 --%>
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
				<td class="td1" align="right">주소</td>
				<td colspan="2" align="center"><input id="joinAddr1"
					name="address1" placeholder="우편번호" readonly="readonly"><br>
					<input id="joinAddr2" name="address2" placeholder="주소"
					readonly="readonly"><br> <input name="address3"
					placeholder="상세주소"><br></td>
			</tr>
			<tr>
				<td class="td1" align="right">프사</td>
				<td colspan="2" align="center"><input type="file"
					name="user_img"></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<button>가입</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>