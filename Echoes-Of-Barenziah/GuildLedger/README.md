# TES5-Skyrim EOB
# Guild Ledger Functionality

Merge this plugin to your master to add it.<br/>
SETUP BEFORE GETTING STARTED:<br/>
The book reference must be placed into context in your plugin. It is currently located in the EOBJunkyard worldspace, called the EOBGuildLedgerDynamicBook reference.<br/>
Move that to where you want the book to be located in the game.<br/>
Make sure that the LedgerBookReference is correctly set to this reference on the EOBGuildLedgerManagaerScript script of the EOBGuildLedgerManagerQuest quest.

Do not touch the EOBLedgerDummyObject unless you know what you are doing.

# Functions on EOBGuildLedgerManagerScript

function AppendBook(String itemName, String worth, Actor thief = NONE, String date = "DefaultTime")<br/>
Appends a formatted string to the end of the book.<br/>
String itemName: The name of the item to be added to the new record.<br/>
String worth: the worth of the item. Will be displayed as: "Estimated worth: <worth>"<br/>
Actor thief: the Actor who's name gets credited. Not specifying will use the Player's name.<br/>
String date: The date of the record. Not specifying will get the current game time.<br/>

function AppendBookCustomString(String akString)<br/>
Appends a custom string to the end of the book.<br/>
String akString: the string to append.<br/>

function ResetBook()<br/>
Resets the book text to be "".

String function GetBookString()<br/>
Shortcut to get the string that's currently stored by the book.


# How to Use:
Add EOBGuildLedgerManagerQuest as a property to your script. Cast it as EOBGuildLedgerManagaerScript to use the functions.

# Requirements:
These scripts require SKSE. If you're getting strange compilation errors, it means your SKSE source installation may not be correct. Check out the pinned info about this on the discord or contact me for help.
  
