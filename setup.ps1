$lowercaseName          = Read-Host "Enter your name (lowercase and no separations)"
$lowercasePackageName   = Read-Host "Enter your package name (lowercase and no separations)"
$displayName            = Read-Host "Enter your full name (for display)"
$displayPackageName     = Read-Host "Enter full package name (for display)"
$namespaceName          = $displayPackageName -replace '\s', ''
$targetDir              = "com.yourname.packagename"
$year                   = (Get-Date).Year

# --- Rename placeholders in files ---
Get-ChildItem -Path $targetDir -Recurse -File | Sort-Object FullName -Descending | ForEach-Object {
    $updated = (Get-Content $_.FullName -Raw) `
        -replace 'yourname', $lowercaseName `
        -replace 'packagename', $lowercasePackageName `
        -replace 'Your Name', $displayName `
        -replace 'My Package', $displayPackageName `
        -replace 'PackageSpace', $namespaceName `
        -replace 'YYYY', $year
    Set-Content $_.FullName $updated
}

# --- Rename files and directories ---
Get-ChildItem -Path $targetDir -Recurse -Depth 10 | Sort-Object FullName -Descending | ForEach-Object {
    $newName = $_.Name `
        -replace 'yourname', $lowercaseName `
        -replace 'packagename', $lowercasePackageName
    if ($newName -ne $_.Name) {
        Rename-Item $_.FullName -NewName $newName
    }
}

# --- Rename the top-level package folder itself ---
$parentDir = Split-Path -Parent (Resolve-Path $targetDir)
$folderName = Split-Path $targetDir -Leaf
$newFolderName = $folderName `
    -replace 'yourname', $lowercaseName `
    -replace 'packagename', $lowercasePackageName

if ($newFolderName -ne $folderName) {
    $newPath = Join-Path $parentDir $newFolderName
    Rename-Item -Path $targetDir -NewName $newFolderName
    $targetDir = $newPath
}

Write-Host "Renamed package from '$folderName' to '$newFolderName'"
Write-Host "Setup complete. Deleting redundant setup.ps1..."


# --- Deleting setup file ---
$scriptPath = $MyInvocation.MyCommand.Path

# Start a new PowerShell process that deletes this script after a short delay
Start-Process powershell -ArgumentList "-NoProfile -WindowStyle Hidden -Command `"
  Start-Sleep 1; Remove-Item -Path '$scriptPath' -Force
`""

Write-Host "Goodbye!"
