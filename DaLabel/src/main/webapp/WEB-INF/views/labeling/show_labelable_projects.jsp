<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="u-body u-xl-mode" onload="labeling_do_loads(-1,12)">
	<section
		class="u-align-center u-clearfix u-container-align-center-lg u-container-align-center-md manage-container-align-center-sm u-container-align-center-xl manage-palette-1-base u-valign-middle manage-section-1"
		id="carousel_491c" data-image-width="1980" data-image-height="1200">
		<div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
			<h4>참여 가능한 라벨링</h4>
			<div class="u-align-left manage-btn-div">
				<button
					class="u-active-black u-align-center u-border-none u-btn-round manage-button-style u-hover-black u-palette-3-base u-radius-50 u-text-active-white u-text-body-alt-color u-text-hover-white manage-btn-2"
					onclick="location.href = 'doLabeling.needlogin.mypage'">내가
					참여한 라벨링</button>
			</div>
			<div class="manage-list manage-list manage-list-1">
				<div id="projectsontainer" class="u-repeater u-repeater-1">
				</div>
			</div>
			<button class="loadBt">추가로 로드하기</button>
		</div>
	</section>
</body>
</html>