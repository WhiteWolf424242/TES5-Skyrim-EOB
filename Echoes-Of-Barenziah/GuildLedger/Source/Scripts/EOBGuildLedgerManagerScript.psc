Scriptname EOBGuildLedgerManagerScript extends Quest  
{Manager script for the Guild Ledger Book of Echoes of Barenziah. DO NOT MODIFY THIS SCRIPT UNLESS YOU KNOW WHAT YOU ARE DOING.}

ObjectReference Property LedgerBookReference  Auto
{Set this to the reference of the Ledger Book placed in the world.}


function AppendBookCustomString(String akString)
	EOBDynamicBookScript BookScript = LedgerBookReference as EOBDynamicBookScript
	BookScript.akString += akString
	BookScript.UpdateBookText()
endfunction

function AppendBook(String itemName, String worth, Actor thief = NONE, String date = "DefaultTime")
	EOBDynamicBookScript BookScript = LedgerBookReference as EOBDynamicBookScript
	
	String thiefString = ""
	if(thief == NONE)
		thiefString = Game.GetPlayer().GetBaseObject().GetName()
	else
		thiefString = thief.GetBaseObject().GetName()
	endif
	String dateString = date
	if(dateString == "DefaultTime")
		dateString = Utility.GameTimeToString(Utility.GetCurrentGameTime())
	endif
	String akString = "\n"+itemName + "\nStolen by "+thiefString+" on "+dateString+"\nEstimated worth: "+worth+"\n"
	
	
	BookScript.akString += akString
	BookScript.UpdateBookText()
endfunction



function ResetBook()
	EOBDynamicBookScript BookScript = LedgerBookReference as EOBDynamicBookScript
	BookScript.akString = ""
	BookScript.UpdateBookText()
endfunction

String function GetBookString()
	return (LedgerBookReference as EOBDynamicBookScript).akString
endfunction



