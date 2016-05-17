package security.business;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.data.domain.*;


import security.dao.*;
import security.entity.*;
import java.util.*;




@Service("UserRoleBusiness")
@Transactional(transactionManager="security-TransactionManager")
public class UserRoleBusiness {

    @Autowired
    @Qualifier("UserRoleDAO")
    protected UserRoleDAO repository;


    public UserRoleDAO getRepository() {
        return repository;
    }





    
}
