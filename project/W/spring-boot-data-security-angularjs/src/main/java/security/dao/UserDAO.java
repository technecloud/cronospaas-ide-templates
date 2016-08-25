package security.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import security.entity.Role;
import security.entity.User;
import security.entity.UserRole;

/**
 * Realiza operação de Create, Read, Update e Delete no banco de dados.
 * Os métodos de create, edit, delete e outros estão abstraídos no JpaRepository
 * 
 * @see org.springframework.data.jpa.repository.JpaRepository
 * 
 * @generated
 */
@Repository("UserDAO")
@Transactional(transactionManager = "security-TransactionManager")
public interface UserDAO extends JpaRepository<User, java.lang.String> {

	/**
	 * Obtém a instância de User utilizando os identificadores
	 * 
	 * @param id
	 *          Identificador 
	 * @return Instância relacionada com o filtro indicado
	 * @generated
	 */
	@Query("SELECT entity FROM User entity WHERE entity.id = :id")
	public User findOne(@Param(value = "id") java.lang.String id);

	/**
	 * Remove a instância de User utilizando os identificadores
	 * 
	 * @param id
	 *          Identificador 
	 * @return Quantidade de modificações efetuadas
	 * @generated
	 */
	@Modifying
	@Query("DELETE FROM User entity WHERE entity.id = :id")
	public void delete(@Param(value = "id") java.lang.String id);

	/**
	 * Lista com paginação de acordo com a NamedQuery
	 * 
	 * @generated
	 */
	@Query("select u from User u")
	public Page<User> list(Pageable pageable);

	/**
	 * Lista com paginação de acordo com a NamedQuery
	 * 
	 * @generated
	 */
	@Query("select u.user from UserRole u where u.role.id = :roleid")
	public Page<User> findByRole(@Param(value = "roleid") java.lang.String roleid, Pageable pageable);

	/**
	 * Lista com paginação de acordo com a NamedQuery
	 * 
	 * @generated
	 */
	@Query("select u from User u where u.login = :login")
	public Page<User> findByLogin(@Param(value = "login") java.lang.String login, Pageable pageable);

	/**
	 * OneToMany Relation
	 * @generated
	 */
	@Query("SELECT entity FROM UserRole entity WHERE entity.user.id = :id")
	public Page<UserRole> findUserRole(@Param(value = "id") java.lang.String id, Pageable pageable);

	/**
	 * ManyToOne Relation
	 * @generated
	 */
	@Query("SELECT entity.role FROM UserRole entity WHERE entity.user.id = :id")
	public Page<Role> listRole(@Param(value = "id") java.lang.String id, Pageable pageable);

	/**
	 * ManyToOne Relation Delete
	 * @generated
	 */
	@Modifying
	@Query("DELETE FROM UserRole entity WHERE entity.user.id = :instanceId AND entity.role.id = :relationId")
	public int deleteRole(@Param(value = "instanceId") java.lang.String instanceId,
			@Param(value = "relationId") java.lang.String relationId);

}