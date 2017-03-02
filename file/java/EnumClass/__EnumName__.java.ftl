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
 
public enum ${EnumName} {
    SUNDAY, MONDAY, TUESDAY, WEDNESDAY,
    THURSDAY, FRIDAY, SATURDAY 
}
