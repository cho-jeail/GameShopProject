<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Error Page</title>
</head>
<body>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<script type="text/javascript">
	cpath = '${cpath }';
    alert('${errorText }');
    location.replace(cpath + '${UriPath }');
</script>
</body>
</html>