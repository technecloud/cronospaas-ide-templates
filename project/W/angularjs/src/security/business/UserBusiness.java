package security.business;

import java.util.Iterator;
import java.util.List;

import security.dao.SessionManager;
import security.dao.UserDAO;
import security.entity.Role;
import security.entity.User;
import security.entity.UserRole;
import util.Hash;

/**
 * Classe que representa a camada de negócios de User
 *
 * @modified
 **/
public class UserBusiness {

  private static final String MASKED_PASSWORD = "******";
  
  /**
   * Instância da classe UserDAO que faz o acesso ao banco de dados
   *
   * @generated
   */
  private UserDAO dao;
  
  /**
   * Singleton de sessão usado para abrir e fechar conexão com o banco de dados
   *
   * @generated
   */
  protected SessionManager sessionManager;
  
  /**
   * Copia referência da sessão e instancia DAO relacionada à essa classe para manipular o banco de dados
   *
   * @param sessionmanager
   *          Singleton de sessão
   * @generated modifiable
   */
  public UserBusiness(final SessionManager sessionmanager) {
    // begin-user-code
    // end-user-code
    this.sessionManager = sessionmanager;
    this.dao = new UserDAO(sessionmanager.getEntityManager());
    // begin-user-code
    // end-user-code
  }
  
  /**
   * Construtor padrão, inicializa singleton de sessão
   *
   * @generated modifiable
   */
  public UserBusiness() {
    // begin-user-code
    // end-user-code
    this(SessionManager.getInstance());
    // begin-user-code
    // end-user-code
  }

  /**
   * Grava valor no banco
   *
   * @param entity
   *          Linha da tabela a ser persistida no banco de dados
   * @generated modifiable
   */
  public void save(final User entity) {
    // begin-user-code
    // end-user-code
    this.maskPassword(entity);
    this.dao.save(entity);
    this.hidePassword(entity);
    // begin-user-code
    // end-user-code
  }
  
  /**
   * Dá um refresh na entidade com valores valor no banco
   *
   * @param entity
   *          Entidade
   * @generated modifiable
   */
  public void refresh(final User entity) {
    // begin-user-code
    // end-user-code
    this.dao.refresh(entity);
    // begin-user-code
    // end-user-code
  }

  /**
   * Atualiza valor do banco
   *
   * @param entity
   *          Linha da tabela a ser atualizada
   * @generated modifiable
   */
  public User update(final User entity) {
    // begin-user-code
    // end-user-code
    this.maskPassword(entity);
    User updatedEntity = this.dao.update(entity);
    this.hidePassword(updatedEntity);
    // begin-user-code
    // end-user-code
    return updatedEntity;
  }
  
  private void maskPassword(User entity) {
    if(!MASKED_PASSWORD.equals(entity.getPassword())) {
      entity.setPassword(Hash.md5(entity.getPassword()));
    }
  }
  
  /**
   * Apaga valor do banco
   *
   * @param entity
   *          Linha da tabela a ser excluída
   * @generated modifiable
   */
  public void delete(final User entity) {
    // begin-user-code
    // end-user-code
    this.dao.delete(entity);
    // begin-user-code
    // end-user-code
  }
  
  /**
   * Remove a instância de User utilizando os identificadores
   *
   * @param id
   *          Identificador
   * @return Quantidade de modificações efetuadas
   * @modified
   */
  public int deleteById(java.lang.String id) {
    // begin-user-code
    
    // Verifica se Usuário tem Role associada. Se sim, não permite remover.
    List<UserRole> userRoles = this.sessionManager.getEntityManager()
            .createQuery("SELECT ur FROM UserRole ur WHERE ur.user.id = :idUser").setParameter("idUser", id)
            .setMaxResults(1).getResultList();

    if(!userRoles.isEmpty()) {
      throw new RuntimeException("O Usuário tem Funções associadas. Não pode ser removido.");
    }
    
    // end-user-code
    int result = this.dao.deleteById(id);
    // begin-user-code
    // end-user-code
    return result;
  }

  /**
   * Obtém a instância de User utilizando os identificadores
   *
   * @param id
   *          Identificador
   * @return Instância relacionada com o filtro indicado
   * @generated modifiable
   */
  public User findById(java.lang.String id) {
    // begin-user-code
    // end-user-code
    User entity = this.dao.findById(id);
    this.hidePassword(entity);
    // begin-user-code
    // end-user-code
    return entity;
  }

  /**
   * @generated modifiable
   */
  public List<UserRole> findUserRole(java.lang.String id, int limit, int offset) {
    // begin-user-code
    // end-user-code
    List<UserRole> result = this.dao.findUserRole(id, limit, offset);
    for(UserRole userRole : result) {
      userRole.getUser().setPassword(MASKED_PASSWORD);
    }
    // begin-user-code
    // end-user-code
    return result;
  }

  private void maskPassword(List<User> result) {
    if(result == null) {
      return;
    }
    Iterator<User> it = result.iterator();
    while(it.hasNext()) {
      User user = it.next();
      this.hidePassword(user);
    }
  }

  private void hidePassword(User user) {
    user.setPassword(MASKED_PASSWORD);
  }

  /**
   * @generated modifiable
   */
  public List<Role> listRole(java.lang.String id, int limit, int offset) {
    // begin-user-code
    // end-user-code
    List<Role> result = this.dao.listRole(id, limit, offset);
    // begin-user-code
    // end-user-code
    return result;
  }
  
  /**
   * @generated modifiable
   */
  public int deleteRole(java.lang.String instanceId, java.lang.String relationId) {
    // begin-user-code
    // end-user-code
    int result = this.dao.deleteRole(instanceId, relationId);
    // begin-user-code
    // end-user-code
    return result;
  }

  /**
   * @generated modifiable
   */
  public List<User> list(int limit, int offset) {
    // begin-user-code
    // end-user-code
    List<User> result = this.dao.list(limit, offset);
    this.maskPassword(result);
    // begin-user-code
    // end-user-code
    return result;
  }

  /**
   * @generated modifiable
   */
  public List<User> findByRole(java.lang.String roleid, int limit, int offset) {
    // begin-user-code
    // end-user-code
    List<User> result = this.dao.findByRole(roleid, limit, offset);
    this.maskPassword(result);
    // begin-user-code
    // end-user-code
    return result;
  }

  /**
   * @generated modifiable
   */
  public List<User> findByLogin(java.lang.String login, int limit, int offset) {
    // begin-user-code
    // end-user-code
    List<User> result = this.dao.findByLogin(login, limit, offset);
    this.maskPassword(result);
    // begin-user-code
    // end-user-code
    return result;
  }

  public boolean checkUser(String username, String password) {
    List<User> result = this.dao.findByLogin(username, 1, 0);
    return (result.size() > 0) && Hash.md5(password).equals(result.get(0).getPassword());
  }
}
