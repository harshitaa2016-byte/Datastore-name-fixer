# Connect to vCenter
$vcenter = "vCenter-name"
Connect-VIServer -Server $vcenter

$site = "siteID1,sitID2"  # your single site code, lowercase

Write-Host "Looking for hosts starting with '$site'..."

# Get all hosts once
$hosts = Get-VMHost | Where-Object { $_.Name.ToLower().StartsWith($site) }

if ($hosts.Count -eq 0) {
    Write-Host "No hosts found for site $site"
    Disconnect-VIServer -Confirm:$false
    exit
}

Write-Host "Found $($hosts.Count) hosts."

foreach ($esxHost in $hosts) {
    Write-Host "Processing host: $($esxHost.Name)"

    # Get datastores attached to this host
    $datastores = Get-Datastore -RelatedObject $esxHost

    foreach ($ds in $datastores) {
        $oldName = $ds.Name

        # Skip if already contains '-xr-srv001'
        if ($oldName -like "*-xr-srv001*") {
            Write-Host "Already has '-xr-srv001': '$oldName'. Skipping."
            continue
        }

        # Insert '-xr-srv001-' after the site code, e.g.
        # xyz-DO-NOT-USE-1 -> xyz-xr-srv001-DO-NOT-USE-1
        $newName = $oldName -replace "^(prpdx\d{5}[a-z])-(.*)$", '$1-xr-srv001-$2'

        Write-Host "Would rename datastore: '$oldName' -> '$newName'"

        # Uncomment below line to actually rename datastore
        # Set-Datastore -Datastore $ds -Name $newName -Confirm:$false
    }
}

Disconnect-VIServer -Confirm:$false

