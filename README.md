# wsDeckBackup
Backup decks to raw text files from WS Simulator

## DISCLAIMERS
- This file does not make any changes to your registry, but it does pull data from it! Please be careful when handling anything with your registry!
- Any errors that occur will likely be due to special characters existing in your deck name. Try renaming the deck and try again
- Text files will be generated in the same directory as this script

## Usage
1. Download the ```deckExport.ps1``` file
2. *(Optional)* Move script into folder (all deck files will be created in the same folder as the script)
3. Run the script (see FAQ for more information)
4. Script will create individual text files that will be in the correct format to copy and paste directly into the simulator!

## FAQ
### I get an error saying the script cannot be loaded!
If you get an error about scripts not being allowed/enabled, you will need to run the following command first:

```Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process```

This will allow you to run scripts until you close PowerShell.
### USE CAUTION WHEN BEING TOLD TO USE THIS COMMAND! ONLY USE IT IF YOU KNOW THE SCRIPT IS SAFE!
