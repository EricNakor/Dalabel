<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/c3.css" media="screen">
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
<body>
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
</body>
</html>