package security.business;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;


import security.dao.*;



@Service("UserBusiness")
@Transactional(transactionManager="security-TransactionManager")
public class UserBusiness {

    @Autowired
    @Qualifier("UserDAO")
    protected UserDAO repository;

    public UserDAO getRepository() {
        return repository;
    }
    
}
