<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>Lista de Tarefas</title>
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="js/jquery-ui.js"></script>

	</head>
	<body>
			
	<table border=1>
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
				<td id="tarefa_${tarefa.id }">
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
				<td><a href="#" onclick="finalizaAgora(${tarefa.id})">FINALIZAR</a></td>
			</tr>
		</c:forEach>
	</table>	

	<script type="text/javascript">
		function finalizaAgora(id){
			$.get("finalizaTarefa?id="+ id, function(){
				$("#tarefa_"+id).html("Finalizado");
			});
		}
	</script>
	</body>
</html>