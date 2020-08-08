<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de produto</title>
<link rel="stylesheet" href="resources/css/cadastro.css">

 
 <script src="resources/javascript/jquery.min.js" type="text/javascript"></script>
 <script src="resources/javascript/jquery.maskMoney.min.js" type="text/javascript"></script>
            
</head>
<body>
<a href="acessoliberado.jsp">Inicio</a>
<a href="index.jsp">Sair</a>
	<center>
		<h1>Cadastro de Produtos</h1>
		<h3 style="color: orange;">${msg}</h3>
	</center>
	<form action="salvarProduto" method="post" id="formProduto" onsubmit="return validarCampos()? true : false;">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Código:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${produto.id}" class="field-long"></td>
					</tr>
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome" maxlength="50"
							value="${produto.nome}"></td>
					</tr>

					<tr>
						<td>Quantidade:</td>
						<td><input type="number" id=quantidade name="quantidade"
							value="${produto.quantidade}"></td>
					</tr>
					<tr>
						<td>Valor R$:</td>
						<td><input type="text" id="valor" name="valor"
							data-thousands="." data-decimal=","
							value="${produto.valorEmTexto}"></td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"> <input
							type="submit" value="Cancelar"
							onclick="document.getElementById('formProduto').action = 'salvarProduto?acao=reset'"></td>
					</tr>
				</table>
			</li>
		</ul>
	</form>
	<div class="container">
		<table class="responsive-table">
			<caption>Produtos cadastrados</caption>
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th>Quantidade</th>
				<th>Valor</th>
				<th>Delete</th>
				<th>Editar</th>
			</tr>
			<c:forEach items="${produtos}" var="produto">
				<tr>
					<td style="width:150px"><c:out value="${produto.id}"></c:out></td>
					<td style="width:150px"><c:out value="${produto.nome}"></c:out></td>
					<td style="width:150px"><c:out value="${produto.quantidade}"></c:out></td>
					<td style="width:150px"><fmt:formatNumber type="number" maxFractionDigits="2"
														value="${produto.valor}" /></td>

					<td><a href="salvarUsuario?acao=delete&produto=${produto.id}"><img
							src="resources/img/excluir.png" alt="excluir" title="Excluir"
							width="24px" height="24px"> </a></td>
					<td><a href="salvarUsuario?acao=editar&produto=${produto.id}"><img
							alt="Editar" title="Editar" src="resources/img/editar.png"
							width="24px" height="24px"></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">
	function validarCampos(){
		if(document.getElementById("nome").value == ''){
			alert('Informe o nome')
			return false;
			}
		else if(document.getElementById("quantidade").value == ''){
			alert('Informe a quantidade')
			return false;
			}
		else if(document.getElementById("valor").value == ''){
			alert('Informe o valor')
			return false;
			}
		return true;
		}
</script>
</body>
<script>
  $(function() {
    $('#valor').maskMoney();
  })
</script>
</html>