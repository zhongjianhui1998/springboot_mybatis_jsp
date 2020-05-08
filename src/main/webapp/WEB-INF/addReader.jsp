<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${pageContext.request.contextPath}/js/jquery-1.8.0.js"></script>
<title>添加页面</title>
</head>
<body bgcolor="pink">
	<div align="center">
		<form id="formId">
			<table border="1">
				<tr>
					<th><input type="text" name="reader" id="readerId"
						placeholder="请输入" /></th>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="reset" value="重置">
						<input type="button" value="提交" id="subId" /> <input
						type="button" value="返回" onclick="back()" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
	$(function() {//页面加载完成就执行以下函数
		$("#subId").click(function() {//鼠标点击事件,点击提交就执行setData函数
			setData();
		})
	});
	function setData() {
		var reader = $("#readerId").val();//得到输入的读者名称
		if ("" == reader ) {//判断是否为null
			alert("数据不能为空");
			window.close();
		} else {
			$.ajax({
				type : "post",
				url : '${pageContext.request.contextPath}/reader/add',
				data : $("#formId").serialize(),
				success : function(mark) {
					if (mark == "s") {
						alert("添加成功");
						window.location.href = "${pageContext.request.contextPath}/toWelcome";
					} else {
						alert("添加失败");
					}
				},
			});
		}
	}
	function back() {
		window.history.back();
	}
</script>
</html>