# Atribui permissões NTFS a um grupo de segurança num diretório especificado com herança para subpastas e ficheiros

param(
    [Parameter(Mandatory=$true, HelpMessage="Insira o caminho completo do diretório ou pasta de rede")]
    [string]$Path,

    [Parameter(Mandatory=$true, HelpMessage="Insira o grupo ou utilizador (ex: DOMINIO\Grupo)")]
    [string]$IdentityReference,

    [Parameter(Mandatory=$false)]
    [ValidateSet("ReadAndExecute", "Modify", "FullControl", "Read", "Write")]
    [string]$Rights = "ReadAndExecute",

    [Parameter(Mandatory=$false)]
    [ValidateSet("Allow", "Deny")]
    [string]$AccessType = "Allow"
)

$Acl = Get-Acl -Path $Path

$Rule = New-Object System.Security.AccessControl.FileSystemAccessRule(
    $IdentityReference,
    $Rights,
    "ContainerInherit,ObjectInherit",
    "None",
    $AccessType
)

$Acl.AddAccessRule($Rule)
Set-Acl -Path $Path -AclObject $Acl