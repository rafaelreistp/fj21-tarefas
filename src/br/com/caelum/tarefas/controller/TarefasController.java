package br.com.caelum.tarefas.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.caelum.tarefas.dao.JdbcTarefaDao;
import br.com.caelum.tarefas.modelo.Tarefa;

@Controller
public class TarefasController {
	
	private final JdbcTarefaDao dao;
	
	@Autowired
	public TarefasController(JdbcTarefaDao dao){
		this.dao = dao;
	}
	
	@RequestMapping("/novaTarefa")
	public String form(){
		return "tarefa/formulario";
	}
	
	@RequestMapping("/adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa, BindingResult result){
		if(result.hasFieldErrors("descricao")){
			return "tarefa/formulario";
		}
		
		dao.adiciona(tarefa);
		return "tarefa/adicionada";
	}
	
	@RequestMapping("/listaTarefa")
	public String lista(Model modelo){
		List<Tarefa> tarefas = dao.lista();
		modelo.addAttribute("tarefas",tarefas);
		return "tarefa/lista";
	}
	
	@RequestMapping("/removeTarefa")
	public String remove(Tarefa tarefa){
		dao.remove(tarefa);
		return "redirect:listaTarefa";
	}
	
	@RequestMapping("/mostraTarefa")
	public String mostra(Long id, Model modelo){
		modelo.addAttribute(dao.buscaPorId(id));
		return "tarefa/mostra";	
	}
	
	@RequestMapping("/alteraTarefa")
	public String altera(Tarefa tarefa){
		dao.altera(tarefa);
		return "redirect:listaTarefa";
	}
	
	@ResponseBody
	@RequestMapping("/finalizaTarefa")
	public String finaliza(Long id){
		return "redirect:listaTarefa";
	}
}
	

