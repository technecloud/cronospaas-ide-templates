package app.business;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import java.util.*;
import app.dao.*;
import app.entity.*;

/**
 * Classe que representa a camada de negócios de CompanyBusiness
 * 
 * @generated
 **/
@Service("CompanyBusiness")
public class CompanyBusiness {

  /**
   * Instância da classe CompanyDAO que faz o acesso ao banco de dados
   * 
   * @generated
   */
  @Autowired
  @Qualifier("CompanyDAO")
  protected CompanyDAO repository;

  // CRUD

  /**
   * Serviço exposto para novo registro de acordo com a entidade fornecida
   * 
   * @generated
   */
  public Company post(final Company entity) throws Exception {
    // begin-user-code  
    // end-user-code  
    Company result = repository.save(entity);
    // begin-user-code
    // end-user-code
    return result;
  }

  /**
   * Serviço exposto para salvar alterações de acordo com a entidade fornecida
   * 
   * @generated
   */
  public Company put(final Company entity) throws Exception {
    // begin-user-code  
    // end-user-code
    Company result = repository.saveAndFlush(entity);
    // begin-user-code
    // end-user-code
    return result;
  }

  /**
   * Serviço exposto para remover a entidade de acordo com o id fornecido
   * 
   * @generated
   */
  public void delete(java.lang.String id) throws Exception {
    // begin-user-code  
    // end-user-code
    Company entity = this.get(id);
    this.repository.delete(entity);
    // begin-user-code  
    // end-user-code        
  }
  
  /**
   * Serviço exposto para recuperar a entidade de acordo com o id fornecido
   * 
   * @generated
   */
  public Company get(java.lang.String id) throws Exception {
    // begin-user-code  
    // end-user-code
    Company result = repository.findOne(id);
    // begin-user-code
    // end-user-code
    return result;
  }

  // CRUD
  
  /**
   * Lista com paginação de acordo com a NamedQuery
   * 
   * @generated
   */
  public Page<Company> list(Pageable pageable){
    // begin-user-code
    // end-user-code
    Page<Company> result = repository.list(pageable);
    // begin-user-code
    // end-user-code
    return result;
  }
  
  /**
   * @generated modifiable
   * OneToMany Relation
   */  
  public Page<User> findUser(java.lang.String id, Pageable pageable) {
    // begin-user-code
    // end-user-code  
    Page<User> result = repository.findUser(id, pageable);
    // begin-user-code  
    // end-user-code        
    return result;    
  }
  
  /**
   * @generated modifiable
   * OneToMany Relation
   */  
  public Page<Department> findDepartment(java.lang.String id, Pageable pageable) {
    // begin-user-code
    // end-user-code  
    Page<Department> result = repository.findDepartment(id, pageable);
    // begin-user-code  
    // end-user-code        
    return result;    
  }
}