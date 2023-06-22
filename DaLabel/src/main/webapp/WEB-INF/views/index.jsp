<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="utf-8">
<meta name="keywords" content="">
<meta name="description" content="">
<title>인공지능 학습용 데이터 라벨링 플랫폼</title>
<link rel="stylesheet" href="resources/css/c1.css" media="screen">
<link rel="stylesheet" href="resources/css/c3.css" media="screen">
<link rel="stylesheet" href="resources/css/c2.css" media="screen">
<link rel="stylesheet" href="resources/css/MyPage.css" media="screen">
<link rel="stylesheet" href="resources/css/LoginJoin.css" media="screen">
<link rel="stylesheet" href="resources/css/Manage.css" media="screen">
<link rel="stylesheet" href="resources/css/boardList.css" media="screen">
<link rel="stylesheet" href="resources/css/boardDetail.css" media="screen">
<link rel="stylesheet" href="resources/css/upload.css" media="screen">
<script class="u-script" type="text/javascript"
	src="resources/js/jquery-3.5.1.min.js"></script>
<script class="u-script" type="text/javascript"
	src="resources/js/jq1.js"></script>
<script type="text/javascript" src="resources/js/move.js"></script>
<script type="text/javascript" src="resources/js/upload.js"></script>
<script type="text/javascript" src="resources/js/upload.js"></script>
<script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
<script type="text/javascript" src="resources/js/labeling.js"></script>
<script type="text/javascript" src="resources/js/labeling-do.js"></script>
<script type="text/javascript" src="resources/js/dalabelMove.js"></script>
<script type="text/javascript" src="resources/js/validCheck.js"></script>
<meta name="generator" content="Nicepage 5.9.15, nicepage.com">
<meta name="referrer" content="origin">
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
<link id="u-page-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Ubuntu:300,300i,400,400i,500,500i,700,700i">
<script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"logo": "images/logo.png"
}</script>
<meta name="theme-color" content="#478ac9">
<meta property="og:title" content="hiddenlayer">
<meta property="og:type" content="website">
<meta data-intl-tel-input-cdn-path="intlTelInput/">
</head>
<body>
	<header class="u-clearfix u-header u-header" id="sec-61c1">
		<div class="u-clearfix u-sheet u-sheet-1">
			<a href="/dalabel" class="u-image u-logo u-image-1"
				data-image-width="80" data-image-height="40"> <img
				src="resources/image/page_image/logo.png"
				class="u-logo-image u-logo-image-1">
			</a>
			<nav
				class="u-align-left u-font-size-14 u-menu u-menu-hamburger u-nav-spacing-25 u-offcanvas u-menu-1"
				data-responsive-from="XL">
				<div class="menu-collapse">
					<a class="u-button-style u-nav-link" href="#"
						style="font-size: calc(1em + 18px);"> <svg class="u-svg-link"
							preserveAspectRatio="xMidYMin slice" viewBox="0 0 302 302"
							style="">
							<use xlink:href="#svg-7b92"></use></svg> <svg
							xmlns="http://www.w3.org/2000/svg"
							xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1"
							id="svg-7b92" x="0px" y="0px" viewBox="0 0 302 302"
							style="enable-background: new 0 0 302 302;" xml:space="preserve"
							class="u-svg-content">
							<g>-
							<rect y="36" width="302" height="30"></rect>
							<rect y="236" width="302" height="30"></rect>
							<rect y="136" width="302" height="30"></rect>
</g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g>
							<g></g></svg>
					</a>
				</div>

				<div class="u-custom-menu u-nav-container-collapse">
					<div
						class="u-align-center u-container-style u-grey-25 u-inner-container-layout u-sidenav u-sidenav-1"
						data-offcanvas-width="342.1635">
						<div class="u-inner-container-layout u-sidenav-overflow">
							<div class="u-menu-close"></div>
							<ul
								class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-4">
								<c:if test="${sessionScope.loginUserID != null }">
									<li class="u-nav-item">
										<table>
											<tr>
												<td rowspan="2"><img
													src="resources/image/profile/
													${sessionScope.loginUserIMG }"
													class="profileImg"></td>
												<td>${sessionScope.loginUserID}님</td>
											</tr>
											<tr>
												<td>환영합니다</td>
											</tr>
										</table>

									</li>
								</c:if>
								<c:if test="${sessionScope.loginUserID == null }">
									<li class="u-nav-item"><a
										class="u-button-style u-nav-link" href="login.go">로그인</a> <a
										class="u-button-style u-nav-link" href="member.join.go">회원가입</a></li>
								</c:if>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="member.needlogin.info">내 정보</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link">라벨링</a>
									<div class="u-nav-popup">
										<ul
											class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-5">
											<li class="u-nav-item"><a
												class="u-button-style u-nav-link"
												href="get.needlogin.my.bundle">내 데이터 관리</a></li>
											<li class="u-nav-item"><a
												class="u-button-style u-nav-link"
												href="get.needlogin.myUpload.labeling">라벨링 프로젝트 관리</a></li>
											<li class="u-nav-item"><a
												class="u-button-style u-nav-link"
												href="doLabeling.needlogin.showable">라벨링 할래요</a></li>
										</ul>
									</div></li>
								<li class="u-nav-item"><a href="board.needlogin.go"
									class="u-button-style u-nav-link">게시판</a>
								<li class="u-nav-item"><a href="/dalabel#qna"
									class="u-button-style u-nav-link" rel="nofollow">고객센터</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="member.needlogin.logout">로그아웃</a>
							</ul>
						</div>
					</div>
					<div class="u-menu-overlay"></div>
				</div>
			</nav>
		</div>
	</header>

	<jsp:include page="${contentPage }"></jsp:include>

	<footer class="u-clearfix u-footer u-grey-80" id="sec-027d">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div
				class="u-clearfix u-expanded-width-lg u-expanded-width-md u-expanded-width-xl u-expanded-width-xs u-gutter-30 u-layout-wrap u-layout-wrap-1">
				<div class="u-gutter-0 u-layout">
					<div class="u-layout-row">
						<div
							class="u-align-left-sm u-align-left-xl u-align-left-xs u-container-style u-layout-cell u-left-cell u-size-15 u-size-30-md u-layout-cell-1">
							<div
								class="u-container-layout u-valign-middle-xs u-valign-top-lg u-valign-top-md u-valign-top-sm u-container-layout-1">
								<a href="푸터 쪽 로고 링크" class="u-image u-logo u-image-1"
									data-image-width="80" data-image-height="40"> <img
									src="resources/image/page_image/logo.png"
									class="u-logo-image u-logo-image-1">
								</a>
								<h5
									id="footer-number"
									class="u-align-left-lg u-align-left-md u-small-text u-text u-text-variant u-text-1">
									고객센터</h5>
								<p
									id="footer-number"
									class="u-align-left-lg u-align-left-md u-small-text u-text u-text-variant u-text-1">
									1644-1644</p>
							</div>
						</div>
						<div
							class="u-align-left-sm u-align-left-xs u-container-style u-layout-cell u-size-15 u-size-30-md u-layout-cell-2">
							<div
								class="u-container-layout u-valign-middle-xs u-valign-top-lg u-valign-top-md u-valign-top-sm u-valign-top-xl u-container-layout-2">
								<h5 class="u-custom-font u-heading-font u-text u-text-2">팀원</h5>
								<p
									class="u-align-left-lg u-align-left-md u-small-text u-text u-text-variant u-text-3">
									신용대 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 나준호</p>
								<p
									class="u-align-left-lg u-align-left-md u-small-text u-text u-text-variant u-text-3">
									박아멘 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 유성훈</p>
								<p
									class="u-align-left-lg u-align-left-md u-small-text u-text u-text-variant u-text-3">
									이미주</p>
							</div>
						</div>
						<div
							class="u-align-left-sm u-align-left-xs u-container-style u-layout-cell u-size-15 u-size-30-md u-layout-cell-3">
							<div
								class="u-container-layout u-valign-middle-xs u-valign-top-lg u-valign-top-md u-valign-top-sm u-valign-top-xl u-container-layout-3">
								<h6 class="u-custom-font u-heading-font u-text u-text-4">영업시간</h6>
								<p
									class="u-align-left-lg u-align-left-md u-small-text u-text u-text-variant u-text-5">평일
									: 09:00 ~ 18:00</p>
								<p
									class="u-align-left-lg u-align-left-md u-small-text u-text u-text-variant u-text-5">주말
									: 09:00 ~ 16:00</p>
							</div>
						</div>
						<div
							class="u-align-left-sm u-align-left-xs u-container-style u-layout-cell u-right-cell u-size-15 u-size-30-md u-layout-cell-4">
							<div
								class="u-container-layout u-valign-middle-xs u-valign-top-lg u-valign-top-md u-valign-top-sm u-valign-top-xl u-container-layout-4">
								<h6 class="u-custom-font u-heading-font u-text u-text-6">위치</h6>
								<p
									class="u-align-left-lg u-align-left-md u-small-text u-text u-text-variant u-text-7">솔데스크
									강남</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<section class="u-backlink u-clearfix u-grey-80">
		<span>Copyright @2023 | Designed With by </span>

		<p class="u-text">
			<span>created with</span>
		</p>
		<span>Hiddenlayer</span>

	</section>

</body>
</html>