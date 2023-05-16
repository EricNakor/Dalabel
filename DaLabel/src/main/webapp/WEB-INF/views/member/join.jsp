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
	<form action="member.join.do">
		<table id="joinTable">
			<tr>
				<th colspan="2">회원가입</th>
			</tr>
			<tr>
				<td class="td1" align="right">아이디</td>
				<td align="center"><input></td>
				<td><button>중복확인</button></td>
			</tr>
			<tr>
				<td class="td1" align="right">비밀번호</td>
				<td colspan="2" align="center"><input type="password"></td>
			</tr>
			<tr>
				<td class="td1" align="right">비밀번호 확인</td>
				<td colspan="2" align="center"><input type="password"></td>
			</tr>
			<tr>
				<td class="td1" align="right">이름</td>
				<td colspan="2" align="center"><input></td>
			</tr>
			<tr>
				<td class="td1" align="right">이메일</td>
				<td align="center"><input> @ <input></td>
			</tr>
			<tr>
				<td class="td1" align="right">생일</td>
				<td colspan="2" align="center"><select name="y">
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
				<td class="td1" align="right">주소</td>
				<td colspan="2" align="center"><input id="joinAddr1" name="m_address1"
					placeholder="우편번호" readonly="readonly"><br> <input
					id="joinAddr2" name="m_address2" placeholder="주소"
					readonly="readonly"><br> <input name="m_address3"
					placeholder="상세주소"><br></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<button>가입</button>
					<button>취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>