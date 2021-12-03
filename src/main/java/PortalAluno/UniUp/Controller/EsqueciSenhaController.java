package PortalAluno.UniUp.Controller;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Random;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.MultiPartEmail;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import PortalAluno.UniUp.Model.AlterarSenhaModel;
import PortalAluno.UniUp.Model.EsqueciSenhaModel;

@RestController
@RequestMapping(value = "/api")
public class EsqueciSenhaController {


	@PostMapping(path = "/esquecisenha")
	public String esqueciSenha(@RequestBody EsqueciSenhaModel email) throws SQLException
	{
		DateTimeFormatter dtfd = DateTimeFormatter.ofPattern("dd");
		DateTimeFormatter dtfh = DateTimeFormatter.ofPattern("HH");
		DateTimeFormatter dtfm = DateTimeFormatter.ofPattern("mm");
		DateTimeFormatter dtfs = DateTimeFormatter.ofPattern("ss");
		Date dt = new Date();
		String Codigo = "";

		Random rd = new Random();
		Conexao con = new Conexao();
		Statement st = con.conexao.createStatement();

		String sql = "Select Count(0) as Retorno, Lpad(Id, 4, '0') as Id  From portalaluno.tb_users where Usuario = '" + email.getEmail() + "'";


		ResultSet result =  st.executeQuery(sql);

		result.next();	
		String Id_usuario = result.getString("Id");
		if (result.getString("Retorno").equals("1"))
		{		
			Codigo += dtfd.format(LocalDateTime.now());
			Codigo += dtfh.format(LocalDateTime.now());
			Codigo += dtfm.format(LocalDateTime.now());
			Codigo += dtfs.format(LocalDateTime.now());
			Codigo += String.valueOf(rd.nextInt(9));


			MultiPartEmail emailConfig = new MultiPartEmail();
			emailConfig.setHostName("smtp.gmail.com");
			emailConfig.setSslSmtpPort("465");
			emailConfig.setStartTLSRequired(true);
			emailConfig.setStartTLSEnabled(true);
			emailConfig.setSSLOnConnect(true);


			emailConfig.setAuthenticator(new DefaultAuthenticator("Email", "Senha"));

			try
			{
				Codigo += Id_usuario;

				emailConfig.setFrom("email","Suporte UniUp");

				emailConfig.setSubject("Redefinição de Senha");
				emailConfig.setMsg("\nOlá,\n\nConforme o Solicitado segue o Codigo de Recuperação de Senha do Portal: \n\n" + Codigo + "\n\nSe você não solicitou a redefinição da sua senha,"
						+ " ignore este e-mail.!\n\n\n"
						+ "Obrigado,\n\nEquipe UniUp");
				emailConfig.addTo(email.getEmail());

				emailConfig.send();										


				String sqlInsert = "Insert into portalaluno.codigos_alteracao_senha(id_usuario, Codigo) values(" + Id_usuario + ", '"  + Codigo + "' )";

				st.execute(sqlInsert);


				return "Email Enviado com Sucesso";

			}
			catch (EmailException e) {
				e.printStackTrace();

				return "Erro ao Enviar Email";
			}		

		}
		else
		{
			return "Usuario Inexistente";
		}

	};

	@PutMapping(path = "/alterarsenha")
	public String alterarSenha(@RequestBody AlterarSenhaModel senha) throws SQLException
	{
		Conexao con = new Conexao();
		Statement st = con.conexao.createStatement();

		String sql = "Select Count(0) as Retorno, Id_Usuario From portalaluno.codigos_alteracao_senha where Codigo = '" + senha.getCodigo() + "'";

		ResultSet result =  st.executeQuery(sql);

		result.next();	
		String Id_usuario = result.getString("ID_Usuario");


		if ( result.getString("Retorno").equals("1"))
		{
			String sqlUpdate = "Update portalaluno.tb_users set password = '" + senha.getSenha() + "' where id = ('" + Id_usuario + "')";

			st.execute(sqlUpdate);


			return "Senha Alterada Com Sucesso";

		}
		else
		{
			return "Codigo de Validação Invalido";
		}
	}
}
