<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
</head>
<body class="u-body u-xl-mode">
	<div>${bundle.bundle_folder_name }</div>
	<table>
		<tr>
			<td>
				<form action="get.needlogin.bundle.data">
					<input name="data_where" type="hidden" value="${data.data_where }">
					<input name="bundle_uploaded_filename" type="hidden"
						value="${bundle.bundle_uploaded_filename }"> <input
						name="bundle_folder_name" type="hidden"
						value="${bundle.bundle_folder_name }"> <input
						type="hidden" value="${data.data_activation }"> <input
						name="data_name">
					<button>검색</button>
				</form>
			</td>
		</tr>
		<tr>
			<td><c:choose>
					<c:when test="${data_name != null && data_activation == 49}">
						<c:set var="folderName" value="${bundle.bundle_uploaded_filename}" />
						<c:set var="length" value="${fn:length(folderName)}" />
						<img
							src="resources/data/${sessionScope.loginUserID }/${fn:substring(folderName, 0, length-4)}/${data_name }"
							alt="없는(비활성화) 파일입니다.">
						<br>
						<form action="delete.needlogin.data?">
							<input name="data_where" type="hidden"
								value="${data.data_where }"> <input
								name="bundle_folder_name" type="hidden"
								value="${bundle.bundle_folder_name }"> <input
								name="bundle_uploaded_filename" type="hidden"
								value="${bundle.bundle_uploaded_filename }"> <input
								type="hidden" value="${data_name }" name="data_name">
							<button>비활성화</button>
						</form>
					</c:when>
					<c:when test="${data_activation == 48 }">
						비활성화 된 파일입니다.
					</c:when>
				</c:choose></td>
		</tr>
	</table>
	<button id="getData"
		onclick="getReportedFile('${param.data_where}', 0)">신고된 데이터</button>
	<table id="reportedDataTable" border="1" style="border:1px solid black;margin-left:auto;margin-right:auto;">
		<tbody id="tableBody">
			<!-- 로우가 추가됩니다 -->
		</tbody>
	</table>
</body>

<script type="text/javascript">
	function getReportedFile(bundle_no, report_no) {
	    $.ajax({
	        type: 'get',
	        url: 'data.needlogin.get.reported',
	        data: {
	            bundle_no: '${param.data_where}',
	            report_no: report_no,
	        },
	        success: function (datas) {
	            if (datas.length > 0) {
	                console.log(datas);
	                $("#reportedDataTable").append("<thead><tr><th>&nbsp;신고된 이미지&nbsp;</th><th>&nbsp;신고한 유저&nbsp;</th><th>&nbsp;신고 내용&nbsp;</th><th>&nbsp;신고 날짜&nbsp;</th></tr></thead>")
	                
	                $(datas).each((a, b) => {
                        let t = '${bundle.bundle_uploaded_filename }';
                        t = t.substring(0, t.length - 4);
                        let reportDate = new Date(b.report_date);
                        let yyyy = reportDate.getFullYear();
                        let mm = reportDate.getMonth() + 1;
                        let dd = reportDate.getDate();

                        let newRow = $('<tr></tr>');
                        newRow.append('<td><center><img src="resources/data/${sessionScope.loginUserID}/' + t + '/' + b.report_data + '"></center></td>');
                        newRow.append('<td><center>' + b.report_by + '</center></td>');
                        newRow.append('<td><center>' + b.report_content + '</center></td>');
                        newRow.append('<td><center>' + yyyy + '년 ' + mm + '월 ' + dd + '일 ' + '</center></td>');
                        $('#tableBody').append(newRow);
                    });
                    let last_no = datas[datas.length - 1].report_no;
                    $('#getData').attr('onclick', 'getReportedFile(${param.data_where},' + last_no + ');');
	            }
	        },
	    });
	}
  </script>
</html>