<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="locale"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Сcылки</title>
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
		<nav role="navigation" class="navbar navbar-default">
			<div class="nav navbar-nav navbar-right">
				<span  class="navbar-brand"><locale:message code="form.lang" />: </span>
				<a href="?lang=en" class="navbar-brand">En</a> <span class="navbar-brand">|</span>
				<a href="?lang=ru" class="navbar-brand">Ru</a>

			</div>
		</nav>

		<jsp:include page="header.jsp" />
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form class="form-horizontal" role="form" action="addLink"
				method="get" id="dialog">

				<div class="form-group">
					<label class="col-sm-2 control-label"><locale:message
							code="label.url_link" /></label>
					<div class="col-sm-10">
						<input id="fullLink" name="fullLink" class="form-control"
							type="text" placeholder="http://www.google.com" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><locale:message
							code="table.description" /></label>
					<div class="col-sm-10">
						<textarea class="form-control" rows="2" name="description"
							placeholder="Лучший поисковик Iнэта"></textarea>

					</div>
				</div>
				<input type="hidden" id="login" name="login"
					value="${pageContext.request.userPrincipal.name}">
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button class="btn btn-primary" type="submit">
							<locale:message code="button.insert" />
							<span class="glyphicon glyphicon-save"></span>
						</button>
					</div>
				</div>
			</form>
		</c:if>
		<table id="links" class="table table-bordered">
			<thead>
				<tr class="danger">
					<th style="width: 3%">№</th>
					<%--	<th>Full link</th>--%>
					<th style="width: 20%"><locale:message code="table.short_link" /></th>
					<th style="width: 15%"><locale:message
							code="table.description" /></th>
					<th style="width: 15%"><locale:message code="table.tags" /></th>
					<th style="width: 10%"><locale:message code="table.autor" /></th>
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<th style="width: 8%"><locale:message code="table.count" /></th>
						<th style="width: 5%"></th>
					</c:if>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${links}" var="link" varStatus="loop">
					<tr>
						<td>${loop.index+1}.</td>
						<%-- 		<td>${link.fullLink}</td>   --%>
						<td><a
							href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/rd?sl=${link.shortLink}">
								${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/rd?sl=${link.shortLink}
						</a></td>
						<td>${link.description}</td>
						<td><c:forEach items="${link.tags}" var="tag"
								varStatus="loop">
								<a href="listLink?idTag=${tag.id}" title="list links"
									class="btn btn-default btn-xs active" role="button"> <span
									class="glyphicon glyphicon-tag"></span><u>${tag.name}</u>
								</a>
							</c:forEach></td>
						<td>${link.user.login}</td>
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<td>${link.count}</td>
							<td><a href="editTag?idLink=${link.id} "
								class="btn btn-success btn-xs"><locale:message
										code="button.tags" /> <span class="glyphicon glyphicon-edit"></span></a></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
