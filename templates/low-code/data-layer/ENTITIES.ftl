<#macro single_line><#local captured><#nested></#local>${ captured?replace("^\\s+|\\s+$|\\n|\\r", "", "rm") }</#macro>
<#macro getter_setter classClass field fieldName>
    /**
    * Obtém ${fieldName}
    * return ${fieldName}
    * @generated
    */
    <#if field.securityAnnotation != "">
    ${field.securityAnnotation}
    </#if>
    public ${field.type} get${fieldName?cap_first}() {
        return this.${fieldName};
    }

    /**
    * Define ${fieldName}
    * @param ${fieldName} ${fieldName}
    * @generated
    */
    public ${classClass.name} set${fieldName?cap_first}(${field.type} ${fieldName}) {
        <#if field.isEncryption() && !clazz.hasStrongPassword()>
        this.${fieldName} = ${fieldName}.startsWith(ENCRYPT) ? ${fieldName} : new BCryptPasswordEncoder().encode(${fieldName});
        <#else>
        this.${fieldName} = ${fieldName};
        </#if>        
        return this;
    }
</#macro>    

package ${entityPackage}<#if subPackage??>.${subPackage}</#if>;

import java.io.*;
import javax.persistence.*;
import java.util.*;
import javax.xml.bind.annotation.*;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonFilter;
import cronapi.rest.security.CronappSecurity;
<#if clazz.hasRowVersion() || clazz.hasXML()>
import org.eclipse.persistence.annotations.Convert;
import org.eclipse.persistence.annotations.Converter;
</#if>
<#if clazz.hasRowVersion()>
import cronapi.database.VersionConverter;
</#if>
<#if clazz.hasXML()>
import cronapi.database.ByteConverter;
</#if>
<#assign hasCloudStorage = clazz.hasCloudStorage()>
<#if hasCloudStorage>
    import cronapi.CronapiCloud;
</#if>
<#if clazz.hasSearchable()>
    import cronapi.CronapiSearchable;
</#if>
<#if clazz.hasFileDataBase()>
    import cronapi.CronapiByteHeaderSignature;
</#if>
<#if clazz.hasEncryption()>
  <#if clazz.hasStrongPassword()>
import cronapp.framework.persistence.ValidPassword;
import cronapp.framework.persistence.ValidPasswords;
import cronapp.framework.persistence.PasswordEncoderListener;
  <#else>
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;  
  </#if>
</#if>
<#list clazz.imports as import>
    import ${import};
</#list>
<#if subPackage??>import ${entityPackage}.*;</#if>
<#list clazz.subPackageToImport as subPackageToImport>
    <#if subPackage?? && subPackageToImport != subPackage >
        import ${entityPackage}.${subPackageToImport}.*;
    </#if>
</#list>

<#if (clazz.multitenantClass)>
import org.eclipse.persistence.annotations.*;
</#if>
/**
* Classe que representa a tabela <#if tableName??>${tableName}<#else>${clazz.name?upper_case}</#if>
* @generated
*/
@Entity
<#if clazz.hasCompositeKey()>
@IdClass(${clazz.name + 'PK'}.class)
</#if>
@Table(name = "\"<#if tableName??><#if persistenceProvider == "oracle">${tableName?upper_case}<#else>${tableName}</#if><#else>${clazz.name?upper_case}</#if>\""<#if schemeName??>, schema="\"<#if persistenceProvider == "oracle">${schemeName?upper_case}<#else>${schemeName}</#if>\"" </#if><#if (clazz.fieldsUniqueKey?size > 0) > ,uniqueConstraints=@UniqueConstraint(name="UNQ_<#if tableName??>${tableName}<#else>${clazz.name?upper_case}</#if>_0", columnNames={
    <#list clazz.fieldsUniqueKey as field>"${field.dbFieldName}" <#if field?has_next>,</#if></#list>})</#if>)
@XmlRootElement
<#if clazz.rest>
@CronappSecurity<#if restSecurityDescription??>(${restSecurityDescription})</#if>
</#if>
<#if (clazz.multitenantClass)>
@Multitenant(MultitenantType.SINGLE_TABLE)
    <#if (clazz.multitententFields?size > 1)>
@TenantDiscriminatorColumns({
    </#if>
    <#list clazz.multitententFields as field>
@TenantDiscriminatorColumn(name = "${field.dbFieldName}", contextProperty = "${field.multitenantContext}")<#if field_has_next>,</#if>
    </#list>
    <#if (clazz.multitententFields?size > 1)>
})
    </#if>
</#if>
@JsonFilter("${entityPackage}<#if subPackage??>.${subPackage}</#if>.${clazz.name}")
<#if clazz.listeners??>
@EntityListeners(${clazz.listeners})
</#if>
<#if clazz.hasRowVersion()>
@Converter(
  name="version",
  converterClass=VersionConverter.class
)
</#if>
<#if clazz.hasXML()>
@Converter(
  name="bytes",
  converterClass=ByteConverter.class
)
</#if>
<#if clazz.hasStrongPassword() && clazz.hasEncryption()>
@ValidPasswords({
    <#list clazz.fields as field>
        <#if field.isEncryption()>
    @ValidPassword(passwordProperty = "${field.name}", passwordHistoryProperty = "${field.name}History"),
        </#if>
    </#list>
})    
</#if>
public class ${clazz.name} implements Serializable {
<#if clazz.hasEncryption() && !clazz.hasStrongPassword()>
    /**
    * Variável privada para verificação da criptofrafia
    *
    * @generated
    */
    private static final String ENCRYPT = "$2a$10$";
</#if>
    /**
    * UID da classe, necessário na serialização
    * @generated
    */
    private static final long serialVersionUID = 1L;
<#list clazz.fields as field>
    <#if field.primaryKey>
        <#assign name = "${field.name}">

    /**
    * @generated
    */
    @Id
        <#if field.generationType?? && field.generationType == "Identity">
            <#if persistenceProvider == "mysql">
    @GeneratedValue(strategy = GenerationType.AUTO)
            <#else>
    @GeneratedValue(strategy = GenerationType.IDENTITY)
            </#if>
        </#if>
        <#if field.isVersion()>
    @Version
        <#elseif field.isDate()>
    @Temporal(TemporalType.DATE)
        <#elseif field.isTime()>
    @Temporal(TemporalType.TIME)
        <#elseif field.isTimestamp()>
    @Temporal(TemporalType.TIMESTAMP)
        </#if>
        <#if (field.relationNames?size == 1)>
            <#list field.relationNames?keys as key>
                <#if key??>
    @JoinColumn(name="${key}", nullable = ${field.nullable?c}, referencedColumnName = "${field.relationNames[key]}", insertable=${field.insertable?c}, updatable=${field.updatable?c})
                </#if>
            </#list>
        <#elseif (field.relationNames?size > 1)>
            <#assign i= field.relationNames?size>
    @JoinColumns({
            <#list field.relationNames?keys as key>
                <#if key??>
    @JoinColumn(name="${key}", nullable = ${field.nullable?c}, referencedColumnName = "${field.relationNames[key]}", insertable=${field.insertable?c}, updatable=${field.updatable?c})
                    <#if (i>1)>,</#if>
                </#if>
                <#assign i = i-1>
            </#list>
    })
        <#else>
    @Column(name = "${field.dbFieldName}", nullable = ${field.nullable?c}<#if !field.primaryKey>, unique = ${field.unique?c}</#if><#if field.length??>, length=${field.length?c}</#if><#if field.precision??>, precision=${field.precision?c}</#if><#if field.scale??>, scale=${field.scale?c}</#if>, insertable=${field.insertable?c}, updatable=${field.updatable?c}<#if field.columnDefinition??>, columnDefinition = "${field.columnDefinition}"</#if>)
        </#if>
        ${field.modifier} <#if field.arrayRelation>${field.type}<#else>${field.type}</#if> ${name}<#if field.defaultValue?has_content> = ${field.defaultValue}<#elseif field.primaryKey && field.generationType?? && field.generationType == "UUID"> = UUID.randomUUID().toString().toUpperCase()</#if>;
    </#if>
</#list>
<#list clazz.fields as field>
    <#if !field.primaryKey>

    /**
    * @generated
    */
        <#if (field.rowVersion)!false>
    @Convert("version")
        </#if>
        <#if (field.XML)!false>
    @Convert("bytes")
        </#if>
        <#if field.relation>
    @OneToOne
        <#elseif field.reverseRelation>
    @ManyToOne
        </#if>
        <#if (field.relationNames?size == 1)>
            <#list field.relationNames?keys as key>
                <#if key??>
    @JoinColumn(name="${key}", nullable = ${field.nullable?c}, referencedColumnName = "${field.relationNames[key]}", insertable=${field.insertable?c}, updatable=${field.updatable?c}<#if field.cascade>, foreignKey = @ForeignKey(name = "<#if tableName??>${tableName}<#else>${clazz.name?upper_case}</#if>_${key?upper_case}_${field.dbTableRelationClazz}_${field.relationNames[key]?upper_case}", foreignKeyDefinition = "FOREIGN KEY (${key}) REFERENCES ${field.dbTableRelationClazz} (${field.relationNames[key]}) ON DELETE CASCADE")<#elseif field.fkName??>, foreignKey = @ForeignKey(name = "${field.fkName}", foreignKeyDefinition = "FOREIGN KEY (${key}) REFERENCES ${field.dbTableRelationClazz} (${field.relationNames[key]})")</#if>)
                </#if>
            </#list>
        <#elseif (field.relationNames?size > 1)>
            <#assign i= field.relationNames?size>
    @JoinColumns({
            <#list field.relationNames?keys as key>
                <#if key??>
    @JoinColumn(name="${key}", nullable = ${field.nullable?c}, referencedColumnName = "${field.relationNames[key]}", insertable=${field.insertable?c}, updatable=${field.updatable?c}<#if field.fkName??>, foreignKey = @ForeignKey(name = "${field.fkName}", foreignKeyDefinition = "FOREIGN KEY (${key}) REFERENCES ${field.dbTableRelationClazz} (${field.relationNames[key]})")</#if>)
                    <#if (i>1)>,</#if>
                </#if>
                <#assign i = i-1>
            </#list>
    })
        <#elseif field.arrayRelation>
    @OneToMany(fetch = FetchType.LAZY, mappedBy="${field.mappedBy}", insertable=${field.insertable?c}, updatable=${field.updatable?c})
        <#else>
            <#if field.transient>
    @Transient
            <#else>
                <#if field.isVersion()>
    @Version
                <#elseif field.isDate()>
    @Temporal(TemporalType.DATE)
                <#elseif field.isTime()>
    @Temporal(TemporalType.TIME)
                <#elseif field.isTimestamp()>
    @Temporal(TemporalType.TIMESTAMP)
                </#if>
    @Column(name = "${field.dbFieldName}", nullable = ${field.nullable?c}<#if !field.primaryKey>, unique = ${field.unique?c}</#if><#if field.length??>, length=${field.length?c}</#if><#if field.precision??>, precision=${field.precision?c}</#if><#if field.scale??>, scale=${field.scale?c}</#if>, insertable=${field.insertable?c}, updatable=${field.updatable?c}<#if field.columnDefinition??>, columnDefinition = "${field.columnDefinition}"</#if>)
            </#if>
        </#if>
        <#if (field.ignore)>
    @JsonIgnore
        </#if>
        <#if field.isCloudStorage()>
    @CronapiCloud(type = "${field.getStorageType()}", value="${field.getStorageKey()}", id="${field.getStorageId()}", secret="${field.getStorageSecret()}")
        </#if>
        <#if field.isFileDataBase()>
    @CronapiByteHeaderSignature
        </#if>
        <#if field.isSearchable()>
    @CronapiSearchable
        </#if>
        ${field.securityAnnotation}
        ${field.modifier} <#if field.arrayRelation>${field.type}<#else>${field.type}</#if> ${field.name}<#if field.defaultValue?has_content> = ${field.defaultValue}</#if>;
    </#if>

    <#if field.isEncryption()>    
    /**
    * @generated
    */
    <@single_line>@Column(name = "${field.dbFieldName}_history"
        <#if !field.insertable>, insertable = ${field.insertable?c}</#if>
        <#if !field.updatable>, updatable = ${field.updatable?c}</#if>
    )</@single_line>
    ${field.modifier} ${field.type} ${field.name}History;
    </#if>
</#list>

    /**
    * Construtor
    * @generated
    */
    public ${clazz.name}(){
    }

<#list clazz.fields as field>
    <@getter_setter clazz field "${field.name}" />
    <#if field.isEncryption()>
    <@getter_setter clazz field "${field.name}History" />
    </#if>
</#list>

    /**
    * @generated
    */
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
${clazz.name} object = (${clazz.name})obj;
<#list clazz.fields as field>
    <#if field.primaryKey>
        <#assign name = "${field.name}">
        if (${name} != null ? !${name}.equals(object.${name}) : object.${name} != null) return false;
    </#if>
</#list>
        return true;
    }

    /**
    * @generated
    */
    @Override
    public int hashCode() {
        int result = 1;
<#list clazz.fields as field>
    <#if field.primaryKey && !field.isTypePrimitive()>
        <#assign name = "${field.name}">
        result = 31 * result + ((${name} == null) ? 0 : ${name}.hashCode());
    </#if>
</#list>
        return result;
    }

}