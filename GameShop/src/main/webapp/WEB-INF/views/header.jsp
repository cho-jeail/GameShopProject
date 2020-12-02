<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GAMESHOP</title>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<link rel="stylesheet" type="text/css" href="${cpath }/css/main.css">
</head>
<body>
	<script type="text/javascript">
		cpath = '${cpath}';
	</script>
	<header>
		<div class="LOGO">
			<a href="#">
				<img alt="" src="">
			</a>
		</div>
		<div class="SearchBar">
			<input type="text" id="SearchWord" placeholder="검색">
			<input type="button" onclick="" value="돋보기 그림">
		</div>
		<div class="LoginArea">
			<input type="button" onclick="" id="Login" value="로그인">
			<input type="button" onclick="" id="AddAccount" value="회원가입">
		</div>
		<div class="Menu">
			<ul>
				<li>
					<a href="#">HOME</a>
				</li>
				<li>
					<a href="#">INFO</a>
				</li>
				<li>
					<a href="#">STORE</a>
				</li>
				<li>
					<a href="#">고객센터</a>
				</li>
			</ul>
		</div>
	</header>