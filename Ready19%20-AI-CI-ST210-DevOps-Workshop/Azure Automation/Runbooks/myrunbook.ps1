# workflow offonvms
# {
        Param(
        [Parameter(Mandatory=$true)]
        [String]
        $ResourceGroupName,
        [Parameter(Mandatory=$true)]
        [Boolean]
        $Shutdown
        )
     
    $connectionName = "AzureRunAsConnection";
 
    try
    {
        # Get the connection "AzureRunAsConnection "
        $servicePrincipalConnection=Get-AutomationConnection -Name $connectionName        
 
        "Logging in to Azure..."
        Add-AzureRmAccount `
            -ServicePrincipal `
            -TenantId $servicePrincipalConnection.TenantId `
            -ApplicationId $servicePrincipalConnection.ApplicationId `
            -CertificateThumbprint $servicePrincipalConnection.CertificateThumbprint 
    }
    catch {
 
        if (!$servicePrincipalConnection)
        {
            $ErrorMessage = "Connection $connectionName not found."
            throw $ErrorMessage
        } else{
            Write-Error -Message $_.Exception
            throw $_.Exception
        }
    }
         
     
    $vms = Get-Azurermvm -ResourceGroupName $ResourceGroupName
     
    Foreach ($vm in $vms){
    # Foreach -Parallel ($vm in $vms){
        
        if($Shutdown){
            Write-Output "Stopping $($vm.Name)";        
            Stop-AzureRmVm -Name $vm.Name -ResourceGroupName $vm.ResourceGroupName -Force;
        }
        else{
            Write-Output "Starting $($vm.Name)";        
            Start-AzureRmVm -Name $vm.Name -ResourceGroupName $vm.ResourceGroupName;
        }
    }
# }