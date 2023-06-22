<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="resources/js/labeling.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="u-body u-xl-mode"
	onload="loadProjectAccessLevel(${project.project_access_level})">
	<section
		class="u-clearfix u-container-align-center-sm u-container-align-center-xs u-grey-5 u-section-1"
		id="carousel_6806">
		<div class="u-clearfix u-layout-wrap u-layout-wrap-1">
			<div class="u-layout">
				<div class="u-layout-row">
					<div
						class="u-container-style u-layout-cell u-size-60 u-layout-cell-1">
						<div class="u-container-layout u-container-layout-1">
							<div class="u-expanded-width member-info-form member-info-form-1">
								<form action="update.needlogin.project.accessLevel"
									onsubmit="return changeAccessLevel();">
									<div class="member-info-form-group member-info-form-name">
										<label for="name-bb79" class="u-label">프로젝트명</label> <input
											type="text" id="name-bb79" value="${project.project_title }"
											readonly class="u-border-none u-input u-input-rectangle">
									</div>
									<div class="member-info-form-group member-info-form-name">
										<label for="name-bb79" class="u-label">참여권한</label><br> <input
											type="hidden" value="${project.project_no }"
											name="project_no"><input type="checkbox" value="1"
											class="access" onchange="selectAll();">전체 <input
											type="checkbox" value="2" class="access">숙련자 <input
											type="checkbox" value="4" class="access">이메일 인증된 사람 <input
											type="checkbox" value="8" class="access">요청 후 수락 <input
											type="radio" value="0" class="access" name="andor">or
										<input type="radio" value="16" class="access" name="andor">and
										<input name="project_access_level" type="hidden"
											id="project_access_level">
									</div>
									<div class="u-form-group u-form-message u-label-none">
										<label for="message-3b9a" class="u-label">GuideLine</label>
										<textarea placeholder="가이드라인" rows="50" cols="50"
											name="project_guide" id="project_guide"
											class="u-input u-input-rectangle">
											${project.project_guide }
										</textarea>
										<script type="text/javascript">
											CKEDITOR.replace('project_guide', {
											filebrowserUploadUrl : 'upload.do',
											height: '400px'
											});
										</script>
									</div>
									<div
										class="u-align-center member-info-form-group member-info-form-submit">
										<button
											style="background-color: #478ac9; color: #ffffff; margin-top: 1px; margin-bottom: 1px; padding: 10px 30px">수정</button>
										<button type="button"
											onclick="location.href='manage.needlogin.labeling.user?project_no=${project.project_no}'"
											style="background-color: #478ac9; color: #ffffff; margin-top: 1px; margin-bottom: 1px; padding: 10px 30px">참가자
											관리</button>
										<button type="button" onclick="location.href='http://192.168.0.186/${project.project_no}'"
											style="background-color: #478ac9; color: #ffffff; margin-top: 1px; margin-bottom: 1px; padding: 10px 30px">정산하기</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>