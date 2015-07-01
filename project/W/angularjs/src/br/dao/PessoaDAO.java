package br.dao;

import javax.persistence.*;
import br.entity.*;

/**
 * Realiza operação de Create, Read, Update e Delete no banco de dados.
 * 
 * @author Techne
 * @version 1.0
 * @since 2015-07-01
 *
 */
public class PessoaDAO extends BasicDAO<String, PessoaEntity> {

	/**
	 * UID da classe, necessário na serialização 
	 */
	private static final long serialVersionUID = 4519153614865662414l;

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