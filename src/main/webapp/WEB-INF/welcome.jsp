<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<script src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
<html>
<head>

<title>welcome.jsp</title>
<style type="text/css">
tr:hover{
  background:black;
  color:yellow;
}

</style>
</head>
<script type="text/javascript">
	$(function() {
        getReader();
	});
	function getReader() {
		$.ajax({
			type : "get",
			url : '${pageContext.request.contextPath}/reader/query',
			success : function(readList) {
				var html = "";
				$.each(readList,function(i){
					html += "<tr  height='40px'><td align='center'>"+readList[i].id+"</td>"+
					"<td  align='center'>"+readList[i].reader+"</td>"+
					"<td  align='center'>"+
					"<input type='button' value='添加' onclick=\"javascript:location.href='${pageContext.request.contextPath}/toAddReader'\">"+
					"<input type='button' value='修改' onclick=\"javascript:location.href='${pageContext.request.contextPath}/"+readList[i].id+"/getReader'\">"+
					"<input type='button' value=\"删除\"onclick=delReader('"+readList[i].id+"')>"+
					"</td></tr>";
				});
				$('#readerId').html(html);
			}
		})
	}
</script>
<body bgcolor=#FFE4C4>
	<div align="center">
		<table class="imagetable" style="font-size: 15px;">
			<tr height=10>
				<th>编号</th>
				<th>读者</th>
				<th>操作</th>
			</tr>
			<tbody id="readerId"></tbody >
		</table>
	</div>
	<hr>
</body>

<script type="text/javascript">
function delReader(id) {
	if (confirm("是否删除id为'"+id+"'的读者信息?")) {
		$.ajax({  
			url:'${pageContext.request.contextPath}/reader/delete/'+id,
            type:'POST',
            success:function(data){  
				if (data == "s") {
					alert("删除成功");
					window.location.href="${pageContext.request.contextPath}/toWelcome";
				}else{
					alert("删除失败");
				}
            }  
        })  
	}
}
</script>
</html>