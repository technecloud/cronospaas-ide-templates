import api.rest.service.oauth2.flow.*;

/**
 * Classe que representa ...
 * 
 * @author Usuário de Teste
 * @version 1.0
 * @since 2015-07-09
 *
 */
 
public class TestOAuth2 {

	public static void main(String[] args) throws Exception {
		OAuth2Client client = new OAuth2Client(OAuth2Settings.TOKEN_URI,
				OAuth2Settings.REVOKE_URI, OAuth2Settings.CLIENT_ID,
				OAuth2Settings.CLIENT_SECRET);
		String response = client.authenticate("techne", "techne");
		System.out.println(response);
	}

}