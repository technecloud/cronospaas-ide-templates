package br.business;

import br.dao.*;
import br.entity.*;

import java.util.*;
import api.rest.service.util.*;


/**
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-06-30
 *
 **/
public class UserBusiness {

  /**
   * Instância da classe UserDAO que faz o acesso ao banco de dados
   */
  private UserDAO dao;
  
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
  public UserBusiness(final SessionManager sessionmanager) {
    this.sessionManager = sessionmanager;
    this.dao = new UserDAO(sessionmanager.getEntityManager());
  }
  
  /**
   * Construtor padrão, inicializa singleton de sessão
   */
  public UserBusiness() {
    this(SessionManager.getInstance());
  }	

 /**
   * Busca valor de acordo com a chave primária
   * 
   * @param pk Chave primária
   * @return UserEntity Valor
   */
  public UserEntity getById(final Object pk) {
    return dao.getById(pk);
  }
  
  /**
   * Grava valor no banco
   * 
   * @param entity Linha da tabela a ser persistida no banco de dados
   */
  public void save(final UserEntity entity) {
    dao.save(entity);
  }
  
  /**
   * Atualiza valor do banco
   * 
   * @param entity Linha da tabela a ser atualizada
   */
  public void update(final UserEntity entity) {
    dao.update(entity);
  }
  
  /**
   * Apaga valor do banco
   * 
   * @param entity Linha da tabela a ser excluída
   */
  public void delete(final UserEntity entity) {
    dao.delete(entity);
  }
  
  /**
   * Retorna uma lista com todos os valores da EntityManger
   * 
   * @return List Lista com todas as linhas da tabela do banco de dados
   */
  public List<UserEntity> findAll() {
    return dao.findAll();
  }	
  
  /**
   * Retorna uma lista com todos os valores da EntityManger
   * 
   * @param pageIndex Numero da pagina
   * @param noOfRecords Numero de registros
   * @return List Lista com todas as linhas da tabela do banco de dados
   */
  public List<UserEntity> findAll(int pageIndex, int noOfRecords) {
    return dao.findAll(pageIndex, noOfRecords);
  }	
  
  public Object options(){
  	return "";
  }
  


  public Object options(Class<?> clazz) throws Exception{
    return dao.options(clazz);
  }


}