package tenant;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Component;

import app.business.UserBusiness;
import app.entity.User;
import cronapp.framework.tenant.TenantComponent;
import cronapp.framework.tenant.TenantService;

@Component
public class TenantComponentImpl implements TenantComponent {
  
  private static final Logger log = LoggerFactory.getLogger(TenantComponentImpl.class);
  
  private final TenantService tenantService;
  
  private final UserBusiness userBusiness;
  
  @Autowired
  public TenantComponentImpl(TenantService tenantService, UserBusiness userBusiness) {
    this.tenantService = tenantService;
    this.userBusiness = userBusiness;
  }
  
  @Override
  public void authenticationTenant(String username) {
    log.info("Tenant [User:Company:id] executed");
    Page<User> page = userBusiness.findByLogin(username, null);
    if(page != null && page.getSize() > 0) {
      List<User> content = page.getContent();
      User user = content.get(0);
      this.tenantService.setId("tenant", user.getCompany().getId());
    }
  }
  
}
