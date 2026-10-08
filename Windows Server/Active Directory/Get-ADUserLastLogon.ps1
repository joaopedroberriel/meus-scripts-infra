
#Retorna duas informações específicas do usuário puxadas do AD LOCAL: nome de usuário e ao lado o seu último logon

param(
    [Parameter(Mandatory=$true, HelpMessage="Insira o SamAccountName do usuário")]
    [string]$Identity
)

Get-ADUser $Identity -Properties LastLogonDate | 
    Select-Object SamAccountName, LastLogonDate 