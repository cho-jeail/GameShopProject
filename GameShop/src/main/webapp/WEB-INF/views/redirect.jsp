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
	
	if(msg === "회원가입 성공"){
		alert("회원가입에 성공하셨습니다.");
		location.href="${cpath}/${url}";
	}
	else if(msg === "회원가입 실패"){
		alert("회원가입에 실패하셨습니다. 잠시 후 다시 시도해주세요.");
		location.href="${cpath}/${url}";
	}
	else if(msg === "로그인성공"){
		location.href="${cpath}/${url}";
	}
	else if(msg === "메일발송"){
		alert("이메일이 발송되었습니다.");
		location.href="${cpath}/${url}";
	}
	
	location.replace("${cpath}/${url}");
</script>

</body>
</html>