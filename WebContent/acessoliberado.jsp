 <jsp:useBean id="calcula"  class="beans.Usuario" type="beans.Usuario" scope="page"/> 
  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Acesso liberado</title>
</head> 
<body>
	<center>
	<jsp:setProperty property="*" name="calcula"/>  
	<h3>Seja bem vindo ao sistema em jsp</h3>
	
	<table>
		<tr>
			<td><a href="salvarUsuario?acao=listartodos">
			<img width="100px" height="100px" title="Cadastro de usuário" alt="Cadastro de usuário" src="resources/img/User-Executive-Green-icon.png"> </a></td>
			
			<td><a href="salvarProduto?acao=listartodos">
			<img width="100px" height="100px" title="Cadastro de produtos" alt="Cadastro de produtos" src="resources/img/Cart-icon.png"> </a></td>
		</tr>
	</table>
	 
	 
	</center>
	</body>
</html>