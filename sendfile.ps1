function sendFileToAzure {
<#
.SYNOPSIS
    This function send a file inside a blob container in Azure without a Connection to Azure or Azure Cli/PowerShell tools
.DESCRIPTION
    This function send a file inside a blob container in Azure without a Connection to Azure or Azure Cli/PowerShell tools
.PARAMETER BlobContainer
    Blob Container to use
.PARAMETER StorageAccountURI
    Storage Account URI
.PARAMETER StorageAccountSASKey
    SAS Token for the Storage Account
.PARAMETER LocalFilePath
    Path of the local file to send in Azure
.EXAMPLE
    sendFileToAzure -BlobContainer db -StorageAccountURI "https://XXXX" -StorageAccountSASKey "XXX" -LocalFilePath "/PathTo/DbFile"
#>
 
[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [String]
    $BlobContainer,

    [Parameter(Mandatory = $true)]
    [String]
    $StorageAccountURI,

    [Parameter(Mandatory = $true)]
    [String]
    $StorageAccountSASKey,

    [Parameter(Mandatory = $true)]
    [String]
    $LocalFilePath

)

$FileName = (get-item -Path $LocalFilePath)

$TargetUri = "$($StorageAccountURI)/$($BlobContainer)/$($FileName)$($StorageAccountSASKey)"


$headers = @{
    'x-ms-blob-type' = 'BlockBlob'
}

[Net.ServicePointManager]::SecurityProtocol =  [Net.SecurityProtocolType]::Tls12

$ProgressPreference = "SilentlyContinue"
Invoke-RestMethod -Uri $TargetUri -Method Put -Headers $headers -InFile $LocalFilePath 

}