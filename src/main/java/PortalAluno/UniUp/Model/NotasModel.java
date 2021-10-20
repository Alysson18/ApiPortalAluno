package PortalAluno.UniUp.Model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name = "vw_notas")
public class NotasModel {

	public String getDisciplina() {
		return Disciplina;
	}

	public void setDisciplina(String disciplina) {
		Disciplina = disciplina;
	}

	public String getAV1() {
		return AV1;
	}

	public void setAV1(String aV1) {
		AV1 = aV1;
	}

	public String getAV2() {
		return AV2;
	}

	public void setAV2(String aV2) {
		AV2 = aV2;
	}

	public String getAV3() {
		return AV3;
	}

	public void setAV3(String aV3) {
		AV3 = aV3;
	}

	public int getId_aluno() {
		return id_aluno;
	}

	public void setId_aluno(int id_aluno) {
		this.id_aluno = id_aluno;
	}

	@Column(nullable = false)
	String Disciplina;
	@Column(nullable = false)
	String AV1;
	@Column(nullable = false)
	String AV2;
	@Column(nullable = false)
	String AV3;
	
	@Id
	int id_aluno;

	

}
