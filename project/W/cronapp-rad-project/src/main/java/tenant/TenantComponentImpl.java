package tenant;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TenantComponentImpl implements TenantComponent {
  
  private static final Logger log = LoggerFactory.getLogger(TenantComponentImpl.class);

  private final TenantService tenantService;

  @Autowired
  public TenantComponentImpl(TenantService tenantService) {
      this.tenantService = tenantService;
  }

  @Override
  public void execute() {
    this.log.info("Tenant [User:Company:id] executed");
    this.tenantService.setId("tenant", user.getCompany().getId());
  }
}
