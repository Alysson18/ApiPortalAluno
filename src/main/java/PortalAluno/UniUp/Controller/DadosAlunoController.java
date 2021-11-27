package PortalAluno.UniUp.Controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import PortalAluno.UniUp.Model.DadosAlunoModel;

@RestController
@RequestMapping(value = "/api")
public class DadosAlunoController {
	
	@GetMapping(path ="/dados/aluno/{codigo}")
	public DadosAlunoModel DadosAluno(@PathVariable("codigo") Integer codigo)throws SQLException

	{
		Conexao con = new Conexao();
		Statement st = con.conexao.createStatement();
		DadosAlunoModel dam = new DadosAlunoModel();

		String sql = "Select * From portalaluno.vw_dadosaluno where id_aluno = " + codigo;
		ResultSet result =  st.executeQuery(sql);
		result.next();
		
		dam.setId_Matricula(result.getInt("Id"));
		dam.setId_Aluno(result.getInt("id_Aluno"));		
		dam.setEmail(result.getString("email"));
		dam.setNome(result.getString("Nome"));
		dam.setData_Nascimento(result.getString("Data_Nascimeto"));
		dam.setRg(result.getString("Rg"));
		dam.setCPF(result.getString("cpf"));
		dam.setTelefone(result.getString("Telefone"));
		dam.setEndereco(result.getString("Endereco"));
		dam.setCidade(result.getString("cidade"));
		dam.setEstado(result.getString("estado"));
		dam.setCurso(result.getString("nome_curso"));		
		
		
		return dam;
	
	
	}

	@PutMapping(path = "/alterardados/aluno")
	public String alterarDados(@RequestBody DadosAlunoModel dados) throws SQLException
	{

		Conexao con = new Conexao();
		Statement st = con.conexao.createStatement();
	
		String sqlUpdate = "Update portalaluno.alunos set email = '" + dados.getEmail() + "', telefone = '" + dados.getTelefone() + 
				"' where id = ('" + dados.getId_Aluno() + "')";

		st.execute(sqlUpdate);
		
		
		return "Alteração efetuada com Sucesso";
	}
}
