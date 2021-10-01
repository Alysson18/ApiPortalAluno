package PortalAluno.UniUp.Repository;

import org.springframework.data.repository.CrudRepository;

import PortalAluno.UniUp.Model.UsuarioModel;

public interface UsuarioRepository extends CrudRepository<UsuarioModel, Long> {
	
	UsuarioModel findById(long Codigo);

}
