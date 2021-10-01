package PortalAluno.UniUp.Controller;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

	String serverName = "localhost";
	String URL= "jdbc:mysql://"+ serverName + "/alysson";
	
	Connection conexao;
	
	Conexao() throws SQLException{
		conexao  = DriverManager.getConnection(URL,"root","masterkey");
	}
}



