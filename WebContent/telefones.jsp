<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de usuário</title>
<link rel="stylesheet" href="resources/css/cadastro.css">
</head>
<body>
	<a href="acessoliberado.jsp">Inicio</a>
	<a href="index.jsp">Sair</a>
	<center>
		<h1>Cadastro de telefones</h1>
		<h2 style="color: orange;">${ msg }</h2>
	</center>
	
	<form action="salvarTelefones" method="post" id="formUser"
		onsubmit="return validarCampos()? true : false;">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>User:</td>
						<td><input type="text"  id="user" name="user" readonly="true"
							value="${userEscolhido.id}" class="field-long"></td>
						<td><input type="text"  id="nome" name="nome" readonly="true"
							value="${userEscolhido.nome}" class="field-long"></td>
						</tr>
						
						<tr>
							<td>Número:</td>
							<td><input type="text" id="numero" name="numero" value="" style="width: 173px"></td>
							<td>
								<SELECT id="tipo" name="tipo" style="width: 173px">
								<option>Celular</option>
								<option>Casa</option>
								<option>Trabalho</option>
								<option>Recados</option>
								<option>Outros</option>
								</SELECT>
							</td>
						</tr>
						
						<tr>
						<td></td>
						<td><input type="submit" value="Salvar" style="width: 173px"></td>
						<td><input type="submit" value="Voltar" style="width: 173px"
								onclick="document.getElementById('formUser').action = 'salvarTelefones?acao=voltar'">
						</td>
					</tr>
				</table>
			</li>
		</ul>
	</form>

	<div class="container">
		<table class="responsive-table">
			<caption>Usuários cadastrados</caption>
			<tr>
				<th>Id</th>
				<th>Número</th>
				<th>Tipo</th>
				<th>Delete</th>
			</tr>
			<c:forEach items="${telefones}" var="fone">
				<tr>
					
					<td><c:out value="${fone.id}"></c:out></td>
					<td><c:out value="${fone.numero}"></c:out></td>
					<td><c:out value="${fone.tipo}"></c:out></td>
					

					<td><a href="salvarTelefones?user=${fone.usuario }&&acao=deleteFone&foneId=${fone.id}"><img
							src="resources/img/excluir.png" alt="excluir" title="Excluir"
							width="24px" height="24px"> </a></td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<script type="text/javascript">
	function validarCampos(){
		if(document.getElementById("login").value == ''){
			alert('Informe o login')
			return false;
			}
		return true;
		}
	function consultaCep(){
		var cep = $('#cep').val();

		 //Consulta o webservice viacep.com.br/
        $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {
            
            if (!("erro" in dados)) {
            	//Atualiza os campos com os valores da consulta.
                $("#rua").val(dados.logradouro);
                $("#bairro").val(dados.bairro);
                $("#cidade").val(dados.localidade);
                $("#estado").val(dados.uf);
                $("#ibge").val(dados.ibge);
            } //end if.
            else {
            	$("#rua").val('');
                $("#bairro").val('');
                $("#cidade").val('');
                $("#estado").val('');
                $("#ibge").val('');
                //CEP pesquisado não foi encontrado.
                alert("CEP não encontrado.");
            }
        });
		}
</script>
</body>
</html>