package security.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PagedResourcesAssembler;
import org.springframework.hateoas.PagedResources;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import security.business.RoleBusiness;
import security.business.UserBusiness;
import security.business.UserRoleBusiness;
import security.entity.Role;
import security.entity.User;
import security.entity.UserRole;

/**
 * Controller para expor serviços REST de User
 * 
 * @author Usuário de Teste
 * @version 1.0
 * @generated
 **/
@RestController
@RequestMapping(value = "/api/security/rest/User")
public class UserREST {

	/**
	 * Classe de negócio para manipulação de dados
	 * 
	 * @generated
	 */
	@Autowired
	@Qualifier("UserBusiness")
	private UserBusiness userBusiness;

	/**
	 * @generated
	 */
	@Autowired
	@Qualifier("RoleBusiness")
	private RoleBusiness roleBusiness;
	/**
	 * @generated
	 */
	@Autowired
	@Qualifier("UserRoleBusiness")
	private UserRoleBusiness userRoleBusiness;

	/**
	 * Serviço exposto para novo registro de acordo com a entidade fornecida
	 * 
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.POST)
	public User post(@Validated @RequestBody final User entity) throws Exception {
		return userBusiness.post(entity);
	}

	/**
	 * Serviço exposto para salvar alterações de acordo com a entidade fornecida
	 * 
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.PUT)
	public User put(@Validated @RequestBody final User entity) throws Exception {
		return userBusiness.put(entity);
	}

	/**
	 * Serviço exposto para salvar alterações de acordo com a entidade e id fornecidos
	 * 
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.PUT, value = "/{id}")
	public User put(@PathVariable("id") final java.lang.String id, @Validated @RequestBody final User entity)
			throws Exception {
		return userBusiness.put(entity);
	}

	/**
	 * Serviço exposto para remover a entidade de acordo com o id fornecido
	 * 
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.DELETE, value = "/{id}")
	public void delete(@PathVariable("id") java.lang.String id) throws Exception {
		userBusiness.delete(id);
	}

	/**
	 * NamedQuery list
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.GET)
	public HttpEntity<PagedResources<User>> listParams(Pageable pageable, PagedResourcesAssembler assembler) {
		return new ResponseEntity<>(assembler.toResource(userBusiness.list(pageable)), HttpStatus.OK);
	}

	/**
	 * NamedQuery findByRole
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/findByRole/{roleid}")
	public HttpEntity<PagedResources<User>> findByRoleParams(@PathVariable("roleid") java.lang.String roleid,
			Pageable pageable, PagedResourcesAssembler assembler) {
		return new ResponseEntity<>(assembler.toResource(userBusiness.findByRole(roleid, pageable)), HttpStatus.OK);
	}

	/**
	 * NamedQuery findByLogin
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/findByLogin/{login}")
	public HttpEntity<PagedResources<User>> findByLoginParams(@PathVariable("login") java.lang.String login,
			Pageable pageable, PagedResourcesAssembler assembler) {
		return new ResponseEntity<>(assembler.toResource(userBusiness.findByLogin(login, pageable)), HttpStatus.OK);
	}

	/**
	 * OneToMany Relationship GET
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/{instanceId}/UserRole")
	public HttpEntity<PagedResources<UserRole>> findUserRole(@PathVariable("instanceId") java.lang.String instanceId,
			Pageable pageable, PagedResourcesAssembler assembler) {
		return new ResponseEntity<>(assembler.toResource(userBusiness.findUserRole(instanceId, pageable)),
				HttpStatus.OK);
	}

	/**
	 * OneToMany Relationship DELETE 
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.DELETE, value = "/{instanceId}/UserRole/{relationId}")
	public void deleteUserRole(@PathVariable("relationId") java.lang.String relationId) throws Exception {
		this.userRoleBusiness.delete(relationId);
	}

	/**
	 * OneToMany Relationship PUT
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.PUT, value = "/{instanceId}/UserRole/{relationId}")
	public UserRole putUserRole(@Validated @RequestBody final UserRole entity,
			@PathVariable("relationId") java.lang.String relationId) throws Exception {
		return this.userRoleBusiness.put(entity);
	}

	/**
	 * OneToMany Relationship POST
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/{instanceId}/UserRole")
	public UserRole postUserRole(@Validated @RequestBody final UserRole entity,
			@PathVariable("instanceId") java.lang.String instanceId) throws Exception {
		User user = this.userBusiness.get(instanceId);
		entity.setUser(user);
		return this.userRoleBusiness.post(entity);
	}

	/**
	 * ManyToMany Relationship GET
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/{instanceId}/Role")
	public HttpEntity<PagedResources<Role>> listRole(@PathVariable("instanceId") java.lang.String instanceId,
			Pageable pageable, PagedResourcesAssembler assembler) {
		return new ResponseEntity<>(assembler.toResource(userBusiness.listRole(instanceId, pageable)), HttpStatus.OK);
	}

	/**
	 * ManyToMany Relationship POST
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.POST, value = "/{instanceId}/Role")
	public User postRole(@Validated @RequestBody final Role entity,
			@PathVariable("instanceId") java.lang.String instanceId) throws Exception {
		UserRole newUserRole = new UserRole();

		User instance = this.userBusiness.get(instanceId);

		newUserRole.setRole(entity);
		newUserRole.setUser(instance);

		this.userRoleBusiness.post(newUserRole);

		return newUserRole.getUser();
	}

	/**
	 * ManyToMany Relationship DELETE
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.DELETE, value = "/{instanceId}/Role/{relationId}")
	public void deleteRole(@PathVariable("instanceId") java.lang.String instanceId,
			@PathVariable("relationId") java.lang.String relationId) {
		this.userBusiness.deleteRole(instanceId, relationId);
	}

	/**
	 * Serviço exposto para recuperar a entidade de acordo com o id fornecido
	 * 
	 * @generated
	 */
	@RequestMapping(method = RequestMethod.GET, value = "/{id}")
	public User get(@PathVariable("id") java.lang.String id) throws Exception {
		return userBusiness.get(id);
	}
}
