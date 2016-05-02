<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="true"%>
<html>
<head>
<title>Выбор тэга</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.3/css/foundation.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<style>
.jumbotron {
	margin: 10px 0;
	text-align: center;
}
</style>
</head>
<body>
	<div class="panel-footer">
		<jsp:include page="header.jsp" />
		<div class="jumbotron">
			<h3>
				<locale:message code="form.screen" /> <span style="color: red; text-transform: uppercase;">
					${link.description}</span>
			</h3>
			<img class="img-thumbnail"
				src="http://mini.s-shot.ru/1024x768/200/jpeg/?${link.fullLink}">
		</div>
		<form class="form-inline" action="addTagInLink" method="get"
			id="dialog">
<!-- 			<div class="container"> -->
				<div class="row">
					<div class="col-md-6">
						<h3><locale:message code="form.add_tag" /></h3>
						<c:forEach items="${tags}" var="tag" varStatus="loop">
							<a href="editTagToLink?idLink=${link.id}&idTag=${tag.id} "
								class="btn btn-default btn-xs"><span
								class="glyphicon glyphicon-tag"></span> ${tag.name} </a>
						</c:forEach>
					</div>
					<div class="col-md-6">
						<h3><locale:message code="form.del_tag" /></h3>
						<c:forEach items="${link.tags}" var="tag" varStatus="loop">
							<a href="deleteTagFromLink?idLink=${link.id}&idTag=${tag.id} "
								class="btn btn-default btn-xs"><span
								class="glyphicon glyphicon-tag"></span> ${tag.name} </a>
						</c:forEach>
					</div>
				</div>
<!-- 			</div> -->
			<br>
			<center>
				<a href="links" class="btn btn-primary"> Ok <span
					class="glyphicon glyphicon-ok"></span>
				</a>
			</center>
		</form>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>