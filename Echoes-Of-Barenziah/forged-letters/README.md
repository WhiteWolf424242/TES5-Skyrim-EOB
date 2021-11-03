# TES5-Skyrim EOB
# Forged Letters

Merge this plugin to your master to add the letter forging functionality to EOB.<br/>
# Terminology

Currently the feature is done for the 2 letters in the google doc: https://docs.google.com/spreadsheets/d/1302UIGV7mORMXvXa5uynYFJNr5BJXtBjyRR975246eY/edit#gid=0<br/>
But it's been written so that it is easy to append with more, should the need arise.<br/>
<br/>
It turned out that these letters can get quite long, and can pass a certain character limit of object names in the game. Therefore I've split the text into two distinct text blocks: the first and second paragraphs from the doc go the first block, and the third paragraph goes to the second block.<br/>
<br/>


# How to start forging a letter
On the script where you want to start forging a letter, add EOBLetterForgingQuest as a property.<br/>
Then you can do:<br/>
```
(EOBLetterForgingQuest as EOBLetterForgingQuestScript).InitForgedLetter(int index, int senderID)
```
The first parameter, index, is the number of the letter, counted as on the google doc: Letter#1, and Letter#2 correspond to index=0 and index =1. <br/>
The senderID corresponds to the "Letter To/From:" coloums in the doc. So senderID=0 is the left coloumn, senderID=1 is the right coloumn. Summarized table:<br/>
To Volf from Olred: index=0, senderID=0<br/>
To Ulain from Olred: index=0, senderID=1<br/>
To Volf from Ulain: index=1, senderID=0<br/>
To Olred from Ulain: index=1, senderID=1<br/>
<br/>

At the steps of dictating the letter, you can call each step that appends the next paragraph in the specified tone, for the specified letter. For example, to append the first, starting paragraph to the first letter (i=0, so called L0):
```
(EOBLetterForgingQuest as EOBLetterForgingQuestScript).GenerateStartingForL0(String tone)
```
The tone parameter chooses what paragraph to add, its values are the keywords in the google doc, see full list below.<br/>
There are 2 default constructed parameters as well: index and paragraph, both integers, you don't have to set these unless you want to do some crazy mixing of the paragraphs. Leave them to default.<br/>
<br/>
The full list of paragraphs to add, and the values the tone parameter takes:
```
(EOBLetterForgingQuest as EOBLetterForgingQuestScript).GenerateStartingForL0(String tone)     ; starting paragraph for Letter0, tone: kind, rude, vague 
(EOBLetterForgingQuest as EOBLetterForgingQuestScript).GenerateStartingForL1(String tone)     ; starting paragraph for Letter1,tone: kind, rude, vague 
(EOBLetterForgingQuest as EOBLetterForgingQuestScript).GenerateParagraph1ForL0(String tone)   ; middle paragraph for Letter0, tone: love, breakup, child, death
(EOBLetterForgingQuest as EOBLetterForgingQuestScript).GenerateParagraph1ForL1(String tone)   ; middle paragraph for Letter1,tone: love, breakup, child, death
(EOBLetterForgingQuest as EOBLetterForgingQuestScript).GenerateEndingForL0(String tone)       ; end paragraph for Letter0, tone: cruel, kind, loving
(EOBLetterForgingQuest as EOBLetterForgingQuestScript).GenerateEndingForL1(String tone)       ; end paragraph for Letter1, tone: cruel, kind, loving
```

To add the letter to the player:
```
(EOBLetterForgingQuest as EOBLetterForgingQuestScript).AddLetterToPlayer(int index)
```
Adds the ith letter to the player. You can add the letter at any point during the dictation, but only after having initialized the letter with InitForgedLetter.


# A full example
Let's say you want to make the leftmost variant in the doc, so Letter#1, To Volf from Olred, with f.e. the tones of RUDE for paragraph1, BREAK-UP for paragraph2, and CRUEL for paragraph3.<br/>
Then in the dialogue fragment where you select that you want to write To Volf from Olred, you do:
```
(EOBLetterForgingQuest as EOBLetterForgingQuestScript).InitForgedLetter(0, 0)
```
For this of course you add the EOBLetterForgingQuest as a Property to the dialogue fragment script. Then in each dialogue fragment where you dictate your options:
```
; first dialogue fragment:
(EOBLetterForgingQuest as EOBLetterForgingQuestScript).GenerateStartingForL0("rude")
; second dialogue fragment:   
(EOBLetterForgingQuest as EOBLetterForgingQuestScript).GenerateParagraph1ForL0("breakup") 
; third and final dialogue fragment:
EOBLetterForgingQuestScript forge = EOBLetterForgingQuest as EOBLetterForgingQuestScript
forge.GenerateEndingForL0("cruel")  
forge.AddLetterToPlayer(0)   
```



# IMPORTANT, DON'T FORGET: Maintenance!!
When putting text together like this, maintenance is required when the player loads a saved game. As a part of EOB's general OnPlayerLoadSavedGame event, it must call:
```
(EOBLetterForgingQuest as EOBLetterForgingQuestScript).MaintenanceForTexts()
```

# Comments
The EOBLetterForgingQuest contains several stages and quest fragments on them, those were only used for testing and should not be included in the final release.

# Requirements:
These scripts require SKSE. If you're getting strange compilation errors, it means your SKSE source installation may not be correct. Check out the pinned info about this on the discord or contact me for help.
  
