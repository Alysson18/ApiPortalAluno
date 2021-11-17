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

import PortalAluno.UniUp.Model.DiciplinasModel;

@RestController
@RequestMapping(value = "/api")
public class DisciplinasController {

	@GetMapping(path ="/disciplinas/aluno/{codigo}")
	public List<DiciplinasModel> Disciplinas(@PathVariable("codigo") Integer codigo)throws SQLException

	{
		Conexao con = new Conexao();
		Statement st = con.conexao.createStatement();

		String sql = "Select * From portalaluno.vw_disciplinas where id_aluno = " + codigo;
		ResultSet result =  st.executeQuery(sql);
		result.next();

		ArrayList<DiciplinasModel> disciplinas = new ArrayList<DiciplinasModel>();

		while(result.isLast() == false)
		{
			DiciplinasModel  ds = new DiciplinasModel();
			
			ds.setNome_Disciplina((result.getString("Nome_Disciplina")));
			ds.setNome_Professor((result.getString("Nome")));
			
			ds.setId_Aluno(codigo);

			disciplinas.add(ds);
			result.next();
		}
		
		DiciplinasModel  ds = new DiciplinasModel();

		ds.setNome_Disciplina((result.getString("Nome_Disciplina")));
		ds.setNome_Professor((result.getString("Nome")));
		
		ds.setId_Aluno(codigo);

		disciplinas.add(ds);

		return disciplinas;

	}
}
