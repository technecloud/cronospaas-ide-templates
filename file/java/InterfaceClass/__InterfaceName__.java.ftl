<#if PackageName?has_content && (PackageName?length > 0) >
package ${PackageName};
</#if>		


/**
 * Enumeração que representa ...
 * 
 * @author ${UserName}
 * @version 1.0
 * @since ${.now?string("yyyy-MM-dd")}
 *
 */
 
public interface ${InterfaceName}  {

    //  wheel revolutions per minute
    void changeCadence(int newValue);

    void changeGear(int newValue);

    void speedUp(int increment);

    void applyBrakes(int decrement);
}
