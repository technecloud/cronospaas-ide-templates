package security.entity;

import util.Hash;

import javax.persistence.*;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.util.UUID;

/**
 * Classe que representa a tabela USER
 *
 * @author Techne
 * @version 1.0
 * @since 2015-09-02
 */

@Entity
@Table(name = "\"USER\"")
@NamedQueries({
        @NamedQuery(name = "userList", query = "select u from User u"),
        @NamedQuery(name = "userFindByRole", query = "select u.user from UserRole u where u.role.id = :roleid"),
        @NamedQuery(name = "userFindByLoginAndPassword", query = "select u from User u where u.login = :login and u.password = :password")
})
@XmlRootElement
public class User implements Serializable {

  /**
   * UID da classe, necessário na serialização
   */
  private static final long serialVersionUID = -7784273682797551374l;

  @Id
  @Column(name = "id")
  private java.lang.String id = UUID.randomUUID().toString().toUpperCase();

  @Column(name = "name", nullable = false, unique = false)
  private java.lang.String name;

  @Column(name = "email", nullable = true, unique = false)
  private java.lang.String email;

  @Column(name = "login", nullable = false, unique = true)
  private java.lang.String login;

  @Column(name = "password", nullable = false, unique = false)
  private java.lang.String password;

  @Column(name = "picture", nullable = true, unique = false)
  private java.lang.String picture;

  /**
   * Construtor
   */
  public User() {
  }

  /**
   * Obtém email
   */
  public java.lang.String getEmail() {
    return this.email;
  }

  /**
   * Define email
   *
   * @param email email
   */
  public void setEmail(java.lang.String email) {
    this.email = email;
  }

  /**
   * Obtém name
   */
  public java.lang.String getName() {
    return this.name;
  }

  /**
   * Define name
   *
   * @param name name
   */
  public void setName(java.lang.String name) {
    this.name = name;
  }

  /**
   * Obtém id
   */
  public java.lang.String getId() {
    return this.id;
  }

  /**
   * Define id
   *
   * @param id id
   */
  public void setId(java.lang.String id) {
    this.id = id;
  }

  /**
   * Obtém login
   */
  public java.lang.String getLogin() {
    return this.login;
  }

  /**
   * Define login
   *
   * @param login login
   */
  public void setLogin(java.lang.String login) {
    this.login = login;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = Hash.md5(password);
  }

  /**
   * Obtém picture
   */
  public java.lang.String getPicture() {
    return this.picture;
  }

  /**
   * Define picture
   *
   * @param picture picture
   */
  public void setPicture(java.lang.String picture) {
    this.picture = picture;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    User user = (User) o;

    if (id != null ? !id.equals(user.id) : user.id != null) return false;
    if (name != null ? !name.equals(user.name) : user.name != null) return false;
    if (email != null ? !email.equals(user.email) : user.email != null) return false;
    if (login != null ? !login.equals(user.login) : user.login != null) return false;
    if (password != null ? !password.equals(user.password) : user.password != null) return false;
    return !(picture != null ? !picture.equals(user.picture) : user.picture != null);

  }

  @Override
  public int hashCode() {
    int result = id != null ? id.hashCode() : 0;
    result = 31 * result + (name != null ? name.hashCode() : 0);
    result = 31 * result + (email != null ? email.hashCode() : 0);
    result = 31 * result + (login != null ? login.hashCode() : 0);
    result = 31 * result + (password != null ? password.hashCode() : 0);
    result = 31 * result + (picture != null ? picture.hashCode() : 0);
    return result;
  }

  @Override
  public String toString() {
    return "User{" +
            "id='" + id + '\'' +
            ", name='" + name + '\'' +
            ", email='" + email + '\'' +
            ", login='" + login + '\'' +
            ", password='" + password + '\'' +
            ", picture='" + picture + '\'' +
            '}';
  }
}