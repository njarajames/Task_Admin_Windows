"# Task_Admin_Windows" 
# Script PowerShell d'Administration Système

Ce script PowerShell est conçu pour automatiser certaines tâches courantes d'administration système. Il effectue les opérations suivantes :

1. Vérifie l'espace disque disponible sur tous les disques.
2. Liste les services en cours d'exécution.
3. Vérifie les mises à jour Windows disponibles.
4. Génère un rapport de ces informations dans un fichier texte.

## Prérequis

- PowerShell 5.1 ou supérieur.
- Droits d'administrateur pour exécuter certaines commandes.

## Installation

1. Téléchargez le script PowerShell `AdminReport.ps1`.
2. Assurez-vous que le chemin de sortie du rapport (`C:\AdminReport\`) existe ou modifiez-le selon vos besoins.

## Utilisation

1. Ouvrez PowerShell en tant qu'administrateur.
2. Exécutez le script en utilisant la commande suivante :

    ```powershell
    .\AdminReport.ps1
    ```

3. Le script générera un fichier de rapport texte à l'emplacement spécifié (par défaut `C:\AdminReport\AdminReport_YYYYMMDD_HHMMSS.txt`).

## Fonctions

### Check-DiskSpace

Cette fonction utilise `Get-PSDrive` pour obtenir des informations sur les disques et calcule le pourcentage d'espace libre.

### List-RunningServices

Cette fonction utilise `Get-Service` pour lister tous les services en cours d'exécution.

### Check-WindowsUpdates

Cette fonction utilise l'API COM de Windows Update pour rechercher les mises à jour disponibles.

### Generate-Report

Cette fonction génère un rapport texte avec les informations collectées par les fonctions précédentes et le sauvegarde dans un fichier texte.

## Exemple de Sortie

Le fichier de rapport généré contiendra des informations similaires à celles-ci :


