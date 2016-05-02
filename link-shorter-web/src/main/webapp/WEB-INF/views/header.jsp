<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="true"%>
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
<<<<<<< HEAD
	<nav role="navigation" class="navbar navbar-default">
		<div class="navbar-header">
			<span class="navbar-brand"  style="font:30 pt; text-transform: uppercase;"><locale:message
					code="label.name_page" /></span>
=======
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
	<div class="row">
		<div class="col-md-8">
			<a href="links" class="btn btn-info glyphicon glyphicon-link btn-xs">
				Ссылки</a> <a href="tags"
				class="btn btn-info glyphicon glyphicon-tags btn-xs"> Тэги</a> <a
				href="login" class="btn btn-info glyphicon glyphicon-log-in btn-xs"> Вход</a>
			<a href="regform"
				class="btn btn-info glyphicon glyphicon glyphicon-briefcase btn-xs">
				Регистрация</a>

>>>>>>> branch 'master' of https://github.com/voruvl/LinkShort.git
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="login"><span class="glyphicon glyphicon-log-in">
						<locale:message code="button.login" />
				</span></a></li>
			<li><a href="regform"><span
					class="glyphicon glyphicon-briefcase"> <locale:message
							code="button.registration" /></span></a></li>
		</ul>
	</nav>
	<nav role="navigation" class="navbar navbar-inverse">
		<div id="navbarCollapse" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li><a href="links"><span class="glyphicon glyphicon-link">
							<locale:message code="button.links" />
					</span></a></li>
				<li><a href="tags"><span class="glyphicon glyphicon-tags">
							<locale:message code="button.tags" />
					</span></a></li>
			</ul>
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				<ul class="nav navbar-nav navbar-right">
					<li><span class="navbar-brand"><locale:message
								code="label.welcome" /> :
							${pageContext.request.userPrincipal.name} </span></li>
					<li><a href="<c:url value="/j_spring_security_logout" />"><span
							class="glyphicon glyphicon-off"> <locale:message
									code="label.logout" /></span></a></li>
				</ul>
			</c:if>
		</div>
	</nav>
</body>
</html>
