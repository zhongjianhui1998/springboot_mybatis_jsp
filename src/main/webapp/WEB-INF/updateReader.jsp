<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改页面</title>
</head>
<body bgcolor="pink">
<div align="center">
	<form action="${pageContext.request.contextPath}/reader/update" method="post">
		<c:forEach var="readerList" items="${readerList}">
			<input type="hidden" name="id" value="${readerList.getId()}"/>
			<table border="1">
				<tr>
					<th>新读者:</th>
					<th><input id="reader" type="text" name="reader" placeholder="${readerList.getReader()}"/></th>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="reset" value="重置">
						<input type="submit" value="修改"/>
						<input type="button" value="返回" onclick="back()">
					</td>
				</tr>
			</table>
		</c:forEach>
	</form>
</div>
</body>
<script type="text/javascript">
	// var value = document.getElementById("reader").value;
	// alert(value);
	// if("" == value) {
	// 	alert("不能为空");
	// 	window.history.back();
	// }
	// function back(){
	// 	window.history.back();
	// }
</script>
</html>