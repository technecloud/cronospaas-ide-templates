package security.business;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.data.domain.*;

import security.dao.*;
import security.entity.*;
import java.util.*;

/**
 * Classe que representa a camada de negócios de Permission
 * 
 * @generated
 **/
@Service("PermissionBusiness")
@Transactional(transactionManager = "security-TransactionManager")
public class PermissionBusiness {
  
  /**
   * Instância da classe PermissionDAO que faz o acesso ao banco de dados
   * 
   * @generated
   */
  @Autowired
  @Qualifier("PermissionDAO")
  protected PermissionDAO repository;
  
  /**
   * Método de acesso ao PermissionDAO
   * 
   * @generated
   */
  public PermissionDAO getRepository() {
    return repository;
  }
  
}
