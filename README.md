# Repositório de Automação em Infraestrutura(Corporativa): Windows Server & Azure AD

Central de scripts PowerShell focada na administração de ambientes híbridos corporativos, Active Directory Domain Services (AD DS) e Microsoft Entra ID.

---

## Pré-requisitos Técnicos

Antes de executar os scripts contidos neste repositório, garanta que você possui os seguintes módulos instalados no seu terminal administrativa:

*   Módulo RSAT Active Directory (`ActiveDirectory`)

```powershell
# Comando para instalar ferramentas do AD no Windows 10/11
Add-WindowsCapability -Online -Name RSAT.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0
```

---

## Aviso Importante (Disclaimer)

> **Atenção:** Todos os scripts disponibilizados neste repositório foram criados para automação de tarefas administrativas. **Nunca execute códigos diretamente em ambientes de produção** sem antes validá-los e testá-los exaustivamente em um ambiente de homologação ou laboratório isolado.
