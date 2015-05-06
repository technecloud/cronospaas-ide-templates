# Parâmetros

nome_do_arquivo : ${nome_do_arquivo}
data_inicial    : ${data_inicial}
numero_da_sorte : ${numero_da_sorte}

# Conteúdo dinâmico

<#assign x=10>
<#list 1..x as i>
Linha  ${i}
</#list>
