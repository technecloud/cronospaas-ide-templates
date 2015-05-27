package br.com.dao;

import javax.persistence.*;
import api.rest.util.*;
import br.com.entity.*;

/**
 * Realiza operação de Create, Read, Update e Delete no banco de dados.
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-05-27
 *
 */
public class PessoaDAO extends BasicDAO<String, PessoaEntity> {

	/**
	 * UID da classe, necessário na serialização 
	 */
	private static final long serialVersionUID = 8982256704205351543l;

  /**
   * Guarda uma cópia da EntityManager na instância
   * 
   * @param entitymanager
   *          Tabela do banco
   */
  public PessoaDAO(EntityManager entitymanager) {
    super(entitymanager);
  }

}