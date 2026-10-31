# Cria um novo grupo de segurança ou de distribuição no Active Directory com escopo e OU configuráveis

param(
    [Parameter(Mandatory=$true, HelpMessage="Insira o nome do grupo a ser criado")]
    [string]$Name,

    [Parameter(Mandatory=$false, HelpMessage="Insira o caminho da Unidade Organizacional (OU) onde o grupo será criado")]
    [string]$Path = "OU=Grupos,DC=empresa,DC=local",

    [Parameter(Mandatory=$false)]
    [ValidateSet("Security", "Distribution")]
    [string]$GroupCategory = "Security",

    [Parameter(Mandatory=$false)]
    [ValidateSet("Global", "Universal", "DomainLocal")]
    [string]$GroupScope = "Global"
)

New-ADGroup `
    -Name $Name `
    -SamAccountName $Name `
    -GroupCategory $GroupCategory `
    -GroupScope $GroupScope `
    -Path $Path