<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>Lista de Tarefas</title>

	</head>
	<body>
			
	<table border=2>
		<tr style="background-color: #f5f5f0;">
			<td>ID</td>
			<td>Descrição</td>
			<td>Situação</td>
			<td>Data Finalização</td>
		</tr>
		<c:forEach items="${tarefas}" var="tarefa">
			<tr>
				<td>${tarefa.id }</td>
				<td>${tarefa.descricao }</td>
				<td>
					<c:if test="${tarefa.finalizado eq false }">
						Não finalizado
					</c:if>
					<c:if test="${tarefa.finalizado eq true }">
						Finalizado
					</c:if>
				</td>
				<td>
					<fmt:formatDate pattern="dd/MM/yyyy" value="${tarefa.dataFinalizacao.time }"/>
				</td>
				<td><a href="removeTarefa?id=${tarefa.id }">REMOVER</a></td>
				<td><a href="mostraTarefa?id=${tarefa.id }">ALTERAR</a></td>
				<td><a href="finalizaTarefa?id=${tarefa.id }">FINALIZAR</a>
		</c:forEach>
	</table>	

	</body>
</html>