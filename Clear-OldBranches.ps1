# Clear Old Branches - PowerShell Version
# This script removes local branches that have been deleted from the remote

Write-Host "🧹 Clearing old branches..." -ForegroundColor Green

try {
    Write-Host "Switching to main branch..." -ForegroundColor Yellow
    git checkout main

    Write-Host "Updating remote references and pruning..." -ForegroundColor Yellow
    git remote update origin --prune

    Write-Host "Finding branches to delete..." -ForegroundColor Yellow
    $branchesToDelete = git branch -vv | Select-String -Pattern ": gone]" | ForEach-Object { $_.ToString().Trim().Split(" ")[0] }

    if ($branchesToDelete.Count -eq 0) {
        Write-Host "✅ No old branches found to delete." -ForegroundColor Green
    } else {
        Write-Host "🗑️  Deleting the following branches:" -ForegroundColor Red
        $branchesToDelete | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
        
        $branchesToDelete | ForEach-Object { 
            git branch -D $_ 
        }
        Write-Host "✅ Old branches cleared successfully!" -ForegroundColor Green
    }
} catch {
    Write-Host "❌ Error occurred: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
