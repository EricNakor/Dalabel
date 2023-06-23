<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="u-body u-xl-mode">
	<section
		class="u-align-center u-clearfix u-container-align-center-lg u-container-align-center-md manage-container-align-center-sm u-container-align-center-xl manage-palette-1-base u-valign-middle manage-section-1"
		id="carousel_491c" data-image-width="1980" data-image-height="1200">
		<div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
			<h4>내가 등록한 라벨링 관리</h4>
			<div class="u-align-left manage-btn-div">
				<button
					class="u-active-black u-align-center u-border-none u-btn-round manage-button-style u-hover-black u-palette-3-base u-radius-50 u-text-active-white u-text-body-alt-color u-text-hover-white manage-btn-2"
					onclick="location.href='get.needlogin.my.bundle'">내 번들 관리</button>
			</div>
			<div class="manage-list manage-list manage-list-1">
				<div class="u-repeater u-repeater-1">
					<c:forEach var="p" items="${projects }">
						<div
							class="u-align-left u-container-align-center u-container-style manage-list-item u-radius-20 manage-repeater-item u-shape-round u-white manage-list-item-1"
							data-animation-name="customAnimationIn"
							data-animation-duration="1500" data-animation-delay="500">
							<div
								class="u-container-layout u-container-layout-1 manage-container-layout u-similar-container manage-container-layout-1"
								onclick="location.href='get.needlogin.detail.myproject?project_no=${p.project_no}'">
								<div class="titleDiv">
								<h5
									class="u-align-left u-custom-font u-font-ubuntu u-text u-text-default manage-text-palette-1-base u-text-3 labeling-text-3">${p.project_title }</h5>
								</div>
								<p class="u-align-left u-text u-text-grey-40 u-text-4">
									#
									<c:if test="${p.project_how == 0}">
									직접 타이핑
								</c:if>
									<c:if test="${p.project_how == 1}">
									버튼 누르기
								</c:if>
								</p>
									<p class="u-align-left u-text u-text-grey-40 u-text-4"
										id="labeling-progress">
										프로젝트 진행상태 :
										<c:if test="${p.project_progress == 48}">
									시작 안함
								</c:if>
										<c:if test="${p.project_progress == 49}">
									진행 중
								</c:if>
										<c:if test="${p.project_progress == 51}">
									정산중
								</c:if>
										<c:if test="${p.project_progress == 52}">
									종료(정산됨)
								</c:if>
									</p>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="page-div">
					<c:forEach var="p" begin="1" end="${projectPageCount }">
						<a href="project.needlogin.page.change?page=${p }">${p }</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
</body>
</html>