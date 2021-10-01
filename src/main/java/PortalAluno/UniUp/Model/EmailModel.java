package PortalAluno.UniUp.Model;




public class EmailModel {
	
	public String getEmail() {
		return EmailAluno;
	}
	public void setEmail(String email) {
		EmailAluno = email;
	}
	public String getSetor() {
		return Setor;
	}
	public void setSetor(String setor) {
		Setor = setor;
	}
	public String getSolicitacao() {
		return Solicitacao;
	}
	public void setSolicitacao(String solicitacao) {
		Solicitacao = solicitacao;
	}
	
	
	private String EmailAluno;
	
	private String Setor;
	
	private String Solicitacao;
	
	private String Telefone;

	public String getTelefone() {
		return Telefone;
	}
	public void setTelefone(String telefone) {
		Telefone = telefone;
	}
	
	

}
