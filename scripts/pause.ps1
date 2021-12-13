param (
    [string]$EmbeddedName
)


Connect-AzAccount -Identity 

$CapacityTest = Test-AzPowerBIEmbeddedCapacity -Name $EmbeddedName

if ($CapacityTest)
{
    $CapacityState = Get-AzPowerBIEmbeddedCapacity -Name $EmbeddedName

    if($CapacityState.State -eq "Paused")
    {
        Write-Host "Capacity $EmbeddedName already paused."
    }
    else
    {
        Suspend-AzPowerBIEmbeddedCapacity -Name $EmbeddedName -PassThru
        Write-Host "Capacity $EmbeddedName paused."
    }
}
else
{
        Write-Host "Capacity $EmbeddedName does not exist."
}

Write-Host "Exit..."
