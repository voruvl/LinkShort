<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Links</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.3/css/foundation.min.css">

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>
</style>
</head>
<body>
	<div class="panel-footer">
		<jsp:include page="header.jsp" />
		Все ссылки c тэгом <span style="color: red; ">#${selectTag.name}</span>     
		<table id="links" class="table table-bordered">
			<thead>
				<tr class="danger">
					<th>№</th>
					<%--	<th>Full link</th>--%>
					<th>Сокращенная ссылка</th>
					<th>Описание</th>
					<th>Автор ссылки</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listLink}" var="link" varStatus="loop">
					<tr>
						<td>${loop.index+1}.</td>
						<%-- 		<td>${link.fullLink}</td>   --%>
						<td><a
							href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/rd?sl=${link.shortLink}">
								${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/rd?sl=${link.shortLink}
						</a></td>
						<td>${link.description}</td>
						<td>${link.user.login}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>