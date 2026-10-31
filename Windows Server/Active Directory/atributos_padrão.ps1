# Consulta os atributos padrão de um usuário no AD LOCAL e inclui a propriedade estendida de última data de logon

param(
    [Parameter(Mandatory=$true, HelpMessage="Insira o SamAccountName do usuário")]
    [string]$Identity
)

Get-ADUser -Identity $Identity -Properties LastLogonDate