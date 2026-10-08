<#
.SYNOPSIS
    Cria usuários em lote no Active Directory local com atributos para sincronia híbrida (Microsoft 365 / Exchange Online).
.DESCRIPTION
    Configura atributos avançados como mailNickname, targetAddress e proxyAddresses
    para provisionamento correto em cenários de sincronização com o Azure AD/Entra ID.
.PARAMETER Usuarios
    Uma lista (Array) de hashes contendo Nome, NomeCompleto e Email de cada usuário.
.PARAMETER DistinguishedNamePath
    O caminho da OU onde os usuários serão criados.
.PARAMETER SenhaPadrao
    A senha inicial segura para as contas.
.EXAMPLE
    \$lista = @(@{Nome="joao.berriel"; NomeCompleto="João Berriel"; Email="joao.berriel@dominio.gov.br"})
    .\New-BulkADHybridUsers.ps1 -Usuarios \$lista -DistinguishedNamePath "OU=DIGES,DC=empresa,DC=local" -SenhaPadrao "SenhaSegura123"
#>
param(
    [Parameter(Mandatory=\$true)]
    [array]\$Usuarios,

    [Parameter(Mandatory=\$true)]
    [string]\$DistinguishedNamePath,

    [Parameter(Mandatory=\$true)]
    [string]\$SenhaPadrao
)

securePassword = ConvertTo-SecureString SenhaPadrao -AsPlainText -Force

foreach (user in Usuarios) {
    Write-Host "Criando usuário: \$(user.NomeCompleto) na OU: DistinguishedNamePath" -ForegroundColor Cyan
    
    New-ADUser `
        -Name $user.NomeCompleto `
        -SamAccountName \$user.Nome `
        -EmailAddress $user.Email `
        -AccountPassword \$securePassword `
        -ChangePasswordAtLogon $true `
        -Enabled \$true `
        -Path $DistinguishedNamePath `
        -OtherAttributes @{
            'mailNickname'               = \$user.Nome
            'msExchRecipientDisplayType' = -2147483642
            'msExchRecipientTypeDetails' = 2147483648
            'msExchRemoteRecipientType'  = 1
            'targetAddress'               = "SMTP:(user.Nome)@://onmicrosoft.com"
            'proxyAddresses'             = @(
                "SMTP:(user.Email)"
                "smtp:(user.Nome)@://onmicrosoft.com"
            )
        }
}