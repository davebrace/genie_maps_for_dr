### This script is an automap plugin fix for the stat trainer rooms in Crossing.
### These rooms do not have the full xml feed that other rooms do,
### so the room variables do not populate and the automapper
### thinks it is still in the room you entered from.
### This script is called for all arcs in the connecting room to the trainer,
### since that is where the variables are populated from.
### If a movement error is detected then the script assumes you are
### inside the training room, and moves you into the room the
### variables are populated from before moving you along the
### rest of the auto-mapped path.

if contains("$roomdesc","This room, dark and crowded with iron") then goto Strength

Trainer:
	action var trainer 0 when ^Obvious paths:|^Obvious exits:
	action var trainer 1 when ^You can't go there\.|^What were you referring to\?
	
	send %0
	waitforre ^You can't|^What were|^Obvious paths:|^Obvious exits:
	if "%trainer" = "1" then
	{
		send out
		pause 0.1
		send %0
	}
	send #parse MOVE SUCCESSFUL
	exit
	
Strength:
	action var trainer 0 when Tembeg's Armory, Salesroom|Town Green Northwest
	action var trainer 1 when Tembeg's Armory, Workroom
	
	send %0
	waitforre Tembeg's Armory, Workroom|Tembeg's Armory, Salesroom|Town Green Northwest
	if "%trainer" = "1" then
	{
		send out
		pause 0.1
		send %0
	}
	pause
	send look
	send #parse MOVE SUCCESSFUL
	exit