package auth.permission;

import org.springframework.stereotype.Component;

@Component
public class TenantComponent {

	private ThreadLocal<String> tenantContext = new ThreadLocal<>();
	private static String id;

	public static void setId(String id) {
		TenantComponent.id = id;
	}

	public static String getId() {
		return TenantComponent.id;
	}
}
