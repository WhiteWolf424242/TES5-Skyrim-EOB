Scriptname EOBDynamicBookScript extends ObjectReference  
{Script for the dynamic book to be able to display its text.}

String Property akString  Auto
{String that is displayed in this dynamic book. THIS SHOULD NOT BE SET MANUTALLY.}
Actor Property DummyObject  Auto
{Dummy actor whose name is actually being displayed. Reference should be in some junkyard worldspace.}
ReferenceAlias Property DynamicBook  Auto 
{Alias on the manager quest for the book.}

Event OnRead()
	; Failsafes
	If(DummyObject.GetBaseObject().GetName() != akString || DynamicBook.GetReference() != self)
		UpdateBookTextMenuMode()
	Endif
EndEvent

function UpdateBookTextMenuMode()
	UpdateBookText()
	
	; menu mode must force text to update manually:
	Input.TapKey(1) ;esc, close book menu
	Utility.WaitMenuMode(0.05)
	Self.Activate(Game.GetPlayer()) ;re-open book menu
endfunction


function UpdateBookText()
	If(DynamicBook.GetReference() != self)
		DynamicBook.ForceRefTo(Self) ;force the book alias to this book objectreference so it can display the akString
	endif
	DummyObject.GetBaseObject().SetName(akString)
endfunction
