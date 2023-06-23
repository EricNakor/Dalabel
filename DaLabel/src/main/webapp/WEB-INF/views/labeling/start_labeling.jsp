<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script type="text/javascript">
	function submitLabel(labelInfo) {
		let v = $(".problem").attr("src").split("/");
		let no = v[v.length - 1];
		$.ajax({
			type : "get",
			url : "doLabeling.needlogin.next",
			data : {
				worked_by : "${sessionScope.loginUserID}",
				data_no : no,
				project_no : "${projectDetailInfo.project_no}",
				label : labelInfo
			},
			success : function(nextData) {
				$(".problem").attr(
						"src",
						"resources/data/${projectDetailInfo.project_requestor}/${filePath}/"
								+ nextData);
			}
		})
	}

	function submitInput() {
		let inputvalue = $(".inputvalue").val();
		submitLabel(inputvalue);
		return false;
	}

	$(function() {
		let info = ${projectDetailInfo.project_category};
		
		if (info.type == 'input') {
			$(".userInput")
					.append(
							'<form action="/" onsubmit="return submitInput();" ><input class="inputvalue"><button>제출하기</button></form>')
		} else if (info.type == 'button') {
			for (let i = 0; i < info.info.length; i++) {
				$(".userInput").append(
						'<button onclick="submitLabel(' + i + ')">'
								+ info.info[i] + '</button>' + "<hr>")
			}
		}

		$.ajax({
			type : "get",
			url : "doLabeling.needlogin.next",
			data : {
				worked_by : "${sessionScope.loginUserID}",
				project_no : "${projectDetailInfo.project_no}",
			},
			success : function(nextData) {
				if (nextData) {
					$(".problem").attr(
							"src",
							"resources/data/${projectDetailInfo.project_requestor}/${filePath}/"
									+ nextData).attr("id", "searchImg")
				} else {
				}
			}
		})
	})
	function reportArea() {
		let v = $(".problem").attr("src").split("/");
		let no = v[v.length - 1];
		$.ajax({
			type : "post",
			url : "doLabeling.needlogin.report",
			data : {
				report_by : "${sessionScope.loginUserID}",
				report_content : $("#reportTextArea").val(),
				report_data : no,
				report_project_no : "${projectDetailInfo.project_no}"
			},
			success : function() {
				alert("아무 결과값이나 넣어주세요. ")
				document.getElementById("reportArea").style.display = "none";
				$("#reportTextArea").val('');
			}
		})
	}

	function reportData() {
		var reportArea = document.getElementById("reportArea");
		reportArea.style.display = "block";
	}
</script>
</head>
<body class="u-body u-xl-mode">
	<section class="u-align-center u-clearfix u-section-2">
		<div class="u-clearfix u-sheet u-sheet-1">
			<div class="u-table u-table-responsive u-table-1">
				<table class="u-table-entity u-table-entity-1">
					<tbody class="u-table-body">
						<tr style="height: 60px;">
							<td align="left"
								class="u-border-2 u-border-no-left u-border-no-right u-border-white u-palette-1-light-2 u-table-cell u-table-cell-1">${projectDetailInfo.project_title }</td>
						</tr>
						<tr style="height: 50px;">
							<td
								class="u-border-2 u-border-no-left u-border-no-right u-border-white u-table-cell"
								align="right">
								<!-- 신고버튼 --> <input type="image" src="resources/css/siren.jpg"
								style="width: 50px; height: 50px;" onclick="reportData()">
								<div id="reportArea" style="display: none;">
									<textarea id="reportTextArea"
										placeholder="신고 사유를 입력해주세요." maxlength="500"></textarea>
									<input class="reportBtn" type="button" value="신고" onclick="reportArea()">
								</div> <!-- 신고버튼 -->

							</td>
						</tr>

						<tr>
							<td align="center"
								class="u-border-2 u-border-no-left u-border-no-right u-border-white u-table-cell"><img
								class="problem" src="" alt="파일못찾음"></td>
						</tr>
						<tr>
							<td align="center" class="u-border-2 u-border-no-left u-border-no-right u-border-palette-1-light-2 u-table-cell"><div class="userInput"></div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</section>
</body>
</html>
