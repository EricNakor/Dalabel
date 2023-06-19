<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

${projectDetailInfo.project_no }<hr>
${projectDetailInfo.project_title }<hr>
${projectDetailInfo.project_requestor }<hr>
${projectDetailInfo.project_access_level }<hr>
${projectDetailInfo.project_guide }<hr>
${projectDetailInfo.project_how }<hr>
${projectDetailInfo.project_category }<hr>
${projectDetailInfo.project_progress }<hr>
${projectDetailInfo.project_bundle_no }<hr>
대충 라벨링 페이지
<br>
<img class="problem" src="" alt="파일못찾음">


<div class="userInput">
	
</div>

<script type="text/javascript">

	function submitLabel(labelInfo){
		let v = $(".problem").attr("src").split("/");
		let no = v[v.length-1];
		$.ajax({
			type:"get",
			url:"doLabeling.needlogin.next",
			data:{
				worked_by:"${sessionScope.loginUserID}",
				data_no: no,
				project_no:"${projectDetailInfo.project_no}",
				label: labelInfo
			},
			success: function(nextData){
				$(".problem").attr("src", "resources/data/${projectDetailInfo.project_requestor}/${filePath}/"+nextData);
			}
		})
	}
	
	function submitInput(){
		let inputvalue = $(".inputvalue").val();
		submitLabel(inputvalue);
		return false;
	}
	
	$(function(){
		let info =${projectDetailInfo.project_category};
		if(info.type == 'input'){			
			$(".userInput").append('<form action="/" onsubmit="return submitInput();" ><input class="inputvalue"><button>제출하기</button></form>')
		}else if(info.type=='button'){
			for(let i=0;i<info.info.length;i++){
				$(".userInput").append(
					'<button onclick="submitLabel('+i+')">'+info.info[i]+'</button>'+"<hr>"
				)
			}
		}
		
		$.ajax({
			type:"get",
			url:"doLabeling.needlogin.next",
			data:{
				worked_by:"${sessionScope.loginUserID}",
				project_no:"${projectDetailInfo.project_no}",
			},
			success: function(nextData){
				$(".problem").attr("src", "resources/data/${projectDetailInfo.project_requestor}/${filePath}/"+nextData).css("width", "5 00px").css("height", "300px");
			}
		})
	})

</script>