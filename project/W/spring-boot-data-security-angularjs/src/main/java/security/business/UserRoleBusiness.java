package security.business;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.data.domain.*;

import security.dao.*;

/**
 * Classe que representa a camada de negócios de UserRole
 * 
 * @generated
 **/
@Service("UserRoleBusiness")
@Transactional(transactionManager = "security-TransactionManager")
public class UserRoleBusiness {
  
  /**
   * Instância da classe UserRoleDAO que faz o acesso ao banco de dados
   * 
   * @generated
   */
  @Autowired
  @Qualifier("UserRoleDAO")
  protected UserRoleDAO repository;
  
  
  /**
   * Método de acesso ao UserRoleDAO
   * 
   * @generated
   */
  public UserRoleDAO getRepository() {
    return repository;
  }
  
}
