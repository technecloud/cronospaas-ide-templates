package br.dao;

import java.lang.reflect.ParameterizedType;
import java.util.*;
import javax.persistence.*;

import javax.xml.bind.*;
import javax.xml.transform.stream.*;
import javax.xml.transform.*;
import java.io.*;


/**
 * Operações básicas de CRUD no banco
 * 
 * @author Techne
 * @version 1.0
 * @since 2014-09-29
 * 
 * @param <PK>
 *          Chave primária
 * @param <T>
 *          Valor
 *
 */
public class BasicDAO<PK, T> {
  
  /**
   * Cópia local da tabela em uso
   */
  protected EntityManager entityManager;
  
  /**
   * O construtor guarda uma cópia do EntityManager na instância
   * 
   * @param entitymanager Tabela do banco de dados
   */
  public BasicDAO(EntityManager entitymanager) {
    this.entityManager = entitymanager;
  }
  
  /**
   * Retorna o EntityManager da instância
   * 
   * @return EntityManager
   */
  public EntityManager getEntityManager() {
    return this.entityManager;
  }
  
  /**
   * Busca valor de acordo com a chave primária
   * 
   * @param pk Chave primária
   * @return T Valor
   */
  @SuppressWarnings("unchecked")
  public T getById(final Object pk) {
    return (T)this.entityManager.find(getTypeClass(), pk);
  }
  
  /**
   * Grava valor no banco
   * 
   * @param entity Linha da tabela a ser persistida no banco de dados
   */
  public void save(final T entity) {
    this.entityManager.persist(entity);
  }
  
  /**
   * Atualiza valor do banco
   * 
   * @param entity Linha da tabela a ser atualizada
   */
  public void update(final T entity) {
    this.entityManager.merge(entity);
  }
  
  /**
   * Apaga valor do banco
   * 
   * @param entity Linha da tabela a ser excluída
   */
  public void delete(final T entity) {
    this.entityManager.remove(entity);
  }
  
  /**
   * Retorna uma lista com todos os valores da EntityManger
   * 
   * @return List Lista com todas as linhas da tabela do banco de dados
   */
  @SuppressWarnings("unchecked")
  public List<T> findAll() {
    return this.entityManager.createQuery(("SELECT OBJECT(a) FROM " + getTypeClass().getName() + " a")).getResultList();
  }
  
  /**
    * Retorna lista de entidades por atributo
    * @param attributeName Nome do Atributo
    * @param attributeValue Valor do Atributo
    * @return Entidades
    **/
  public List<T> findByAttribute(String attributeName, String attributeValue) {
    String jql = "SELECT OBJECT(a) FROM " + getTypeClass().getName() + " a WHERE a." + attributeName + " LIKE :" + attributeName;
    Query q = this.entityManager.createQuery(jql);
    q.setParameter(attributeName, attributeValue);
    return q.getResultList();
  }
  
  
  /**
   * Retorna uma classe do mesmo tipo que o parâmetro ainda desconhecido
   * 
   * @return Class Tipo da classe desconhecida
   */
  private Class<?> getTypeClass() {
    return (Class<?>)((ParameterizedType)this.getClass().getGenericSuperclass()).getActualTypeArguments()[1];
  }
  
  /**
   * Retorna uma lista com todos os valores da EntityManger com paginacão
   * 
   * @param pageIndex Pagina
   * @param noOfRecords Numero de registros
   * @return List Lista com todas as linhas da tabela do banco de dados
   */
  public List<T> findAll(int pageIndex, int noOfRecords) {
    Query q = this.entityManager.createQuery(("SELECT OBJECT(a) FROM " + getTypeClass().getName() + " a"));
    q.setMaxResults(noOfRecords);
    q.setFirstResult(pageIndex * noOfRecords);
    return q.getResultList();
  }
  
  
  class MySchemaOutputResolver extends SchemaOutputResolver {
    private StringWriter stringWriter = new StringWriter();    

    public Result createOutput(String namespaceURI, String suggestedFileName) throws IOException  {
        StreamResult result = new StreamResult(stringWriter);
        result.setSystemId(suggestedFileName);
        return result;
    }

    public String getSchema() {
        return stringWriter.toString();
    }
  }


  public Object options(Class<?> clazz) throws Exception{
    MySchemaOutputResolver sor = new MySchemaOutputResolver();
    JAXBContext context = JAXBContext.newInstance(clazz);
    context.generateSchema(sor);
  	return sor.getSchema();
  }
  
  
}
