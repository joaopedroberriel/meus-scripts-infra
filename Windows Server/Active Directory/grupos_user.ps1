# Lista todos os grupos do AD LOCAL aos quais um utilizador específico pertence

param(
    [Parameter(Mandatory=$true, HelpMessage="Insira o SamAccountName do utilizador")]
    [string]$Identity
)

Get-ADPrincipalGroupMembership -Identity $Identity | Select-Object Name