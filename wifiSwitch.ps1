#get-netadapter | Where-Object -Property NdisPhysicalMedium -EQ 9 | select ifIndex, ifName, ifAlias, ifOperStatus
$operStatus=$(get-netadapter | Where-Object -Property NdisPhysicalMedium -EQ 9 | select ifOperStatus).ifOperStatus
Write-Output "operStatus = [$operStatus]"
$commandName=""
$commandParams = "-InputObject $(get-netadapter | Where-Object -Property NdisPhysicalMedium -EQ 9) -confirm:$false"
if ( $operStatus -eq "Down" )
{
    Write-Output "Turning on"
    #$commandName="enable-netadapter"
    enable-netadapter -InputObject $(get-netadapter | Where-Object -Property NdisPhysicalMedium -EQ 9) -confirm:$false
}
else
{
     Write-Output "Turning off"
     #$commandName="disable-netadapter"
    disable-netadapter -InputObject $(get-netadapter | Where-Object -Property NdisPhysicalMedium -EQ 9) -confirm:$false
}

#Invoke-Expression $($comandName+$commandParams)