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
   <section class="u-clearfix u-section-1" id="sec-b5df">
      <div class="u-clearfix u-sheet u-sheet-1">
         <div class="u-expanded-width u-table u-table-responsive u-table-1">
            <table class="u-table-entity u-table-entity-1">
               <tbody class="u-table-body">
                  <tr style="height: 80px;">
                  	<td align="center" style="font-size: 25pt; font-weight: bold; width:240px;"
                        class="u-border-2 u-border-white u-palette-1-light-2 u-table-cell u-table-cell-2">번들 제목</td>
                     <td align="center" style="font-size: 25pt;"
                        class="u-border-2 u-border-no-left u-border-no-right u-border-white u-palette-1-light-2 u-table-cell u-table-cell-1">${bundle.bundle_folder_name }</td>
                  </tr>
                  <tr>
                     <td colspan="2"
                        class="u-border-2 u-border-no-left u-border-no-right u-border-white u-palette-1-light-2 u-table-cell u-table-cell-1">
                        <form action="get.needlogin.bundle.data">
                           <input name="data_where" type="hidden"
                              value="${data.data_where }"> <input
                              name="bundle_uploaded_filename" type="hidden"
                              value="${bundle.bundle_uploaded_filename }"> <input
                              name="bundle_folder_name" type="hidden"
                              value="${bundle.bundle_folder_name }"> <input
                              type="hidden" value="${data.data_activation }"> <input
                              name="data_name" style="width: 300px;">
                           <button id="ssBtn">검색</button>
                        </form>
                     </td>
                  </tr>
                  <tr>
                     <td colspan="2"><c:choose>
                           <c:when test="${data_name != null && data_activation == 49}">
                              <c:set var="folderName"
                                 value="${bundle.bundle_uploaded_filename}" />
                              <c:set var="length" value="${fn:length(folderName)}" />
                              <div class="u-align-center"><img id="searchImg"
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
                                 <button id="getData">비활성화</button>
                              </form>
                              </div>
                           </c:when>
                           <c:when test="${data_activation == 48 }">
                  비활성화 된 파일입니다.
               </c:when>
                        </c:choose></td>
                  </tr>
               </tbody>
            </table>
            <button id="getData"
               onclick="getReportedFile('${param.data_where}', 0)">신고된
               데이터</button>
            <section class="u-clearfix u-section-1" id="sec-b5df">
               <div class="u-clearfix u-sheet u-sheet-1">
                  <div class="u-expanded-width u-table u-table-responsive u-table-1">
                     <table id="reportedDataTable"
                        style="margin-left: auto; margin-right: auto;"
                        class="u-table-entity u-table-entity-1">
                        <tbody id="tableBody" class="u-table-body">
                           <!-- 로우가 추가됩니다 -->
                        </tbody>
                     </table>
                  </div>
               </div>
            </section>
         </div>
      </div>
   </section>
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
                   $("#reportedDataTable").append("<thead><tr><th>&nbsp;이미지 번호&nbsp;</th><th>&nbsp;신고된 이미지&nbsp;</th><th>&nbsp;신고한 유저&nbsp;</th><th>&nbsp;신고 내용&nbsp;</th><th>&nbsp;신고 날짜&nbsp;</th></tr></thead>")
                  
                   $(datas).each((a, b) => {
                        let t = '${bundle.bundle_uploaded_filename }';
                        t = t.substring(0, t.length - 4);
                        
                        let str = b.report_data;
                        let fileNo = str.substr(str.indexOf('_') + 1, 8);
                        console.log(str.length)
                        
                        let reportDate = new Date(b.report_date);
                        let yyyy = reportDate.getFullYear();
                        let mm = reportDate.getMonth() + 1;
                        let dd = reportDate.getDate();
                       
                        let newRow = $('<tr></tr>');
                        newRow.append('<td class="u-border-2 u-border-no-left u-border-no-right u-border-palette-1-light-2 u-table-cell"><center>' + fileNo + '</center></td>');
                        newRow.append('<td class="u-border-2 u-border-no-left u-border-no-right u-border-palette-1-light-2 u-table-cell"><center><img src="resources/data/${sessionScope.loginUserID}/' + t + '/' + b.report_data + '"></center></td>');
                        newRow.append('<td class="u-border-2 u-border-no-left u-border-no-right u-border-palette-1-light-2 u-table-cell"><center>' + b.report_by + '</center></td>');
                        newRow.append('<td class="u-border-2 u-border-no-left u-border-no-right u-border-palette-1-light-2 u-table-cell"><center>' + b.report_content + '</center></td>');
                        newRow.append('<td class="u-border-2 u-border-no-left u-border-no-right u-border-palette-1-light-2 u-table-cell"><center>' + yyyy + '년 ' + mm + '월 ' + dd + '일 ' + '</center></td>');
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