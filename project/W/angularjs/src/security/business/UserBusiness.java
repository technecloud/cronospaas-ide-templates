package security.business;

import security.dao.*;
import security.entity.*;

import java.util.*;

/**
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-08-25
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
   * Grava valor no banco
   * 
   * @param entity Linha da tabela a ser persistida no banco de dados
   */
  public void save(final User entity) {
    dao.save(entity);
  }
  
  /**
   * Dá um refresh na entidade com valores valor no banco
   * 
   * @param entity Entidade
   */
  public void refresh(final User entity) {
    dao.refresh(entity);
  }  
  
  /**
   * Atualiza valor do banco
   * 
   * @param entity Linha da tabela a ser atualizada
   */
  public User update(final User entity) {
	return dao.update(entity);
  }
  
  /**
   * Apaga valor do banco
   * 
   * @param entity Linha da tabela a ser excluída
   */
  public void delete(final User entity){
	dao.delete(entity);
  }
  
  /**
   * Remove a instância de User utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Quantidade de modificações efetuadas
   */  
  public int deleteById(java.lang.String id){
      return dao.deleteById(id);
  }  
  
  /**
   * Obtém a instância de User utilizando os identificadores
   * 
   * @param id
   *          Identificador 
   * @return Instância relacionada com o filtro indicado
   */  
  public User findById(java.lang.String id){
      return dao.findById(id);
  }   
  
  public Object options(){
  	return "";
  }
  
  public Object options(Class<?> clazz) throws Exception{
    return dao.options(clazz);
  }
  
  public List<User> list(int limit, int offset){
      return dao.list(limit, offset);	
  }  
  public List<User> findByRole(java.lang.String roleid, int limit, int offset){
      return dao.findByRole(roleid, limit, offset);	
  }  
}
