<jsp:useBean id="calcula" class="beans.Usuario" type="beans.Usuario" scope="page"></jsp:useBean>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cabeçalho</title>
</head>
<body>
	<jsp:setProperty property="*" name="calcula"/>
	<h3>Cabecalho</h3>
		
		${sessionScope.user }
</body>
</html>