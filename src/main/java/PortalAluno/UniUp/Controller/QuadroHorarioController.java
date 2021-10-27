package PortalAluno.UniUp.Controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import PortalAluno.UniUp.Model.QuadroHorarioModel;

@RestController
@RequestMapping(value = "/api")
public class QuadroHorarioController {
	

	@GetMapping(path ="/quadrohorario/aluno/{codigo}")
	public List<QuadroHorarioModel> Horario(@PathVariable("codigo") Integer codigo)throws SQLException
	{
		Conexao con = new Conexao();
		Statement st = con.conexao.createStatement();

		String sql = "Select * From portalaluno.new_view where id_aluno = " + codigo + " group by horario";
		ResultSet result =  st.executeQuery(sql);
		result.next();
		
		ArrayList<QuadroHorarioModel> horarios = new ArrayList<QuadroHorarioModel>();
		
		while(result.isLast() == false)
		{
			QuadroHorarioModel hr = new QuadroHorarioModel();					
			hr.setHorario((result.getString("horario")));
			
			hr.setDisciplina_Segunda((result.getString("Segunda")));
			hr.setDisciplina_Terca((result.getString("Terca")));
			hr.setDisciplina_Quarta((result.getString("Quarta")));
			hr.setDisciplina_Quinta((result.getString("Quinta")));
			hr.setDisciplina_Sexta((result.getString("Sexta")));	
			
			hr.setId_aluno(Integer.valueOf(result.getString("id_Aluno")));
			
			horarios.add(hr);
			result.next();
		}
		
		QuadroHorarioModel hr = new QuadroHorarioModel();					
		hr.setHorario((result.getString("horario")));
		
		hr.setDisciplina_Segunda((result.getString("Segunda")));
		hr.setDisciplina_Terca((result.getString("Terca")));
		hr.setDisciplina_Quarta((result.getString("Quarta")));
		hr.setDisciplina_Quinta((result.getString("Quinta")));
		hr.setDisciplina_Sexta((result.getString("Sexta")));			
		
		hr.setId_aluno(Integer.valueOf(result.getString("id_Aluno")));
		
		horarios.add(hr);
		
		return horarios;
	}
	
	

}
