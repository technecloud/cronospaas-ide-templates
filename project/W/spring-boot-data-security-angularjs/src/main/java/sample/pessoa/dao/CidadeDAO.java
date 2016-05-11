package sample.pessoa.dao;

import sample.pessoa.entity.*;
import java.util.List;
import org.springframework.stereotype.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.domain.*;
import org.springframework.data.repository.query.*;


@Repository("CidadeDAO")
public interface CidadeDAO extends JpaRepository<Cidade, String> {


  @Query("select c from Cidade c")
  public List<Cidade> list ( Pageable pageable );
  

  @Query("select c from Cidade c where c.nome LIKE  CONCAT('%', CONCAT(:nome,'%'))")
  public List<Cidade> listByNome (@Param(value="nome") java.lang.String nome , Pageable pageable );
  


}