;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname QF_EOBLetterForgingQuest_02000D61 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Letter0MainTextParagraph1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter0MainTextParagraph1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter1MainTextParagraph1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter1MainTextParagraph1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LetterAlias1WithTitle0
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LetterAlias1WithTitle0 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LetterAlias1WithTitle1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LetterAlias1WithTitle1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter1MainTextParagraph0
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter1MainTextParagraph0 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LetterAlias0WithTitle0
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LetterAlias0WithTitle0 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LetterAlias0WithTitle1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LetterAlias0WithTitle1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter0MainTextParagraph0
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter0MainTextParagraph0 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE EOBLetterForgingQuestScript
Quest __temp = self as Quest
EOBLetterForgingQuestScript kmyQuest = __temp as EOBLetterForgingQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GenerateEndingForL0("kind")
kmyQuest.GenerateEndingForL1("cruel")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE EOBLetterForgingQuestScript
Quest __temp = self as Quest
EOBLetterForgingQuestScript kmyQuest = __temp as EOBLetterForgingQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GenerateParagraph1ForL0("love")
kmyQuest.GenerateParagraph1ForL1("breakup")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE EOBLetterForgingQuestScript
Quest __temp = self as Quest
EOBLetterForgingQuestScript kmyQuest = __temp as EOBLetterForgingQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MaintenanceForTexts()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE EOBLetterForgingQuestScript
Quest __temp = self as Quest
EOBLetterForgingQuestScript kmyQuest = __temp as EOBLetterForgingQuestScript
;END AUTOCAST
;BEGIN CODE
; these stages were used for testing and should not be included into the final release.

kmyQuest.InitForgedLetter(0,0)
kmyQuest.InitForgedLetter(1,1)

kmyQuest.AddLetterToPlayer(0)
kmyQuest.AddletterToPlayer(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE EOBLetterForgingQuestScript
Quest __temp = self as Quest
EOBLetterForgingQuestScript kmyQuest = __temp as EOBLetterForgingQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.GenerateStartingForL0("kind")
kmyQuest.GenerateStartingForL1("rude")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
