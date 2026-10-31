# Lista todos os membros pertencentes a um grupo específico no Active Directory

param(
    [Parameter(Mandatory=$true, HelpMessage="Insira o nome ou SamAccountName do grupo a consultar")]
    [string]$Identity
)

Get-ADGroupMember -Identity $Identity | Select-Object Name, SamAccountName