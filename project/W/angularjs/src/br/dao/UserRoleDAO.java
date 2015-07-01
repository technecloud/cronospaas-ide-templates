package br.dao;

import javax.persistence.*;
import br.entity.*;

/**
 * Realiza operação de Create, Read, Update e Delete no banco de dados.
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-06-30
 *
 */
public class UserRoleDAO extends BasicDAO<String, UserRoleEntity> {

	/**
	 * UID da classe, necessário na serialização 
	 */
	private static final long serialVersionUID = 1531430292754816448l;

  /**
   * Guarda uma cópia da EntityManager na instância
   * 
   * @param entitymanager
   *          Tabela do banco
   */
  public UserRoleDAO(EntityManager entitymanager) {
    super(entitymanager);
  }

}