<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>Insere Tarefa</title>

	</head>
	<body>
	
		
		<h1>Inser��o de tarefas </h1>
		<form:errors path="tarefa.descricao"/>
		<form action="adicionaTarefa" method="post">
			Descri��o: <textarea name="descricao" rows="5" cols="100"></textarea>
			<input type="submit" value="Adicionar"/>
		</form>
		
		

	</body>
</html>