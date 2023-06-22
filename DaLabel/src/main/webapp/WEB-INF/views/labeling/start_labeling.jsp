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
									+ nextData).css("width", "5 00px").css(
							"height", "300px");
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
${projectDetailInfo.project_title }<hr>
<br>
<img class="problem" src="" alt="파일못찾음">

<!-- 신고버튼 -->
<input type="button" value="데이터 신고" onclick="reportData()">
<div id="reportArea" style="display: none;">
	<textarea id="reportTextArea" cols="100" rows="5"
		placeholder="신고 사유를 입력해주세요." maxlength="500"></textarea>
	<input type="button" value="신고" onclick="reportArea()">
</div>
<hr>
<!-- 신고버튼 -->



<div class="userInput">
	
</div>

</body>
</html>
