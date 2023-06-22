<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="">
<meta name="description" content="">
<title>Home</title>
<link rel="stylesheet" href="resources/css/boardList.css" media="screen">
<link rel="stylesheet" href="resources/css/nicepage.css" media="screen">
<script class="u-script" type="text/javascript"
	src="jquery-1.9.1.min.js" defer=""></script>
<script class="u-script" type="text/javascript" src="nicepage.js"
	defer=""></script>
<meta name="generator" content="Nicepage 5.12.2, nicepage.com">
<meta name="referrer" content="origin">
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">



<script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"url": "/",
		"logo": "images/default-logo.png"
}</script>
<meta name="theme-color" content="#478ac9">
<meta property="og:title" content="Home">
<meta property="og:type" content="website">
<link rel="canonical" href="/">
<meta data-intl-tel-input-cdn-path="intlTelInput/">
</head>
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
							<tr style="height: 50px;" class="list"
								onclick="location.href='board.needlogin.get.detail?board_id='+${n.board_id}">
								<td align="center"
									class="u-border-2 u-border-no-left u-border-no-right u-border-white u-table-cell"><strong>[공지]</strong>
								</td>
								<td class="u-border-2 u-border-white u-table-cell"><strong>${n.board_title }</strong></td>
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
									name="board_id" value="${b.board_id }" type="hidden"> <a
									href="board.get.detail?board_id=${p.board_id }">${p.board_title }</a></td>
								<td align="center"
									class="u-border-2 u-border-white u-table-cell">${p.board_writer }</td>
								<td align="center"
									class="u-border-2 u-border-no-left u-border-no-right u-border-white u-table-cell"><fmt:formatDate
										value="${p.board_regist }" type="date" dateStyle="short" /></td>
							</tr>
						</c:forEach>
					</tbody>
					<tr>
						<td align="right" colspan="4"><a
							href="board.needlogin.post.write.go">글쓰기</a></td>
					</tr>
					<tr>
						<td align="center" colspan="4">
							<form action="board.search" name="boardSearchForm"
								onsubmit="return boardSearchCheck();">
								<table id="searchArea">
									<tr>
										<td align="center"><input name="search" maxlength="20">
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