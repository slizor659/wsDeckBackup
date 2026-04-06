# WS Deck Exporter v1
# Written by racketyphilly5k (slizor659 on GitHub)
# Find repo at https://github.com/slizor659/wsDeckBackup

# Define path
$regKey = 'HKCU:\Software\Blake Thoennes\Weiss Schwarz'

# Pull decks
$decks = Get-Item -Path $regKey | Select-Object -ExpandProperty Property | Where-Object { $_ -like 'Deck_*' }

# Iterate through each deck
foreach  ($deck in $decks) {
    $deckBin = Get-ItemPropertyValue -Path $regKey -Name $deck
    try {
        # Convert binary data into readable UTF-8 string
        $deckString = [System.Text.Encoding]::UTF8.GetString($deckBin)
    }
    catch {
        # Will add deck name to list of failed decks and continue to next loop
        Write-Host 'Failed to export' $deck -ForegroundColor 'Red'
        $failed += $deck
        continue
    }
    # Split deck list into array and sanitize name
    $cardArray = $deckString.split('|')
    $deck = $deck -Replace 'Deck_', ''
    $deck = $deck -Replace '[<>:"/\\|?*]', '_'

    # Export deck to text file in root directory and log to console
    $backupPath = $deck + '.txt'
    $cardArray | Set-Content -Path $backupPath
    Write-Host 'Exported' $deck
}
# Handles error messages at end to prevent users from having to scroll through logs to find failed decks
if ($failed.Count -eq 0) {
    Write-Host 'Export completed with no errors!' -ForegroundColor 'Green'
}
else {
    Write-Host 'Export completed with some errors.'
    Write-Host 'Failed decks:'
    Write-Host $failed -ForegroundColor 'Red'
}