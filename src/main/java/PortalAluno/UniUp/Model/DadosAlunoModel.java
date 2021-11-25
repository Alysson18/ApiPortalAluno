package PortalAluno.UniUp.Model;

public class DadosAlunoModel {
	int Id_Matricula;
	int Id_Aluno;
	String Email;
	String Nome;
	String Data_Nascimento;
	public String getData_Nascimento() {
		return Data_Nascimento;
	}
	public void setData_Nascimento(String data_Nascimento) {
		Data_Nascimento = data_Nascimento;
	}
	String Rg;
	String CPF;
	String Telefone;
	String Endereco;
	String Cidade;
	String Estado;
	String Curso;
	
	
	public int getId_Matricula() {
		return Id_Matricula;
	}
	public void setId_Matricula(int id_Matricula) {
		Id_Matricula = id_Matricula;
	}
	public int getId_Aluno() {
		return Id_Aluno;
	}
	public void setId_Aluno(int id_Aluno) {
		Id_Aluno = id_Aluno;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	public String getRg() {
		return Rg;
	}
	public void setRg(String rg) {
		Rg = rg;
	}
	public String getCPF() {
		return CPF;
	}
	public void setCPF(String cPF) {
		CPF = cPF;
	}
	public String getTelefone() {
		return Telefone;
	}
	public void setTelefone(String telefone) {
		Telefone = telefone;
	}
	public String getEndereco() {
		return Endereco;
	}
	public void setEndereco(String endereco) {
		Endereco = endereco;
	}
	public String getCidade() {
		return Cidade;
	}
	public void setCidade(String cidade) {
		Cidade = cidade;
	}
	public String getEstado() {
		return Estado;
	}
	public void setEstado(String estado) {
		Estado = estado;
	}
	public String getCurso() {
		return Curso;
	}
	public void setCurso(String curso) {
		Curso = curso;
	}
	
	

}
