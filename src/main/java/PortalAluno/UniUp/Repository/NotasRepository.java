package PortalAluno.UniUp.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import PortalAluno.UniUp.Model.NotasModel;

@Repository
public interface NotasRepository extends JpaRepository<NotasModel, Integer> {


}
