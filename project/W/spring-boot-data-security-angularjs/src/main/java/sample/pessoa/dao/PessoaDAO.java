package sample.pessoa.dao;

import sample.pessoa.entity.*;
import java.util.List;
import org.springframework.stereotype.*;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.domain.*;
import org.springframework.data.repository.query.*;


@Repository("PessoaDAO")
public interface PessoaDAO extends JpaRepository<Pessoa, String> {


  @Query("select p from Pessoa p")
  public List<Pessoa> list ( Pageable pageable );
  

  @Query("select p from Pessoa p where p.nome LIKE CONCAT('%', CONCAT(:nome,'%'))")
  public List<Pessoa> listByNome (@Param(value="nome") java.lang.String nome , Pageable pageable );
  

  @Query("select p from Pessoa p where p.sobrenome LIKE CONCAT('%', CONCAT(:sobrenome,'%'))")
  public List<Pessoa> listBySobrenome (@Param(value="sobrenome") java.lang.String sobrenome , Pageable pageable );
  

  @Query("select p from Pessoa p where p.cidade.id = :id")
  public List<Pessoa> listByCidade (@Param(value="id") java.lang.String id , Pageable pageable );
  


}