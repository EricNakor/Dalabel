<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<table id="reportedDataTable">
		<tr>
			<td>
				<button id="getData"
					onclick="getReportedFile(${param.data_where}, 0)">데이터 가져오기</button>
				<div id="list"></div>
			</td>
		</tr>
	</table>
</body>

<script type="text/javascript">
	function getReportedFile(bundle_no, report_no){
		$.ajax({
			type : "get",
			url : "data.needlogin.get.reported",
			data : {
				bundle_no : "${param.data_where}",
				report_no : report_no
			},
			success : function(datas){
				if(datas.length>0){
				console.log(datas);
				$(datas).each((a,b)=>{
					let t = "${bundle.bundle_uploaded_filename }";
					t = t.substring(0,t.length-4);
					let report_obj = $("<div></div>");
					report_obj.append("<img src="+"resources/data/${sessionScope.loginUserID}/"+t+"/"+b.report_data+">"+b.report_by+b.report_content+b.report_date)
					$("#list").append(report_obj);
				})
				let last_no = datas[datas.length-1].report_no;
 				$("#getData").attr("onclick", "getReportedFile(${param.data_where},"+last_no+");" );
				}
			}
		})
	}
</script>
</html>