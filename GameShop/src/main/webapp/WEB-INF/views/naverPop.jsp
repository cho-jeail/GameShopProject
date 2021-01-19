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
<form name="popupForm" action="${cpath }/">

</form>
<script>
	var childForm = document.forms.popupForm;
	opener.name = "parentPage"; // 네이버 로그인 버튼 클릭한 페이지
	childForm.target = opener.name;
	childForm.submit();
	self.close();
</script>
</body>
</html>