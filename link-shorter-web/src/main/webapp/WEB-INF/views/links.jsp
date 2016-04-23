<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<jsp:include page="header.jsp" />
		<c:if test="${pageContext.request.userPrincipal.name != null}">
			<form class="form-horizontal" role="form" action="addLink"
				method="get" id="dialog">

				<div class="form-group">
					<label class="col-sm-2 control-label">URL ссылки</label>
					<div class="col-sm-10">
						<input id="fullLink" name="fullLink" class="form-control"
							type="text" placeholder="http://www.google.com" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Описание</label>
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
							Вставить <span class="glyphicon glyphicon-save"></span>
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
					<th style="width: 20%">Сокращенная ссылка</th>
					<th style="width: 15%">Описание</th>
					<th style="width: 15%">Тэги</th>
					<th style="width: 10%">Автор ссылки</th>
					<c:if test="${pageContext.request.userPrincipal.name != null}">
						<th style="width: 8%">Статистика переходов</th>
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
								<a href="listLink?idTag=${tag.id}" title="Список ссылок"
									class="btn btn-default btn-xs active" role="button"> <span
									class="glyphicon glyphicon-tag"></span><u>${tag.name}</u>
								</a>
							</c:forEach></td>
						<td>${link.user.login}</td>
						<c:if test="${pageContext.request.userPrincipal.name != null}">
							<td>${link.count}</td>
							<td><a href="editTag?idLink=${link.id} "
								class="btn btn-success btn-xs">Тэги <span
									class="glyphicon glyphicon-edit"></span></a></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
