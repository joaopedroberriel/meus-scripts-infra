# Retorna os direitos de acesso de um grupo ou utilizador específico do AD numa determinada pasta de rede

param(
    [Parameter(Mandatory=$true, HelpMessage="Insira o caminho completo do diretório ou pasta de rede")]
    [string]$Path,

    [Parameter(Mandatory=$true, HelpMessage="Insira o nome do grupo ou utilizador do AD (ex: GRP_LEITURA ou DOMINIO\GRP_LEITURA)")]
    [string]$GroupName
)

(Get-Acl -Path $Path).Access | Where-Object { $_.IdentityReference -like "*$GroupName*" } | Format-Table IdentityReference, FileSystemRights, AccessControlType, IsInherited -AutoSize