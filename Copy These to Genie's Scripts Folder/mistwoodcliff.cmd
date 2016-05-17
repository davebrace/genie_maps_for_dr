#debug 10
#---------------------------------------
# INCLUDES
#---------------------------------------
goto SubSkip
#---------------------------------------
# Local Subroutines
#---------------------------------------

SubSkip:

#---------------------------------------
# CONSTANT VARIABLES
#---------------------------------------

#---------------------------------------
# VARIABLES
#---------------------------------------

#---------------------------------------
# ACTIONS
#---------------------------------------
	action var Dir $1 when ^Peering closely at a faint path, you realize you would need to head (\w+)\.
#---------------------------------------
# SCRIPT START
#---------------------------------------
	put peer path
	waitforre Peering closely at
	put down
	put %Dir
	put nw
	waitforre ^Birds chitter in the branches
	pause
	put #parse MOVE SUCCESSFUL
	