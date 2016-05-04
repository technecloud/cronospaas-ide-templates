package ${bussinessPackage};

import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;
import org.springframework.beans.factory.annotation.*;


import ${daoPackage}.*;

<#assign persistence_unit_name = workspaceView.getActiveEditor().getDiagram().getGlobalAttribute("namespace")?replace('"','')>

<#assign qualified_repository_name = "${clazz.name}DAO">
<#assign clazz_name = "${clazz.name}Business">


@Service("${clazz_name}")
@Transactional(transactionManager="${persistence_unit_name}-TransactionManager")
public class ${clazz_name} {

    @Autowired
    @Qualifier("${qualified_repository_name}")
    protected ${clazz.name}DAO repository;

    public ${clazz.name}DAO getRepository() {
        return repository;
    }
    
}
