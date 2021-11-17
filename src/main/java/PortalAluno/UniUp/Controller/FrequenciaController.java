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

import PortalAluno.UniUp.Model.FrequenciaModel;

@RestController
@RequestMapping(value = "/api")
public class FrequenciaController {
	
	@GetMapping(path ="/frequencia/aluno/{codigo}")
	public List<FrequenciaModel> Disciplinas(@PathVariable("codigo") Integer codigo)throws SQLException

	{
		Conexao con = new Conexao();
		Statement st = con.conexao.createStatement();

		String sql = "Select * From portalaluno.vw_frequencias where id_aluno = " + codigo;
		ResultSet result =  st.executeQuery(sql);
		result.next();

		ArrayList<FrequenciaModel> frequencia = new ArrayList<FrequenciaModel>();

		while(result.isLast() == false)
		{
			FrequenciaModel  fr = new FrequenciaModel();
			
			fr.setDisciplina((result.getString("Disciplina")));
			fr.setQntd_Faltas((result.getInt("Faltas")));
			
			fr.setId_Aluno(codigo);

			frequencia.add(fr);
			result.next();
		}
		
		FrequenciaModel  fr = new FrequenciaModel();

		fr.setDisciplina((result.getString("Disciplina")));
		fr.setQntd_Faltas((result.getInt("Faltas")));
		
		fr.setId_Aluno(codigo);

		frequencia.add(fr);

		return frequencia;

	}

}
