<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	const msg = "${msg}"
	
	if(msg !== ""){
		alert(msg);
		location.href="${cpath}/${url}";
	}
	else{
		location.href="${cpath}/${url}";
	}
	
	location.replace("${cpath}/${url}");
</script>

</body>
</html>