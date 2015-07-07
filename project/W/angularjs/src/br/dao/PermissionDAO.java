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
public class PermissionDAO extends BasicDAO<String, PermissionEntity> {

	/**
	 * UID da classe, necessário na serialização 
	 */
	private static final long serialVersionUID = 5058846063994205193l;

  /**
   * Guarda uma cópia da EntityManager na instância
   * 
   * @param entitymanager
   *          Tabela do banco
   */
  public PermissionDAO(EntityManager entitymanager) {
    super(entitymanager);
  }
}