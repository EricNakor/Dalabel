<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="u-body u-xl-mode">
	<section
		class="u-align-center u-clearfix u-container-align-center-lg u-container-align-center-md manage-container-align-center-sm u-container-align-center-xl u-palette-1-base u-valign-middle manage-section-1"
		id="carousel_491c" data-image-width="1980" data-image-height="1200">
		<div class="u-clearfix u-sheet u-valign-middle u-sheet-1">
			<button
				class="u-active-black u-align-center u-border-none u-btn u-btn-round u-button-style u-hover-black u-palette-3-base u-radius-50 u-text-active-white u-text-body-alt-color u-text-hover-white u-btn-2"
				onclick="location.href='get.needlogin.myUpload.labeling'">내가
				참여한 라벨링</button>
			<button
				class="u-active-black u-align-center u-border-none u-btn u-btn-round u-button-style u-hover-black u-palette-3-base u-radius-50 u-text-active-white u-text-body-alt-color u-text-hover-white u-btn-2"
				onclick="fileUpload('upload.needlogin.bundle.go')">번들 등록</button>
			<div class="manage-list manage-list manage-list-1">
				<div class="u-repeater u-repeater-1">
					<c:forEach var="b" items="${bundles }">
						<div
							class="u-align-left u-container-align-center u-container-style manage-list-item u-radius-20 u-repeater-item u-shape-round u-white manage-list-item-1"
							data-animation-name="customAnimationIn"
							data-animation-duration="1500" data-animation-delay="500">
							<div
								class="u-container-layout u-container-layout-1 manage-container-layout u-similar-container manage-container-layout-1">
								<img
									class="u-expanded-width u-image u-image-round u-radius-12 u-image-1"
									data-image-width="363" data-image-height="363"
									src="resources/data/zip.png">
								<h6
									class="u-align-center u-custom-font u-font-ubuntu u-text u-text-default u-text-palette-1-base u-text-3">
									<a
										href="reg.needlogin.labeling.go?bundle_name=${b.bundle_uploaded_filename }&bundle_no=${b.bundle_no }">${b.bundle_folder_name}</a>
								</h6>
								<p class="u-align-left u-text u-text-grey-40 u-text-4">
									${b.bundle_descript }</p>
								<form action="bundle.needlogin.data.go">
									<input type="hidden" value="${b.bundle_no }" name="data_where">
									<input type="hidden" value="${b.bundle_folder_name }"
										name="bundle_folder_name"> <input type="hidden"
										value="${b.bundle_uploaded_filename }"
										name="bundle_uploaded_filename">
									<button
										class="u-active-black u-align-center u-border-none u-btn u-btn-round u-button-style u-hover-black u-palette-3-base u-radius-50 u-text-active-white u-text-body-alt-color u-text-hover-white u-btn-2">파일
										관리</button>
									<button type="button" onclick="deleteBundle(${b.bundle_no });"
										class="u-active-black u-align-center u-border-none u-btn u-btn-round u-button-style u-hover-black u-palette-3-base u-radius-50 u-text-active-white u-text-body-alt-color u-text-hover-white u-btn-2">삭제</button>
								</form>
							</div>
						</div>
					</c:forEach>
				</div>
				<div>
					<c:forEach var="p" begin="1" end="${bundlePageCount }">
						<a href="bundle.needlogin.page.change?page=${p }">${p }</a>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
</body>
</html>