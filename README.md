# demo-hacktoberfest2020
Demo repository for Hacktoberfest 2020

## DESCRIPTION
    This function send a file inside a blob container in Azure without a Connection to Azure or Azure Cli/PowerShell tools
## PARAMETER BlobContainer
    Blob Container to use
## PARAMETER StorageAccountURI
    Storage Account URI
## PARAMETER StorageAccountSASKey
    SAS Token for the Storage Account
## PARAMETER LocalFilePath
    Path of the local file to send in Azure
## EXAMPLE
    sendFileToAzure -BlobContainer db -StorageAccountURI "https://XXXX" -StorageAccountSASKey "XXX" -LocalFilePath "/PathTo/DbFile"