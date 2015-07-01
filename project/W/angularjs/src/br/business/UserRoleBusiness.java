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
public class UserRoleBusiness {

  /**
   * Instância da classe UserRoleDAO que faz o acesso ao banco de dados
   */
  private UserRoleDAO dao;
  
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
  public UserRoleBusiness(final SessionManager sessionmanager) {
    this.sessionManager = sessionmanager;
    this.dao = new UserRoleDAO(sessionmanager.getEntityManager());
  }
  
  /**
   * Construtor padrão, inicializa singleton de sessão
   */
  public UserRoleBusiness() {
    this(SessionManager.getInstance());
  }	

 /**
   * Busca valor de acordo com a chave primária
   * 
   * @param pk Chave primária
   * @return UserRoleEntity Valor
   */
  public UserRoleEntity getById(final Object pk) {
    return dao.getById(pk);
  }
  
  /**
   * Grava valor no banco
   * 
   * @param entity Linha da tabela a ser persistida no banco de dados
   */
  public void save(final UserRoleEntity entity) {
    dao.save(entity);
  }
  
  /**
   * Atualiza valor do banco
   * 
   * @param entity Linha da tabela a ser atualizada
   */
  public void update(final UserRoleEntity entity) {
    dao.update(entity);
  }
  
  /**
   * Apaga valor do banco
   * 
   * @param entity Linha da tabela a ser excluída
   */
  public void delete(final UserRoleEntity entity) {
    dao.delete(entity);
  }
  
  /**
   * Retorna uma lista com todos os valores da EntityManger
   * 
   * @return List Lista com todas as linhas da tabela do banco de dados
   */
  public List<UserRoleEntity> findAll() {
    return dao.findAll();
  }	
  
  /**
   * Retorna uma lista com todos os valores da EntityManger
   * 
   * @param pageIndex Numero da pagina
   * @param noOfRecords Numero de registros
   * @return List Lista com todas as linhas da tabela do banco de dados
   */
  public List<UserRoleEntity> findAll(int pageIndex, int noOfRecords) {
    return dao.findAll(pageIndex, noOfRecords);
  }	
  
  public Object options(){
  	return "";
  }
  


  public Object options(Class<?> clazz) throws Exception{
    return dao.options(clazz);
  }


}