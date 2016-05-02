<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="true"%>
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
<body>
	<h2><locale:message code="form.reg_user" /></h2>

	<c:if test="${not empty passwordfail}">
		<div class="error">${passwordfail}</div>
	</c:if>
	<c:if test="${not empty usernamefail}">
		<div class="error">${usernamefail}</div>
	</c:if>
	<div class="modal-dialog">
		<div class="modal-content">
			<!-- Заголовок модального окна -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h4 class="modal-title" id="myModalLabel"><locale:message code="form.reg_user" /></h4>
			</div>
			<!-- Основная часть модального окна, содержащая форму для регистрации -->
			<div class="modal-body">
				<!-- Форма для регистрации -->
				<form action="adduser" method="post" role="form" class="form-horizontal">
					<!-- Блок для ввода логина -->
					<div class="form-group has-feedback">
						<label for="login" class="control-label col-xs-3"><locale:message code="label.login" /></label>
						<div class="col-xs-6">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span> <input type="text"
									class="form-control" required="required" name="login" placeholder="Придумай имя себе">
							</div>
							<span class="glyphicon form-control-feedback"></span>
						</div>
					</div>
					<!-- Блок для ввода пароля -->
					<div class="form-group has-feedback">
						<label for="email" class="control-label col-xs-3"><locale:message code="form.password" /></label>
						<div class="col-xs-6">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input type="password"
									class="form-control" required="required" name="password" placeholder="Введите пароль">
							</div>
							<span class="glyphicon form-control-feedback"></span>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label for="email" class="control-label col-xs-3"><locale:message code="form.confirm_password" /></label>
						<div class="col-xs-6">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-lock"></i></span> <input type="password"
									class="form-control" required="required" name="confirmpassword" placeholder="И еще раз тот же пароль">
							</div>
							<span class="glyphicon form-control-feedback"></span>
						</div>
					</div>
					<div class="modal-footer">

						<button id="save" type="submit" class="btn btn-primary"><locale:message code="button.registration" /></button>
						<a href="links" type="button" class="btn btn-primary"><locale:message code="button.cancel" /></a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>