<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Тэги</title>
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
		<form class="form-inline" action="addTag" method="get" id="dialog">
			<div class="form-group">
				<label>Название тэга</label> <input id="nameTag" name="nameTag"
					type="text" placeholder="бла-бла-бла" />
			</div>
			<button class="btn btn-primary" type="submit">
				Добавить <span class="glyphicon glyphicon-save"></span>
			</button>

		</form>
		<table id="tags" class="table table-bordered">
			<thead>
				<tr class="danger">
					<th>№</th>
					<th>Название тэга</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${tags}" var="tag" varStatus="loop">
					<tr>
						<td>${loop.index+1}.</td>
						<td>${tag.name}</td>

						<%-- 	<td><a href="deleteTag?id=${link.id}"
								class="btn btn-danger btn-xs">Удалить тэг <span
									class="glyphicon glyphicon-remove"></span></a></td>
 --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>
