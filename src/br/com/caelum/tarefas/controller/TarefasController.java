package br.com.caelum.tarefas.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.tarefas.dao.JdbcTarefaDao;
import br.com.caelum.tarefas.modelo.Tarefa;

@Controller
public class TarefasController {
	
	@RequestMapping("/novaTarefa")
	public String form(){
		return "tarefa/formulario";
	}
	
	@RequestMapping("/adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa, BindingResult result){
		if(result.hasFieldErrors("descricao")){
			return "tarefa/formulario";
		}
		
		JdbcTarefaDao dao = new JdbcTarefaDao();
		dao.adiciona(tarefa);
		return "tarefa/adicionada";
	}
	
	@RequestMapping("/listaTarefa")
	public String lista(Model modelo){
		JdbcTarefaDao dao = new JdbcTarefaDao();
		List<Tarefa> tarefas = dao.lista();
		modelo.addAttribute("tarefas",tarefas);
		return "tarefa/lista";
	}
	
	@RequestMapping("/removeTarefa")
	public String remove(Tarefa tarefa){
		JdbcTarefaDao dao = new JdbcTarefaDao();
		dao.remove(tarefa);
		return "redirect:listaTarefa";
	}
	
	@RequestMapping("/mostraTarefa")
	public String mostra(Long id, Model modelo){
		JdbcTarefaDao dao = new JdbcTarefaDao();
		modelo.addAttribute(dao.buscaPorId(id));
		return "tarefa/mostra";	
	}
	
	@RequestMapping("/alteraTarefa")
	public String altera(Tarefa tarefa){
		JdbcTarefaDao dao = new JdbcTarefaDao();
		dao.altera(tarefa);
		return "redirect:listaTarefa";
	}
	
	@RequestMapping("/finalizaTarefa")
	public String finaliza(Long id){
		new JdbcTarefaDao().finaliza(id);
		return "redirect:listaTarefa";
	}
}
	

