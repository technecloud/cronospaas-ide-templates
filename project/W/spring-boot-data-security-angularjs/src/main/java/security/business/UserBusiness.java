package security.business;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.data.domain.*;


import security.dao.*;
import security.entity.*;
import java.util.*;




@Service("UserBusiness")
@Transactional(transactionManager="security-TransactionManager")
public class UserBusiness {

    @Autowired
    @Qualifier("UserDAO")
    protected UserDAO repository;


    public UserDAO getRepository() {
        return repository;
    }

  /**
   * @generated modifiable
   */  
  public List<UserRole> findUserRole(java.lang.String id,  Pageable pageable) {
      // begin-user-code
      // end-user-code  
      List<UserRole> result = repository.findUserRole(id,  pageable );
      // begin-user-code  
      // end-user-code        
      return result;	  
  }



  /**
   * @generated modifiable
   */  
  public List<Role> listRole(java.lang.String id,  Pageable pageable ) {
      // begin-user-code
      // end-user-code  
      List<Role> result = repository.listRole(id,  pageable );
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
      int result = repository.deleteRole(instanceId, relationId);
      // begin-user-code
      // end-user-code  
      return result;  
  }


    
}
