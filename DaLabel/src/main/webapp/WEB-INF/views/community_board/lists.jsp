<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<body class="u-body u-xl-mode">
	<input name="token" value="${token }" type="hidden">
	<section class="u-align-center u-clearfix u-section-1" id="sec-30ba">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div class="u-table u-table-responsive u-table-1">
				<table class="u-table-entity u-table-entity-1">
					<colgroup>
						<col width="13.15%">
						<col width="60.56%">
						<col width="13.15%">
						<col width="13.15%">
					</colgroup>
					<tbody class="u-table-body">
						<tr style="height: 60px; font-size: 15pt; font-weight: bold;"
							align="center">
							<td
								class="u-border-2 u-border-no-left u-border-no-right u-border-white u-palette-1-light-2 u-table-cell u-table-cell-1">말
								머 리</td>
							<td
								class="u-border-2 u-border-white u-palette-1-light-2 u-table-cell u-table-cell-2">제
								목</td>
							<td
								class="u-border-2 u-border-white u-palette-1-light-2 u-table-cell u-table-cell-3">작
								성 자</td>
							<td
								class="u-border-2 u-border-no-left u-border-no-right u-border-white u-palette-1-light-2 u-table-cell u-table-cell-4">등
								록 일</td>
						</tr>
						<c:forEach var="n" items="${curNotice }">
							<tr class="list"
								onclick="location.href='board.needlogin.get.detail?board_id='+${n.board_id}">
								<td align="center"
									class="u-border-2 u-border-no-left u-border-no-right u-border-white u-table-cell"><strong>공지</strong>
								</td>
								<td class="u-border-2 u-border-white u-table-cell"><strong><a
										href="board.get.detail?board_id=${n.board_id }">${n.board_title }</a></strong>
									<input name="board_id" value="${n.board_id }" type="hidden"></td>
								<td align="center"
									class="u-border-2 u-border-white u-table-cell"><strong>관리자</strong></td>
								<td align="center"
									class="u-border-2 u-border-no-left u-border-no-right u-border-white u-table-cell"><strong><fmt:formatDate
											value="${n.board_regist }" type="date" dateStyle="short" /></strong></td>
							</tr>
						</c:forEach>
						<c:forEach var="p" items="${posts }">
							<tr style="height: 50px;" class="list"
								onclick="location.href='board.needlogin.get.detail?board_id='+${p.board_id}">
								<td align="center"
									class="u-border-2 u-border-no-left u-border-no-right u-border-white u-table-cell">${p.board_category }</td>
								<td class="u-border-2 u-border-white u-table-cell"><input
									name="board_id" value="${p.board_id }" type="hidden"> <a
									href="board.needlogin.get.detail?board_id=${p.board_id }">${p.board_title }</a></td>
								<td align="center"
									class="u-border-2 u-border-white u-table-cell">${p.board_writer }</td>
								<td align="center"
									class="u-border-2 u-border-no-left u-border-no-right u-border-white u-table-cell"><fmt:formatDate
										value="${p.board_regist }" type="date" dateStyle="short" /></td>
							</tr>
						</c:forEach>
					</tbody>
					<tr>
						<td align="right" colspan="4" class="u-border-2 u-border-no-left u-border-no-right u-border-palette-1-light-2 u-table-cell"><a
							href="board.needlogin.post.write.go"></a></td>
					</tr>
					<tr>
						<td align="right" colspan="4"><a href="board.needlogin.post.write.go">글쓰기</a></td>
					</tr>
					<tr>
						<td align="center" colspan="4">
							<form action="board.needlogin.search" name="boardSearchForm"
								onsubmit="return boardSearchCheck();">
								<table id="searchArea">
									<tr>
										<td align="center"><input name="search" maxlength="20"
											class="searchInput">
											<button class="searchBtn">검색</button></td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
					<tr>
						<td align="center" colspan="4"><c:if test="${prev}">
								<span>[ <a
									href="board.needlogin.page.change?p=${page - 1}">이전</a> ]
								</span>
							</c:if> <c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
								<span> <c:if test="${page != num}">
										<a href="board.needlogin.page.change?p=${num}">${num}</a>
									</c:if> <c:if test="${page == num}">
										<b>${num}</b>
									</c:if>
								</span>
							</c:forEach> <c:if test="${next}">
								<span>[ <a
									href="board.needlogin.page.change?p=${page + 1}">다음</a> ]
								</span>
							</c:if></td>
					</tr>
				</table>
			</div>
		</div>
	</section>
</body>


</html>