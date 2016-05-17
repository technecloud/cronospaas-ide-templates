package security.business;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;

import security.dao.*;

/**
 * Classe que representa a camada de negócios de User
 * 
 * @generated
 **/
@Service("UserBusiness")
@Transactional(transactionManager = "security-TransactionManager")
public class UserBusiness {
  
  /**
   * Instância da classe UserDAO que faz o acesso ao banco de dados
   * 
   * @generated
   */
  @Autowired
  @Qualifier("UserDAO")
  protected UserDAO repository;
  
  /**
   * Método de acesso ao UserDAO
   * 
   * @generated
   */
  public UserDAO getRepository() {
    return repository;
  }
  
}
