<?xml version="1.0" encoding="UTF-8"?>
<#assign type = "JS">
<#if isSrc??>
<#assign type = isSrc?then('JAVA','JS')  >
</#if>
<blockly formTarget="" resourceType="${type}" ruleDescription="${Name?xml}" ruleName="${Name?xml}" ruleSynchronous="false" ruleType="I">
<block colour="#995ba5" id="Anb:u5+^,0vLkL9QIqn5" tooltip="${Name?xml} - ${FunctionName?xml}" type="procedures_defreturn" x="-350" y="130">
<mutation>
  <#if param??>
  <arg name="${param}"/>
  </#if>
</mutation>
<field name="NAME">${FunctionName?xml}</field>
<comment h="80" pinned="false" w="160">${Name?xml}</comment>
</block>
</blockly>
