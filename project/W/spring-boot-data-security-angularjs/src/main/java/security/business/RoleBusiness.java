package security.business;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;


import security.dao.*;



@Service("RoleBusiness")
@Transactional(transactionManager="security-TransactionManager")
public class RoleBusiness {

    @Autowired
    @Qualifier("RoleDAO")
    protected RoleDAO repository;

    public RoleDAO getRepository() {
        return repository;
    }
    
}
