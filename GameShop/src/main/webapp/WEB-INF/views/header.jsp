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
			<input type="button" onclick="">
		</div>
		<div class="Menu">
			<ul>
				<li>
					<a></a>
				</li>
				<li>
					<a></a>
				</li>
				<li>
					<a></a>
				</li>
				<li>
					<a></a>
				</li>
			</ul>
		</div>
	</header>