package sample.pessoa.business;

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;


import sample.pessoa.dao.*;



@Service("PessoaBusiness")
@Transactional(transactionManager="sample.pessoa-TransactionManager")
public class PessoaBusiness {

    @Autowired
    @Qualifier("PessoaDAO")
    protected PessoaDAO repository;

    public PessoaDAO getRepository() {
        return repository;
    }
    
}
