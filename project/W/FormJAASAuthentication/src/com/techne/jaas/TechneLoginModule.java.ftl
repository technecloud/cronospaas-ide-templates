package com.techne.jaas;

import java.io.IOException;
import java.util.*;

import javax.security.auth.Subject;
import javax.security.auth.callback.*;
import javax.security.auth.login.*;
import javax.security.auth.spi.LoginModule;

public class TechneLoginModule implements LoginModule {

	private CallbackHandler handler;
	private Subject subject;
	private UserPrincipal userPrincipal;
	private RolePrincipal rolePrincipal;
	private String login;
	private List<String> userGroups;
	private String USERNAME = "${username}";
	private String PASSWORD = "${password}";

	@Override
	public void initialize(Subject subject, CallbackHandler callbackHandler,
			Map<String, ?> sharedState, Map<String, ?> options) {

		handler = callbackHandler;
		this.subject = subject;
	}

	@Override
	public boolean login() throws LoginException {

		Callback[] callbacks = new Callback[2];
		callbacks[0] = new NameCallback("login");
		callbacks[1] = new PasswordCallback("password", true);

		try {
			handler.handle(callbacks);
			String name = ((NameCallback) callbacks[0]).getName();
			String password = String.valueOf(((PasswordCallback) callbacks[1])
					.getPassword());

			// Here we validate the credentials against some
			// authentication/authorization provider.
			// It can be a Database, an external LDAP, a Web Service, etc.
			if (name != null && name.equals(USERNAME) && password != null
					&& password.equals(PASSWORD)) {
				login = name;
				userGroups = new ArrayList<String>();
				userGroups.add("admin");
				return true;
			}

			// If credentials are NOT OK we throw a LoginException
			throw new LoginException("Authentication failed");

		} catch (IOException e) {
			throw new LoginException(e.getMessage());
		} catch (UnsupportedCallbackException e) {
			throw new LoginException(e.getMessage());
		}

	}

	@Override
	public boolean commit() throws LoginException {

		userPrincipal = new UserPrincipal(login);
		subject.getPrincipals().add(userPrincipal);

		if (userGroups != null && userGroups.size() > 0) {
			for (String groupName : userGroups) {
				rolePrincipal = new RolePrincipal(groupName);
				subject.getPrincipals().add(rolePrincipal);
			}
		}

		return true;
	}

	@Override
	public boolean abort() throws LoginException {
		return false;
	}

	@Override
	public boolean logout() throws LoginException {
		subject.getPrincipals().remove(userPrincipal);
		subject.getPrincipals().remove(rolePrincipal);
		return true;
	}



}
