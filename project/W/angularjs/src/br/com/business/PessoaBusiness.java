package br.com.business;

import api.rest.util.*;

import br.com.dao.*;
import br.com.entity.*;
import java.util.*;

/**
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-05-27
 *
 **/
public class PessoaBusiness {

  /**
   * Instância da classe PessoaDAO que faz o acesso ao banco de dados
   */
  private PessoaDAO dao;
  
  /**
   * Singleton de sessão usado para abrir e fechar conexão com o banco de dados
   */
  protected SessionManager sessionManager;
	
  /**
   * Copia referência da sessão e instancia DAO relacionada à essa classe para manipular o banco de dados
   * 
   * @param sessionmanager
   *          Singleton de sessão
   */
  public PessoaBusiness(final SessionManager sessionmanager) {
    this.sessionManager = sessionmanager;
    this.dao = new PessoaDAO(sessionmanager.getEntityManager());
  }
  
  /**
   * Construtor padrão, inicializa singleton de sessão
   */
  public PessoaBusiness() {
    this(SessionManager.getInstance());
  }	

 /**
   * Busca valor de acordo com a chave primária
   * 
   * @param pk Chave primária
   * @return PessoaEntity Valor
   */
  public PessoaEntity getById(final Object pk) {
    return dao.getById(pk);
  }
  
  /**
   * Grava valor no banco
   * 
   * @param entity Linha da tabela a ser persistida no banco de dados
   */
  public void save(final PessoaEntity entity) {
    dao.save(entity);
  }
  
  /**
   * Atualiza valor do banco
   * 
   * @param entity Linha da tabela a ser atualizada
   */
  public void update(final PessoaEntity entity) {
    dao.update(entity);
  }
  
  /**
   * Apaga valor do banco
   * 
   * @param entity Linha da tabela a ser excluída
   */
  public void delete(final PessoaEntity entity) {
    dao.delete(entity);
  }
  
  /**
   * Retorna uma lista com todos os valores da EntityManger
   * 
   * @return List Lista com todas as linhas da tabela do banco de dados
   */
  public List<PessoaEntity> findAll() {
    return dao.findAll();
  }	
  
  /**
   * Retorna uma lista com todos os valores da EntityManger
   * 
   * @param pageIndex Numero da pagina
   * @param noOfRecords Numero de registros
   * @return List Lista com todas as linhas da tabela do banco de dados
   */
  public List<PessoaEntity> findAll(int pageIndex, int noOfRecords) {
    return dao.findAll(pageIndex, noOfRecords);
  }	
  
  public Object options(){
  	return "";
  }
  


  public Object options(Class<?> clazz) throws Exception{
    return dao.options(clazz);
  }


}