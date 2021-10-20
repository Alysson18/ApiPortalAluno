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

import PortalAluno.UniUp.Model.NotasModel;


@RestController
@RequestMapping(value = "/api")
public class NotasController {

	//@Autowired
	//private NotasRepository notasRepository;

	@GetMapping(path ="/notas/aluno/{codigo}")
	public List<NotasModel> Notas(@PathVariable("codigo") Integer codigo)throws SQLException
	{
		Conexao con = new Conexao();
		Statement st = con.conexao.createStatement();

		String sql = "Select * From portalaluno.vw_notas where id_aluno = " + codigo;
		ResultSet result =  st.executeQuery(sql);
		result.next();

		ArrayList<NotasModel> notas = new ArrayList<NotasModel>();

		while(result.isLast() == false)
		{
			NotasModel  nt = new NotasModel();
			nt.setDisciplina((result.getString("disciplina")));

			if (result.getString("Av1") == null)
			{
				nt.setAV1("-");
			}
			else
			{
				nt.setAV1(result.getString("Av1"));
			}

			if (result.getString("Av2") == null)
			{
				nt.setAV2("-");
			}
			else
			{
				nt.setAV2(result.getString("Av2"));
			}

			if (result.getString("Av3") == null)
			{
				nt.setAV3("-");
			}
			else
			{
				nt.setAV3(result.getString("Av3"));
			}

			nt.setId_aluno(codigo);

			notas.add(nt);
			result.next();
		}

		NotasModel  nt = new NotasModel();
		nt.setDisciplina((result.getString("disciplina")));


		if (result.getString("Av1") == null)
		{
			nt.setAV1("-");
		}
		else
		{
			nt.setAV1(result.getString("Av1"));
		}

		if (result.getString("Av2") == null)
		{
			nt.setAV2("-");
		}
		else
		{
			nt.setAV2(result.getString("Av2"));
		}

		if (result.getString("Av3") == null)
		{
			nt.setAV3("-");
		}
		else
		{
			nt.setAV3(result.getString("Av3"));
		}

		nt.setId_aluno(codigo);

		notas.add(nt);

		return notas ;

	}


}
