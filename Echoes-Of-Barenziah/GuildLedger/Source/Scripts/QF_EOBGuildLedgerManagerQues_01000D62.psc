;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_EOBGuildLedgerManagerQues_01000D62 Extends Quest Hidden

;BEGIN ALIAS PROPERTY dummyObject
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_dummyObject Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DynamicBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DynamicBook Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE EOBGuildLedgerManagerScript
Quest __temp = self as Quest
EOBGuildLedgerManagerScript kmyQuest = __temp as EOBGuildLedgerManagerScript
;END AUTOCAST
;BEGIN CODE
; This is a fragment that was used for testing and should not be used in the final relese.

kmyQuest.AppendBook("Left Eye of the Falmer", "3000 septims")
kmyQuest.AppendBook("East Empire Shipping Map", "540 septims")
kmyQuest.AppendBook("A tasty sweetroll", "invalueable")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
