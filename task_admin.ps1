# Script PowerShell pour automatiser certaines tâches d'administration système

# Fonction pour vérifier l'espace disque disponible
function Check-DiskSpace {
    Get-PSDrive -PSProvider FileSystem | Select-Object Name, Used, Free, @{Name="FreePercent";Expression={"{0:N2}" -f (($_.Free / $_.Used) * 100)}}
}

# Fonction pour lister les services en cours d'exécution
function List-RunningServices {
    Get-Service | Where-Object { $_.Status -eq 'Running' } | Select-Object Name, DisplayName, Status
}

# Fonction pour vérifier les mises à jour Windows disponibles
function Check-WindowsUpdates {
    $UpdateSession = New-Object -ComObject Microsoft.Update.Session
    $UpdateSearcher = $UpdateSession.CreateUpdateSearcher()
    $SearchResult = $UpdateSearcher.Search("IsInstalled=0 and Type='Software'").Updates

    $SearchResult | ForEach-Object {
        [PSCustomObject]@{
            Title = $_.Title
            Description = $_.Description
            KBArticleIDs = $_.KBArticleIDs
        }
    }
}

# Générer un rapport
function Generate-Report {
    $reportPath = "C:\AdminReport\AdminReport_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"
    $reportContent = @()

    $reportContent += "Rapport d'administration système"
    $reportContent += "==============================="
    $reportContent += ""
    $reportContent += "Espace disque disponible:"
    $reportContent += (Check-DiskSpace | Out-String)
    $reportContent += ""
    $reportContent += "Services en cours d'exécution:"
    $reportContent += (List-RunningServices | Out-String)
    $reportContent += ""
    $reportContent += "Mises à jour Windows disponibles:"
    $reportContent += (Check-WindowsUpdates | Out-String)

    $reportContent | Out-File -FilePath $reportPath
    Write-Output "Rapport généré à l'emplacement : $reportPath"
}

# Exécuter les fonctions
Generate-Report
