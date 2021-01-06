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
		alert("${mail}로 메일이 발송되었습니다.");
		location.href="${cpath}/${url}";
	}
	else if(msg === "정보수정실패"){
		alert("회원정보 수정이 실패했습니다.");
		location.href="${cpath}/${url}";
	}
	else if(msg === "정보수정성공"){
		alert("회원정보 수정완료.");
		location.href="${cpath}/${url}";
	}
	else if(msg === "탈퇴완료"){
		alert("회원탈되가 완료되었습니다.");
		location.href="${cpath}/${url}";
	}
	else if(msg === "탈퇴실패"){
		alert("오류로 인하여 탈퇴가 실패되었습니다.");
		location.href="${cpath}/${url}";
	}
	else if(msg === "쿠폰등록"){
		alert("쿠폰이 등록되었습니다. 쿠폰내역을 클릭하여 확인해주세요.");
		location.href="${cpath}/${url}";
	}
	else if(msg === "쿠폰등록실패"){
		alert("오류로 인하여 쿠폰등록이 실패하였습니다. 잠시후 다시 시도해주세요.");
		location.href="${cpath}/${url}";
	}
	else if(msg === "쿠폰없음"){
		alert("쿠폰번호가 존재하지 않습니다.");
		location.href="${cpath}/${url}";
	}
	else if(msg === "쿠폰중복"){
		alert("이미 등록된 쿠폰입니다. 내역을 확인바랍니다.");
		location.href="${cpath}/${url}";
	}
	else if(msg === "로그인필요"){
		alert("로그인이 필요합니다.");
		location.href="${cpath}/${url}";
	}
	
	location.replace("${cpath}/${url}");
</script>

</body>
</html>