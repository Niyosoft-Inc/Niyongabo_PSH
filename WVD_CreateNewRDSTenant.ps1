$BrokerURL = "https://rdbroker.wvd.microsoft.com"
Add-RdsAccount -DeploymentUrl $BrokerURL -Credential $Credentials
$RDSTenantName = Read-Host "Enter RDS tenant name" 
$NewRDSTenant = New-RdsTenant -Name $RDSTenantName -AadTenantId $SelectedAzureSubscription.TenantId -AzureSubscriptionId $SelectedAzureSubscription.SubscriptionId
if ($NewRDSTenant) {
    Write-Host "A new RDS tenant was created with the name $($NewRDSTenant.TenantName)" -ForegroundColor Green
}
else {
    Write-Host "The creation of a new RDS tenant was failed." -ForegroundColor Red
}
