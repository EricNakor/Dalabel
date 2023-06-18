<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="u-body u-xl-mode">
	<section class="u-align-center u-clearfix u-section-1 u-grey-5" id="sec-de29">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div class="member-info-form member-info-form-1">
				<form action="reg.needlogin.labeling.do" method="post"
					onsubmit="return json_()"
					class="u-clearfix u-form-spacing-10 u-form-vertical u-inner-form"
					style="padding: 10px" source="email" name="form">
					<div class="u-form-group u-form-name u-label-none">
						<input type="hidden" name="project_bundle_no"
							value="${bundle_no }">
					</div>
					<div
						class="u-align-left u-form-group u-form-name u-label-none">
						<c:set var="_no" value="${fn:indexOf(bundle_name, \"_\")}" />
						<c:set var="length" value="${fn:length(bundle_name)}" />
						파일명 : ${fn:substring(bundle_name, _no + 1, length) } <a
							href="get.needlogin.my.bundle">변경</a>
					</div>
					<div class="u-form-group u-form-name u-label-none">
						<label for="name-3b9a" class="u-label">Title</label> <input
							id="project_title" class="u-input u-input-rectangle"
							name="project_title" placeholder="제목을 입력해주세요.">
					</div>
					<div class="u-form-group u-form-message u-label-none">
						<label for="message-3b9a" class="u-label">GuideLine</label>
						<textarea placeholder="가이드라인" rows="50" cols="50"
							name="project_guide" id="project_guide message-3b9a"
							class="u-input u-input-rectangle">
					</textarea>
						<script type="text/javascript">
							CKEDITOR.replace('project_guide', {
								filebrowserUploadUrl : 'upload.do'
							});
						</script>
					</div>
					<div class="u-form-group u-form-select u-label-none u-form-group-3">
						<label for="select-8e37" class="u-label">데이터 타입</label>
						<span class="u-form-select-wrapper">
							<select name="bundle_data_type"
								class="u-input u-input-rectangle select-8e37">
								<option value="-1">데이터 타입을 선택해주세요.</option>
								<option value="0">사진 분석</option>
								<option value="1">텍스트 분석</option>
							</select>
							<select name="project_how" id="project_how"
								class="u-input u-input-rectangle select-8e37" onchange="select();">
								<option value="-1">라벨링 방법을 선택해주세요.</option>
								<option value="0">직접 타이핑</option>
								<option value="1">버튼 누르기</option>
								<option value="2">영역 드래그</option>
							</select>
						</span>
					</div>
					<div id="space" class="u-form-group u-form-name u-label-none">
						<input id="project_category" name="project_category" type="hidden"
							value="">
					</div>
					<div class="u-align-center u-form-group u-form-submit">
						<button class="u-btn u-btn-submit u-button-style">등록</button>
						<button class="u-btn u-btn-submit u-button-style" type="button"
							onclick="cancle()">취소</button>
					</div>
				</form>
			</div>
		</div>
	</section>
</body>
</html>