<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/c1.css" media="screen">
<link rel="stylesheet" href="resources/css/c3.css" media="screen">
<link rel="stylesheet" href="resources/css/c2.css" media="screen">
<link rel="stylesheet" href="resources/css/LoginRegPage.css" media="screen">
<script class="u-script" type="text/javascript"
	src="resources/js/jquery-3.5.1.min.js" defer=""></script>
<script class="u-script" type="text/javascript"
	src="resources/js/jq1.js" defer=""></script>
<meta name="generator" content="Nicepage 5.9.15, nicepage.com">
<meta name="referrer" content="origin">
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
<script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"logo": "images/default-logo.png"
}</script>
</head>
<body data-home-page="https://website4844962.nicepage.io/MainPage.html?version=26955cdb-ad9a-4139-8054-aecbcc5786d7"
	data-home-page-title="MainPage" class="u-body u-xl-mode" data-lang="en">
	<header class="u-clearfix u-header u-header" id="sec-61c1">
		<div class="u-clearfix u-sheet u-sheet-1">
			<a href="/dalabel" class="u-image u-logo u-image-1"
				data-image-width="80" data-image-height="40"> <img
				src="resources/image/page_image/logo.png" class="u-logo-image u-logo-image-1">
			</a>
			<a href="login.go">로그인 하러가기</a>
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
							<g>
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
				<div class="u-custom-menu u-nav-container">
					<ul class="u-nav u-unstyled u-nav-1">
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
							style="padding: 10px 20px;">LoginPage</a></li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
							href="myPage" style="padding: 10px 20px;">MyPage</a></li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
							href="LabelingPage.html" style="padding: 10px 20px;">LabelingPage</a>
							<div class="u-nav-popup">
								<ul
									class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-2">
									<li class="u-nav-item"><a
										class="u-button-style u-nav-link u-white">GetLabeling</a></li>
									<li class="u-nav-item"><a
										class="u-button-style u-nav-link u-white"
										href="BoardPage.html">DoLabeling</a></li>
								</ul>
							</div></li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
							href="BoardPage.html" style="padding: 10px 20px;">BoardPage</a>
							<div class="u-nav-popup">
								<ul
									class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-3">
									<li class="u-nav-item"><a
										class="u-button-style u-nav-link u-white">ShareInfo</a></li>
									<li class="u-nav-item"><a
										class="u-button-style u-nav-link u-white">QNA</a></li>
									<li class="u-nav-item"><a
										class="u-button-style u-nav-link u-white">Notice</a></li>
								</ul>
							</div></li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
							href="BoardPage.html" style="padding: 10px 20px;">Credit</a></li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
							rel="nofollow" style="padding: 10px 20px;">API</a></li>
					</ul>
				</div>
				<div class="u-custom-menu u-nav-container-collapse">
					<div
						class="u-align-center u-container-style u-grey-25 u-inner-container-layout u-sidenav u-sidenav-1"
						data-offcanvas-width="342.1635">
						<div class="u-inner-container-layout u-sidenav-overflow">
							<div class="u-menu-close"></div>
							<ul
								class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-4">
								<li class="u-nav-item"><a class="u-button-style u-nav-link">${sessionScope.loginUserID}님 환영합니다</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="member.needlogin.info">내 정보</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link">라벨링</a>
									<div class="u-nav-popup">
										<ul
											class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-5">
											<li class="u-nav-item"><a
												class="u-button-style u-nav-link" href="get.needlogin.my.bundle">내 데이터 관리</a></li>
											<li class="u-nav-item"><a
												class="u-button-style u-nav-link" href="get.needlogin.myUpload.labeling">라벨링 프로젝트 관리</a>
											</li>
											<li class="u-nav-item"><a
												class="u-button-style u-nav-link" href="doLabeling.needlogin.showable">라벨링 할래요</a>
											</li>
										</ul>
									</div></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link">게시판</a>
									<div class="u-nav-popup">
										<ul
											class="u-h-spacing-20 u-nav u-unstyled u-v-spacing-10 u-nav-6">
											<li class="u-nav-item"><a
												class="u-button-style u-nav-link">공유</a></li>
											<li class="u-nav-item"><a
												class="u-button-style u-nav-link">질문</a></li>
											<li class="u-nav-item"><a
												class="u-button-style u-nav-link">공지</a></li>
										</ul>
									</div></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="게시판 페이지로 감">크레딧</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									rel="nofollow">API</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="member.needlogin.logout">로그아웃버튼</a>
							</ul>
						</div>
					</div>
					<div class="u-menu-overlay"></div>
				</div>
			</nav>
		</div>
	</header>

	<section class="u-align-center u-clearfix u-white u-section-1"
		id="carousel_491c">
		<h2 class="u-align-center u-text u-text-default u-text-1">회원가입</h2>
		<img class="u-expanded-width u-image u-image-default u-image-1"
			src="resources/image/page_image/purple.jpg" alt=""
			data-image-width="1440" data-image-height="1080">
		<div class="u-form u-radius-20 u-white u-form-1">
			<form action="member.join.do" method="post"
				class="u-clearfix u-form-spacing-15 u-form-vertical u-inner-form"
				source="email" name="form" style="padding: 23px;">
				<h4 class="u-align-center u-form-group u-form-text u-text u-text-2"><span
						style="text-decoration: underline !important;"></span>
				</h4>
				<div class="u-form-group u-form-name">
					<label for="name-4c18" class="u-label">아이디</label> <input
						type="text" placeholder="Enter your ID" id="name-4c18"
						name="user_id"
						class="u-border-2 u-border-grey-10 u-grey-10 u-input u-input-rectangle u-radius-10"
						required="">
				</div>
				<div class="u-form-email u-form-group">
					<label for="email-4c18" class="u-label">비밀번호</label> <input
						type="password" placeholder="Enter your PW" id="email-4c18"
						name="user_pw"
						class="u-border-2 u-border-grey-10 u-grey-10 u-input u-input-rectangle u-radius-10"
						required="">
				</div>
				<div class="u-form-group u-form-group-4">
					<label for="text-445b" class="u-label">비밀번호 확인</label> <input
						type="password" placeholder="Enter your PW Check" id="text-445b"
						name="user_pwCheck"
						class="u-border-2 u-border-grey-10 u-grey-10 u-input u-input-rectangle u-radius-10">
				</div>
				<div class="u-form-group u-form-group-5">
					<label for="name-4c18" class="u-label">이름</label> <input
						type="text" placeholder="Enter your Name" id="text-1"
						name="user_name"
						class="u-border-2 u-border-grey-10 u-grey-10 u-input u-input-rectangle u-radius-10"
						required="">
				</div>
				<div class="u-form-group u-form-name">
					<label for="name-4c18" class="u-label">생일</label> <select
						name="year">
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
					</select>일
				</div>
				<div class="u-form-agree u-form-group u-form-group-7">
					<label class="u-field-label"></label> <input type="checkbox"
						id="agree-a472" name="agree"
						class="u-agree-checkbox u-field-input" required=""> <label
						for="agree-a472"
						class="u-agree-label u-block-08d8-22 u-field-label" style="">I
						accept the <a href="#">Terms of Service</a>
					</label>
				</div>
				<div class="u-align-right u-form-group u-form-submit">
					<button
						class="u-border-2 u-border-black u-btn u-btn-submit u-button-style u-hover-black u-none u-text-black u-text-hover-white u-btn-1">가입</button>
				</div>
				<div class="u-form-send-message u-form-send-success">Thank
					you! Your message has been sent.</div>
				<div class="u-form-send-error u-form-send-message">Unable to
					send your message. Please fix errors then try again.</div>
			</form>
		</div>
	</section>
	
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
								<p
									class="u-align-left-lg u-align-left-md u-small-text u-text u-text-variant u-text-1">푸터
									로고 밑쪽 텍스트</p>
							</div>
						</div>
						<div
							class="u-align-left-sm u-align-left-xs u-container-style u-layout-cell u-size-15 u-size-30-md u-layout-cell-2">
							<div
								class="u-container-layout u-valign-middle-xs u-valign-top-lg u-valign-top-md u-valign-top-sm u-valign-top-xl u-container-layout-2">
								<h6 class="u-custom-font u-heading-font u-text u-text-2">푸터
									1</h6>
								<p
									class="u-align-left-lg u-align-left-md u-small-text u-text u-text-variant u-text-3">푸터
									1밑 텍스트</p>
							</div>
						</div>
						<div
							class="u-align-left-sm u-align-left-xs u-container-style u-layout-cell u-size-15 u-size-30-md u-layout-cell-3">
							<div
								class="u-container-layout u-valign-middle-xs u-valign-top-lg u-valign-top-md u-valign-top-sm u-valign-top-xl u-container-layout-3">
								<h6 class="u-custom-font u-heading-font u-text u-text-4">푸터
									2</h6>
								<p
									class="u-align-left-lg u-align-left-md u-small-text u-text u-text-variant u-text-5">푸터
									2밑 텍스트</p>
							</div>
						</div>
						<div
							class="u-align-left-sm u-align-left-xs u-container-style u-layout-cell u-right-cell u-size-15 u-size-30-md u-layout-cell-4">
							<div
								class="u-container-layout u-valign-middle-xs u-valign-top-lg u-valign-top-md u-valign-top-sm u-valign-top-xl u-container-layout-4">
								<h6 class="u-custom-font u-heading-font u-text u-text-6">푸터
									3</h6>
								<p
									class="u-align-left-lg u-align-left-md u-small-text u-text u-text-variant u-text-7">푸터
									3밑 텍스트</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<section class="u-backlink u-clearfix u-grey-80">
		<a class="u-link" href="https://nicepage.com/templates"
			target="_blank"> <span>여기도 --->>>Template</span>
		</a>
		<p class="u-text">
			<span>created with</span>
		</p>
		<a class="u-link" href="" target="_blank"> <span>Website
				Builder Software ----뭔가쓸수 있을듯</span>
		</a>.
	</section>
	
	
</body>
</html>