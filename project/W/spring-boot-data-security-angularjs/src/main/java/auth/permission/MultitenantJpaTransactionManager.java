package auth.permission;

import javax.persistence.EntityManager;

import org.springframework.orm.jpa.EntityManagerHolder;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.support.TransactionSynchronizationManager;

public class MultitenantJpaTransactionManager extends JpaTransactionManager {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doBegin(Object transaction, TransactionDefinition definition) {
		super.doBegin(transaction, definition);
		TenantEntityManagerFactory.TENANT.set(TenantComponent.getId());
		final EntityManagerHolder emHolder = (EntityManagerHolder) TransactionSynchronizationManager
				.getResource(getEntityManagerFactory());
		final EntityManager em = emHolder.getEntityManager();
		final String tenantId = TenantComponent.getId();

		if (tenantId != null) {
			em.setProperty("tenant", tenantId);
		}
	}

	@Override
	protected EntityManager createEntityManagerForTransaction() {
		return super.createEntityManagerForTransaction();
	}
}