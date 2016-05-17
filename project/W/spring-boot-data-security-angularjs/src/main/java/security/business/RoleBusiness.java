package security.business;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;

import security.dao.*;

/**
 * Classe que representa a camada de negócios de Role
 * 
 * @generated
 **/
@Service("RoleBusiness")
@Transactional(transactionManager = "security-TransactionManager")
public class RoleBusiness {
  
  /**
   * Instância da classe UserDAO que faz o acesso ao banco de dados
   * 
   * @generated
   */
  @Autowired
  @Qualifier("RoleDAO")
  protected RoleDAO repository;
  
  /**
   * Método de acesso ao RoleDAO
   * 
   * @generated
   */
  public RoleDAO getRepository() {
    return repository;
  }
  
}
