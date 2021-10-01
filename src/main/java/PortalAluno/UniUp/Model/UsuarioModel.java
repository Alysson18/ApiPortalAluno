package PortalAluno.UniUp.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name = "tb_users")
public class UsuarioModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Long Id;
	
	@Column(nullable = false, length = 100)
	public String Nome;
	
	@Column(nullable = false, length = 10)
	public String User;
	
	@Column(nullable = false, length = 10)
	public String Password;



	public void setId(Long id) {
		Id = id;
	}

	public void setNome(String nome) {
		Nome = nome;
	}

	public void setUser(String user) {
		User = user;
	}

	public void setPassword(String password) {
		Password = password;
	}
	
		

}
