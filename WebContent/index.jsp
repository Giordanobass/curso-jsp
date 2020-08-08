<jsp:useBean id="calcula" class="beans.BeanCursoJsp"
	type="beans.BeanCursoJsp" scope="page" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="myprefix" uri="WEB-INF/testetag.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Página de autenticação</title>

<link  rel="stylesheet" href="resources/css/estilo.css">

</head>
<body>
	<div class="login-page">
	<center><h3>Projeto didatico!</h3></center>
	<center><span>Usuario: admin e Senha: admin</span></center>
	
		<div class="form">
			<form action="LoginServlet" method="post" class="login-form">
				
				<img alt="login" src="resources/img/login.png" width="20px" height="20px">
				Login: 
				<input type="text" id="login" name="login"> <br />
				
				<img alt="senha" src="resources/img/senha.png" width="20px" height="20px">
				Senha: 
				<input type="password" id="senha" name="senha"> <br />
				
				<button type="submit" value="Logar">Logar</button>
			</form>
		</div>
		<center><h3>Formação Java Web</h3></center>
	</div>
</body>
</html>