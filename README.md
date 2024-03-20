## About
This script collects the opponent's player ID at the beginning of a Gods Unchained match and outputs a link to the corresponding player profile in the GU Decks website with the purpose of finding the decklist they queued with.

## Context
In the current state of the Gods Unchained matching system for Constructed modes (Casual and Ranked) it is possible for players to obscure their names, if they wish. This is commonly done by either using question marks - ??? or non-standard characters that either are uncommon to find in most keyboards or straight up get displayed as squares or other unreadable characters.

This results in a situation where players using simple English names are at a disadvantage compared to players who obscure their names, because a easily typable name name can be quickly searched for in https://gudecks.com/ and reveal the player's list of recently played decks, which most of the time immediately points to the exact deck the opponent is queuing with.

## Solutions
Despite repeated and insistent request by the community to work on a fix for this problem, no solution to prevent deck sniping has been implemented so far.

Considering this situation, community member Birdgineer developed and made freely available the tool [GUvrs](https://github.com/TimothyMeadows/GUvrs) that scans the game's log file and extracts the opponent's game ID, independently of any name obscuring tactics. This way anyone can have access to the same information if they wish, giving the same advantage to both players, whether they hide their player name or not. The tool works for Windows and Mac and could probably also work in Linux, with .NET Core or possibly an emulator (not tested).

I play Gods Unchained on Ubuntu sometimes and I decided to write a simple Bash script to pickup the opponent's ID, similar to Guvrs, only much simpler and barebones.

## Setup and usage

The script is a standard bash file that runs from the terminal (remember to enable execution permissions).

First edit the script to point to the debug file in your computer. In my case the file is being stored at

`/home/<username>/.steam/steam/steamapps/compatdata/<bunchofnumbers>/pfx/drive_c/users/steamuser/AppData/LocalLow/Immutable/gods/debug.log`

After updating the log file's location, simply open a terminal window in the same directory where you saved the file and launch it by typing

`./get_oppo_profile_link.sh`

after which the script will start monitoring the debug.log file and print out an URL to your opponent's GU Decks profile page as soon as the necessary information is saved to the log file.

![Script output after a match has started](https://i.imgur.com/WsWUhlu.png)

## Porting to Windows

If you wish to try this script in Windows, you could try asking an AI tool to convert the code to Windows batch scripting, although I haven't tried it and I don't know how good the conversion will be.
