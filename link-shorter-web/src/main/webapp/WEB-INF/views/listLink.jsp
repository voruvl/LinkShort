<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="locale"%>
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
		<locale:message code="label.list_whith_tag" /> <span style="color: red; ">#${selectTag.name}</span>     
		<table id="links" class="table table-bordered">
			<thead>
				<tr class="danger">
					<th>№</th>
					<%--	<th>Full link</th>--%>
					<th><locale:message code="table.short_link" /></th>
					<th><locale:message code="table.description" /></th>
					<th><locale:message code="table.autor" /></th>
								
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