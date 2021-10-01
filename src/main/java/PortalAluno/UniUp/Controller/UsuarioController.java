package PortalAluno.UniUp.Controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import PortalAluno.UniUp.Model.LoginModel;
import PortalAluno.UniUp.Model.UsuarioLogadoModel;

@RestController
@RequestMapping(value = "/api")
public class UsuarioController {
	
	//@Autowired
	//private UsuarioRepository repository;
	
	

		

	@PostMapping(path ="/login")
	public UsuarioLogadoModel Consultar(@RequestBody LoginModel login) throws SQLException
	{
		Conexao con = new Conexao();
		Statement st = con.conexao.createStatement();
		
		
		String sql = "Select id, nome, Id_Usuario, Qntd_Acesso From portalaluno.vw_login  where Usuario = '" + login.getEmail() + "' And Password = '" + login.getSenha() +"'";
				

	   ResultSet result =  st.executeQuery(sql);
	
	   result.next();				
	
	   UsuarioLogadoModel  UserLogado = new UsuarioLogadoModel();
	   UserLogado.setNome(result.getString("Nome"));
	   UserLogado.setId(result.getString("Id"));  
	   
	   int Qntd = result.getInt("Qntd_Acesso");
	   
	   Qntd = Qntd + 1;
	   
	   
	   DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");      
	   
	   String sqlUpdate = "Update portalaluno.tb_users set Qntd_Acesso = '" + Qntd+ "', Ultimo_Acesso = '" + dtf.format(LocalDateTime.now()) + "' where id = ('" + result.getInt("Id_Usuario") + "')";

	   st.execute(sqlUpdate);
		
		
	  return UserLogado;
	}
}
