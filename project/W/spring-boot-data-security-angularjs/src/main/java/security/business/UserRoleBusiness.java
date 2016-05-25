package security.business;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.data.domain.*;


import security.dao.*;
import security.entity.*;
import java.util.*;



/**
 * Classe que representa a camada de negócios de UserRoleBusiness
 * 
 * @generated
 **/
@Service("UserRoleBusiness")
public class UserRoleBusiness {

    /**
     * Instância da classe UserRoleDAO que faz o acesso ao banco de dados
     * 
     * @generated
     */
    @Autowired
    @Qualifier("UserRoleDAO")
    protected UserRoleDAO repository;

// CRUD

    /**
     * Serviço exposto para novo registro de acordo com a entidade fornecida
     * 
     * @generated
     */
    public UserRole post(final UserRole entity) throws Exception {
      // before-begin-user-code  
      // before-end-user-code  
      repository.save(entity);
      // after-begin-user-code  
      // after-end-user-code  
      return entity;
    }

    /**
     * Serviço exposto para recuperar a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    public UserRole get(java.lang.String id) throws Exception {
      // before-begin-user-code  
      // before-end-user-code        
       UserRole result = repository.findOne(id);
      // after-begin-user-code  
      // after-end-user-code        
      return result;
    }

    /**
     * Serviço exposto para salvar alterações de acordo com a entidade fornecida
     * 
     * @generated
     */
    public UserRole put(final UserRole entity) throws Exception {
      // before-begin-user-code  
      // before-end-user-code        
      repository.saveAndFlush(entity);
      // after-begin-user-code  
      // after-end-user-code        
      return entity;
    }

    /**
     * Serviço exposto para salvar alterações de acordo com a entidade e id fornecidos
     * 
     * @generated
     */
    public UserRole put(final java.lang.String id,final UserRole entity) throws Exception {
      // before-begin-user-code  
      // before-end-user-code        
      repository.saveAndFlush(entity);
      // after-begin-user-code  
      // after-end-user-code        
      return entity;
    }


    /**
     * Serviço exposto para remover a entidade de acordo com o id fornecido
     * 
     * @generated
     */
    public void delete( java.lang.String id) throws Exception {
      // before-begin-user-code  
      // before-end-user-code        
      repository.delete(id);
      // after-begin-user-code  
      // after-end-user-code        
    }



// CRUD
    
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  public List<UserRole> list ( Pageable pageable ){
    // before-begin-user-code  
    // before-end-user-code        
    List<UserRole> result = repository.list (  pageable );
    // after-begin-user-code  
    // after-end-user-code        
    return result;
  }
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  public List<UserRole> findByUser ( User user , Pageable pageable ){
    // before-begin-user-code  
    // before-end-user-code        
    List<UserRole> result = repository.findByUser ( user ,  pageable );
    // after-begin-user-code  
    // after-end-user-code        
    return result;
  }
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  public List<UserRole> findByEmail ( java.lang.String email , Pageable pageable ){
    // before-begin-user-code  
    // before-end-user-code        
    List<UserRole> result = repository.findByEmail ( email ,  pageable );
    // after-begin-user-code  
    // after-end-user-code        
    return result;
  }
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  public List<UserRole> findByLogin ( java.lang.String login , Pageable pageable ){
    // before-begin-user-code  
    // before-end-user-code        
    List<UserRole> result = repository.findByLogin ( login ,  pageable );
    // after-begin-user-code  
    // after-end-user-code        
    return result;
  }
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  public List<UserRole> findByRole ( java.lang.String roleid , Pageable pageable ){
    // before-begin-user-code  
    // before-end-user-code        
    List<UserRole> result = repository.findByRole ( roleid ,  pageable );
    // after-begin-user-code  
    // after-end-user-code        
    return result;
  }
    
    



}
