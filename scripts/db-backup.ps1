# ============================================================
# Chandusoft – Database Backup and Restore to Test DB
# Works with MySQL 8.4.3 (Laragon) / PowerShell-safe
# ============================================================

# --- CONFIG ---
$DBHost = "localhost"
$DBName = "chandusoft"
$DBUser = "root"
$DBPass = ""          # Leave empty if no password
$TestDBName = "chandusoft_test"

# --- PATH SETUP ---
$BackupDir = Join-Path (Split-Path $PSScriptRoot -Parent) "storage\backups"
$Timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
$FileName  = "db-$Timestamp.sql"
$FullPath  = Join-Path $BackupDir $FileName

# --- CREATE BACKUP DIRECTORY ---
if (!(Test-Path $BackupDir)) {
    New-Item -ItemType Directory -Path $BackupDir | Out-Null
}

Write-Host "Backing up database '$DBName' to $FullPath ..."

# --- BACKUP (uses --result-file, avoids redirection) ---
if ($DBPass -ne "") {
    & mysqldump -h $DBHost -u $DBUser -p$DBPass $DBName --result-file="$FullPath"
} else {
    & mysqldump -h $DBHost -u $DBUser $DBName --result-file="$FullPath"
}

# --- VERIFY BACKUP ---
if ((Test-Path $FullPath) -and ((Get-Item $FullPath).Length -gt 0)) {
    Write-Host "Backup completed successfully."
    Write-Host "File saved to: $FullPath"
} else {
    Write-Host "Backup failed or file is empty!"
    exit
}

# --- RESTORE TO TEST DATABASE ---
Write-Host ""
Write-Host "Restoring into test database '$TestDBName' ..."

$DropCreateSQL = "DROP DATABASE IF EXISTS $TestDBName; CREATE DATABASE $TestDBName;"

if ($DBPass -ne "") {
    & mysql -h $DBHost -u $DBUser -p$DBPass -e "$DropCreateSQL"
    & mysql -h $DBHost -u $DBUser -p$DBPass $TestDBName -e "SOURCE $FullPath"
} else {
    & mysql -h $DBHost -u $DBUser -e "$DropCreateSQL"
    & mysql -h $DBHost -u $DBUser $TestDBName -e "SOURCE $FullPath"
}

Write-Host "Test database '$TestDBName' restored successfully."

# --- VERIFY ROW COUNTS ---
Write-Host ""
Write-Host "Verifying restored tables..."

# Adjust table names to your actual schema
if ($DBPass -ne "") {
    & mysql -h $DBHost -u $DBUser -p$DBPass -D $TestDBName -e "SELECT 'catalog count:' AS info, COUNT(*) FROM catalog; SELECT 'orders count:' AS info, COUNT(*) FROM orders;"
} else {
    & mysql -h $DBHost -u $DBUser -D $TestDBName -e "SELECT 'catalog count:' AS info, COUNT(*) FROM catalog; SELECT 'orders count:' AS info, COUNT(*) FROM orders;"
}

Write-Host ""
Write-Host "Done. Backup and restore completed successfully."
