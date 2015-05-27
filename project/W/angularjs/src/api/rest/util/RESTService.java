package api.rest.util;

import javax.ws.rs.core.*;

/**
 * Interface responsável pela definição de operações padrões para serviços REST
 * 
 * @author Usuário de Teste
 * @version 1.0
 * @since 2015-05-25
 *
 */
public interface RESTService<T>  {

  /**
   * Este método é utilizado para retornar os valores paginados.
   * @param page número da página a ser listada
   * @param size  quantidade de registros a serem buscados
   * @return Response retorna um registro contendo os valores especificados.
   */
  public Response get(Integer page, Integer size);

  /**
   * Este método é utilizado para retornar um registro atraavés do identificador.
   * @param id Identificador do registro
   * @return Response retorna o registro encontrado.
   */
  public Response getById(String sid);

  /**
   * Este método é utilizado para inserir um registro.
   * @param entity Registro a ser inserido
   */
  public Response post(T entity);

  
  /**
   * Este método é utilizado para atualizar um registro.
   * @param entity Registro a ser atualizado
   */
  public Response put(T entity);

   /**
   * Este método é utilizado para remover um registro.
   * @param entity Registro a ser atualizado
   */
  public Response delete(String sid);

  
  /**
   * Este método é utilizado para obter a lista de metadados de uma entidade
   */
  public Response options();
}