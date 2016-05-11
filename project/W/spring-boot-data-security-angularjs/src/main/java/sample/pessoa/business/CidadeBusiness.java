package sample.pessoa.business;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;


import sample.pessoa.dao.*;



@Service("CidadeBusiness")
@Transactional(transactionManager="sample.pessoa-TransactionManager")
public class CidadeBusiness {

    @Autowired
    @Qualifier("CidadeDAO")
    protected CidadeDAO repository;

    public CidadeDAO getRepository() {
        return repository;
    }
    
}
