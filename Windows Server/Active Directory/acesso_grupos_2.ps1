# Confirma se determinado usuário faz parte de um grupo no AD LOCAL retornando as informações do membro
#O bloco param garante a automação no terminal: em vez de abrir e editar o código sempre que precisar alterar o grupo ou o usuário, você passa os valores diretamente pelos parâmetros na linha de comando (ou responde aos prompts interativos do script).
param(
    [Parameter(Mandatory=$true, HelpMessage="Insira o nome do grupo do AD")]
    [string]$GroupName,

    [Parameter(Mandatory=$true, HelpMessage="Insira o SamAccountName do usuário")]
    [string]$Identity
)

Get-ADGroupMember -Identity $GroupName | Where-Object { $_.SamAccountName -eq $Identity }