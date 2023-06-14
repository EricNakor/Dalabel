<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="resources/js/jQuery.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="resources/js/ajax.js"></script>
<script type="text/javascript">
    $(function() {
        $.ajax({
            url : 'test.arr',
            success : function(arr) {
                box(arr).reloadSlider()
//                 $('#slider-next').click(function() {
//                 })
            }
        })
//         fetch('test.arr').then(res => res.json()).then(ret => {
//             box(ret).reloadSlider()
//         })
    })
</script>
</head>
<body>
    <div>
        <p>
            <a href="" id="slider-next"></a>
        </p>
    </div>
    <div class="slider"></div>
</body>
</html>