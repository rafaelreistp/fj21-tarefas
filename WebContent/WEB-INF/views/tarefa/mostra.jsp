<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>Alterar Tarefa</title>

	</head>
	<body>
		<h3>Alterar tarefa ${tarefa.id }</h3>
		
		<form action="alteraTarefa" method="post">
			<input type="hidden" name="id" value="${tarefa.id }"/>
			Descrição: <textarea name="descricao" rows="5" cols="100">${tarefa.descricao }</textarea><br/>
			Situação: <input type="checkbox" name="finalizado" value="true"
			 ${tarefa.finalizado? 'checked' : '' }><br/>
			Data de Finalização: 
			<input type="text" name="dataFinalizacao" value="<fmt:formatDate value="${tarefa.dataFinalizacao.time }" pattern="dd/MM/yyyy"/>"/>
			<br/>
			<input type="submit" value="Alterar">
		</form>