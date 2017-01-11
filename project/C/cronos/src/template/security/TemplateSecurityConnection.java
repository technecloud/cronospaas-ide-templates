package template.security;

import java.sql.*;
import java.util.*;
import java.security.*;
import javax.security.auth.login.LoginException;
import techne.security.*;
import techne.control.description.QueryAttributes;
import techne.cronos.PadTela;
import techne.data.ReportParameterData;
import techne.layout.db.LayoutConnection;

public class TemplateSecurityConnection extends SecurityConnection {
  private static final PadTela PAD_CUSTOM = PadTela.get("custom");
  
  public String getJndiName() {
    return LayoutConnection.LAYOUTDB;
  }
  
  public TechnePrincipal authenticate(String usuario, String senha) throws LoginException, SQLException {
    PadTela padTela;
    if("techne".equalsIgnoreCase(usuario)) {
      padTela = PadTela.FABRICA;
    }
    else {
      if("zeus".equalsIgnoreCase(usuario))
        padTela = PAD_CUSTOM;
      else
        throw new LoginException("Usuário 'techne' (fábrica) ou 'zeus' (custom)");
    }
    return new TechnePrincipal(usuario, "N", padTela);
  }
  
  public ITransacao queryTransacao(final String aplicacao, final String transacao) throws SQLException {
    return new ITransacao() {
      public String getSistema() {
        return aplicacao;
      }
      
      public String getTransacao() {
        return transacao;
      }
      
      public String getModulo() {
        return "principal";
      }
      
      public void setModulo(String modulo) {
      }
      
      public boolean isPublica() {
        return false;
      }
      
      public boolean isLogging() {
        return false;
      }
    };
  }
  
  public ModifyPermissions getPermissions(String usuario, String sistema, String transacao) throws SQLException {
    return new ModifyPermissions(true, true, true);
  }
  
  public boolean[] isAuthorized(List<String[]> usuarioTransacao) throws SQLException {
    int count = usuarioTransacao.size();
    
    boolean[] authorized = new boolean[count];
    Arrays.fill(authorized, true);
    
    return authorized;
  }
  
  public boolean isAuthorized(String usuario, String sistema, String transacao) throws SQLException {
    return true;
  }
  
  public boolean isAuthorizedMethod(String usuario, String sistema, String grupo, String rotina) throws SQLException {
    return true;
  }
  
  public boolean isAuthorizedReport(String usuario, String sistema, String grupo, String relatorio) throws SQLException {
    return true;
  }
  
  public void queryUserMenu(String usuario, int menuId, List<MenuItem> list, Map<MenuItem, Integer> parents,
                            Map<MenuItem, Integer> orders) throws SQLException {
  }
  
  public String queryMethodFile(String sistema, String grupo, String rotina) throws SQLException {
    return null;
  }
  
  public String queryReportFile(String sistema, String grupo, String relatorio) throws SQLException {
    return null;
  }
  
  public String queryReportType(String sistema, String grupo, String relatorio) throws SQLException {
    return null;
  }
  
  public List<ReportParameterData> queryReportParams(String sistema, String grupo, String relatorio)
          throws SQLException {
    return null;
  }
  
  public void changePassword(String user, String currentPassword, String newPassword) throws LoginException,
          SQLException {
  }
  
  public void createUser(String usuario, String nome, String sistema, String senha, boolean privilegiado,
                         boolean habilitado) throws SQLException {
  }
  
  public String queryApplicationTitle() throws SQLException {
    return null;
  }
  
  public List<Object[]> queryUsuarios(QueryAttributes qa) throws SQLException {
    return null;
  }
  
  public String queryMenuName(Principal principal, String sistema) throws SQLException {
    return null;
  }
  
  public String queryLoginMessage() throws SQLException {
    return null;
  }
}
