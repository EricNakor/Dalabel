<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function alertJoin(no) {
		alert("신청되었습니다")
		location.href = "doLabeling.needlogin.askjoin?project_no=" + no
	}
	
	function moveStart(no){
		location.href="doLabeling.needlogin.start?project_no="+no
	}
</script>
</head>
<body class="u-body u-xl-mode">
	<section class="u-align-center u-clearfix u-section-2" id="sec-30ba">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div class="u-table u-table-responsive u-table-1">
				<table class="u-table-entity u-table-entity-1">
					<colgroup>
						<col width="20%">
						<col width="20%">
						<col width="30%">
						<col width="30%">
					</colgroup>
					<tbody class="u-table-body">
						<tr style="height: 60px;">
							<td align="center"
								class="u-border-2 u-border-no-left u-border-no-right u-border-white u-palette-1-light-2 u-table-cell u-table-cell-1">프로젝트명
							</td>
							<td colspan="3"
								class="u-border-2 u-border-white u-palette-1-light-2 u-table-cell u-table-cell-2">${project.project_title }</td>
						</tr>
						<tr>
							<td colspan="4" align="center"
								class="u-border-2 u-border-no-left u-border-no-right u-border-white u-table-cell">${project.project_guide }</td>
						</tr>
						<tr><td class="u-border-2 u-border-no-left u-border-no-right u-border-palette-1-light-2 u-table-cell"></td></tr>
						<tr>
							<td colspan="4" align="center"
								class="u-border-2 u-border-no-left u-border-no-right u-border-palette-1-light-2 u-table-cell">
								<c:if test="${param.flag eq 1 }">
									<div>
										<button class="labelBtn"
											onclick="alertJoin(${project.project_no });">신청하기</button>
									</div>
								</c:if> <c:if test="${param.flag eq 2 }">
									<div>
										<button class="labelBtn"
											onclick="moveStart(${project.project_no });">시작하기</button>
									</div>
								</c:if>

							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>

</body>
</html>