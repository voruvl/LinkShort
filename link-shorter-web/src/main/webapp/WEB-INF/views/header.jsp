<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="true"%>
<html>
<body>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<div class="row">
		<div class="col-md-8">
			<a href="links" class="btn btn-info glyphicon glyphicon-link btn-xs">
				Ссылки</a> <a href="tags"
				class="btn btn-info glyphicon glyphicon-tags btn-xs"> Тэги</a> <a
				href="login" class="btn btn-info glyphicon-log-out btn-xs"> Вход</a>
			<a href="regform"
				class="btn btn-info glyphicon glyphicon glyphicon-briefcase btn-xs">
				Регистрация</a>

		</div>
		<div class="col-md-4">
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<h5>
					Добро пожаловать : ${pageContext.request.userPrincipal.name} | <a
						href="<c:url value="/j_spring_security_logout" />"
						class="btn btn-danger glyphicon glyphicon glyphicon glyphicon-off btn-xs">
						Выход</a>
				</h5>
			</c:if>
		</div>
	</div>
	<h2 style="text-align: center">Сокращатель ссылок</h2>
</body>
</html>