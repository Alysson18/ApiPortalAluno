package PortalAluno.UniUp.Controller;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import PortalAluno.UniUp.Model.AlterUserModel;
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


		String sql = "Select id, nome, Id_Usuario, Qntd_Acesso, Foto From portalaluno.vw_login  where Usuario = '" + login.getEmail() + "' And Password = '" + login.getSenha() +"'";


		ResultSet result =  st.executeQuery(sql);

		result.next();				

		UsuarioLogadoModel  UserLogado = new UsuarioLogadoModel();
		UserLogado.setNome(result.getString("Nome"));
		UserLogado.setId(result.getString("Id"));  
		 
		try {
			File Arquivo = new File(result.getString("foto"));
			
			byte[] data = new byte[(int) Arquivo.length()];
		    DataInputStream dis = new DataInputStream(new FileInputStream(Arquivo));
			 dis.readFully(data);
			 dis.close();
				
			 String  s = Base64.getEncoder().encodeToString(data);
			  UserLogado.setFoto("data:image/jpg;base64," + s);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			UserLogado.setFoto("data:image/jpg;base64,");
			
		}

		int Qntd = result.getInt("Qntd_Acesso");

		Qntd = Qntd + 1;


		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");      

		String sqlUpdate = "Update portalaluno.tb_users set Qntd_Acesso = '" + Qntd+ "', Ultimo_Acesso = '" + dtf.format(LocalDateTime.now()) + "' where id = ('" + result.getInt("Id_Usuario") + "')";

		st.execute(sqlUpdate);


		return UserLogado;
	}

	@PutMapping(path = "/login/alterarusuario")
	public String AlterarUsuario (@RequestBody AlterUserModel user) throws SQLException
	{
		Conexao con = new Conexao();
		Statement st = con.conexao.createStatement();

		String sqlCount = "Select count(0) as Qntd From portalaluno.tb_users where Usuario = '" + user.getEmail() + "'";
		ResultSet result =  st.executeQuery(sqlCount);

		result.next();	

		String qntd = 	result.getString("Qntd");

		if (Integer.valueOf(qntd) <= 0)
		{

			String sqlUpdate = "Update portalaluno.tb_users set Usuario = '" + user.getEmail() + "' Where Id_Aluno = " + user.getId_Aluno();
			st.execute(sqlUpdate);

			return "Usuario Alterado com Sucesso!";
		}
		else
		{
			return "Já existe um usuario com esse email!";
		}

	}

}
