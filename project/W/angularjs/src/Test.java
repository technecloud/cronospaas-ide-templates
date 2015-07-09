

/**
 * Classe que representa ...
 * 
 * @author Usuário de Teste
 * @version 1.0
 * @since 2015-07-08
 *
 */
 
public class Test {

  public static void main(String ... args){
    //String path = "/js/services.js";
    String path = "http://cl4appf.com/x.gif?url=http%3A%2F%2F192.168.247.193%3A10075%2F%23%2Fpage%2Flogin&ref=";
    path = "/api/rest/User";
    path = "admin";
//    String regex = "/(.)+\\.(js|css|jpg|gif|png|ico)(.)*";
    String regex = "/api/rest/(User|Role|UserRole|Permission)";
    regex = "^(svn|cvs|nvs|mvc)$";
    regex = "^((?!(svn|cvs)).)*$";
    System.out.println( path.matches(regex) );
      
  }
}
