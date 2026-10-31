# Adiciona um ou mais utilizadores a um grupo específico no Active Directory

param(
    [Parameter(Mandatory=$true, HelpMessage="Insira o nome ou SamAccountName do grupo destino")]
    [string]$Identity,

    [Parameter(Mandatory=$true, HelpMessage="Insira o(s) SamAccountName(s) do(s) utilizador(es) separados por vírgula")]
    [string[]]$Members
)

Add-ADGroupMember -Identity $Identity -Members $Members