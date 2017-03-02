package com.techne.jaas;


import java.io.File;
import java.net.URL;
import java.util.logging.Logger;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


/**
 * Listener De Contexto que confere a existência do arquivo jaas.config em WEB-INF/classes
 * Evitando, configuração adicional em CATALINA_OPTS="-Djava.security.auth.login.config=$CATALINA_HOME/conf/jaas.config"
 * O comportamento antigo prevalece, se existir CATALINA_OPTS será utilizado.
 * Do contrário, tentará em WEB-INF/classes
 **/
public class SecurityListener implements ServletContextListener {
    /**
     * Logger
     */
    private static Logger log = Logger.getLogger(SecurityListener.class.getName());
    
    /**
     * Apenas Sobreescrevendo
     **/
    @Override
    public void contextDestroyed(ServletContextEvent scr) {}
    
    /**
     *  Ao iniciar o context, procurar pelo arquivo jaas.conf
     **/
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        loadJAASFromClassLoader(sce, "login.config");
    }
    
    /**
     * Confere a existência do arquivo jaas.config em WEB-INF/classes
     * Evitando, configuração adicional em CATALINA_OPTS="-Djava.security.auth.login.config=$CATALINA_HOME/conf/jaas.config"
     * O comportamento antigo prevalece, se existir CATALINA_OPTS será utilizado.
     * Do contrário, tentará em WEB-INF/classes
     **/
    public void loadJAASFromClassLoader(ServletContextEvent sce, String sFile) {
        // conferir se a propriedade que mantem o jaas.config foi setada
        if(System.getProperty("java.security.auth.login.config") == null || !new File(System.getProperty("java.security.auth.login.config")).exists() ) {
            String jaasConfigFile = null;
            // buscar URL do classloader. no caso do .war ficaria em ROOT.war!/WEB-INF/classes
            URL jaasConfigURL = this.getClass().getClassLoader().getResource(sFile);
            // se encontrou arquivo, preencha
            if(jaasConfigURL != null) {
                jaasConfigFile = jaasConfigURL.getFile();
                System.setProperty("java.security.auth.login.config", jaasConfigFile);
            }
        }
        
        log.info( String.format("[JAAS] %s\n", System.getProperty("java.security.auth.login.config") ) );
    }
    
    
}
