<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="true"%>
<html>
<head>
<title>Вход пользователя</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.3/css/foundation.min.css">

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<style>
.error {
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: #a94442;
	background-color: #f2dede;
	border-color: #ebccd1;
}
</style>
</head>
<body onload='document.loginForm.username.focus();'>

	<h2><locale:message code="form.name_password" /></h2>
	
	<c:if test="${param.error != null}">
		<div class="error">Проверьте имя пользователя и пароль</div>
	</c:if>
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Заголовок модального окна -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h4 class="modal-title" id="myModalLabel"><locale:message code="label.login" /></h4>
			</div>
			<!-- Основная часть модального окна, содержащая форму для регистрации -->
			<div class="modal-body">

				<form name='loginForm' class="form-horizontal"
					action="<c:url value='/j_spring_security_check' />" method="post">

					<!-- 					Блок для ввода логина -->
					<div class="form-group has-feedback">
						<label for="login" class="control-label col-xs-3"><locale:message code="form.login" /></label>
						<div class="col-xs-6">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input type="text"
									class="form-control" name="username"
									placeholder=<locale:message code="form.login" /> required>
							</div>
							<span class="glyphicon form-control-feedback"></span>
						</div>
					</div>
					<!-- 					Блок для ввода пароля -->
					<div class="form-group has-feedback">
						<label for="email" class="control-label col-xs-3"><locale:message code="form.password" /></label>
						<div class="col-xs-6">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input type="password"
									class="form-control" name="password"
									placeholder=<locale:message code="form.password" /> required>
							</div>
							<span class="glyphicon form-control-feedback"></span>
						</div>
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-default" data-dismiss="modal"><locale:message code="button.login" /></button>
						<a href="links" type="button" class="btn btn-primary"><locale:message code="button.cancel" /></a> <a
							href="regform" type="button" class="btn btn-primary"><locale:message code="button.registration" /></a>

					</div>
<%-- 					<input type="hidden" name="${_csrf.parameterName}" --%>
<%-- 						value="${_csrf.token}" /> --%>
				</form>
			</div>
		</div>
	</div>

</body>
</html>