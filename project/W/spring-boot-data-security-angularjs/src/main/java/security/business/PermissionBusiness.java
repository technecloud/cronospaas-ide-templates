package security.business;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.data.domain.*;


import security.dao.*;
import security.entity.*;
import java.util.*;




@Service("PermissionBusiness")
@Transactional(transactionManager="security-TransactionManager")
public class PermissionBusiness {

    @Autowired
    @Qualifier("PermissionDAO")
    protected PermissionDAO repository;


    public PermissionDAO getRepository() {
        return repository;
    }





    
}
