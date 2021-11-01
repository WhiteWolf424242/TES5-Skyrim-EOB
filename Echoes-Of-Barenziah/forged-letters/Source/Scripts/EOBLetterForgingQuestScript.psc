Scriptname EOBLetterForgingQuestScript extends Quest  


Quest Property EOBLetterForgingQuest  Auto
ObjectReference[] Property ForgedLetterRefs  Auto
{Fill these to the letter references you want to send to the player. Fill in the CK if the letters exist in the world already, or fill with scripts if only spawn the letter refs later. Indexed by i, where i is the index of letters starting from 0.}
ObjectReference[] Property TextBlockObjects  Auto
{Fill these to the dummy object references in the world, that will hold the text blocks of the books. Indexed by iXj, where i is the index of the letter, and j is the block. Two blocks for each letter. : 2*i+j}

String[] MainStrings
; Indexed by iXk, where k is the paragraph. 3 paragraphs, accoring to the google doc: 3*i+k
int[] senders
; indexed by i



Event OnInit()
	MainStrings = new String[6]  ; 2 letter, 3 paragraph
	senders = new int[2]
EndEvent


;;;;;;;;; -------------------- FUNCTIONS YOU WILL USE FROM OTHER SCRIPTS:


function InitForgedLetter(int index, int senderID)
	if(index >= ForgedLetterRefs.Length)
		Debug.Trace("EOB: Error in InitForgedLetter: index out of bounds.")
		return
	endif
	ForgedLetterRefs[index].Enable()
	; init all 3 paragraphs:
	MainStrings[index * 3] = ""
	MainStrings[index * 3 + 1] = ""
	MainStrings[index * 3 + 2] = ""
	senders[index] = senderID
	
	FillOwningAlias(index)
endfunction


function AddLetterToPlayer(int index)
	Game.GetPlayer().AddItem(ForgedLetterRefs[index], 1, true)
endfunction


function MaintenanceForTexts()
	int i = 0
	while(i < ForgedLetterRefs.Length)
		UpdateLetterText(i)
		i += 1
	endwhile
endfunction


;;; ----- TEXT GENERATION: This is where you set up the parts of the text to be generated, currently copied in from https://docs.google.com/spreadsheets/d/1302UIGV7mORMXvXa5uynYFJNr5BJXtBjyRR975246eY/edit#gid=0

; ---- Text for Letter0 (L0):

function GenerateStartingForL0(String tone, int index = 0, int paragraph = 0)
	; tone: kind, rude, vague 
	int sender = senders[0]  ;  0: To Volf from Olred, 1: To Ulain from Olred
	if(sender == 0)
		if(tone == "kind")
			MainStrings[index * 3 + paragraph] = "My dearest brother, I have missed you so. I hope you are not cross with me for being silent for so long. There is so much I want to tell you!\n"
		elseif(tone == "rude")
			MainStrings[index * 3 + paragraph] = "I shudder to think your blood flows in my veins. If you were really my brother you would fight beside me, not cower on your boat like the milk drinker you are. You think I'm a fool for fighting for Skyrim? I think you're an embarrassment to our ancestors. Even with all I've done, and who I've done it with, they have to be a hundred times prouder of me than they are of you!\n"
		else
			MainStrings[index * 3 + paragraph] = "Well brother, it has been some time has it not? Does time drag on your when you are out on the water the way it drags at me in this war? Or do your good winds sweep all that away before you? I do not know whether to wish for that for you, or be jealous in case it's true! Something tells me that you suffer the weight of passing time the same as I do, though. More's the pity for us both, no?\n"
		endif
	else
		if(tone == "kind")
			MainStrings[index * 3 + paragraph] = "My dearest beloved, I have missed you so. I hope you are not cross with me for being silent for so long. Know that my heart has not been as unfaithful as my quill!\n"
		elseif(tone == "rude")
			MainStrings[index * 3 + paragraph] = "You Dark Elf slag, did you think I wouldn't find out? Did you think I wouldn't already know? Everybody knows what your kind is like. Of course you were going to bed other men the minute I turned my back. Please, do me the favor of not thinking me a fool as well as a cuckold.\n"
		else
			MainStrings[index * 3 + paragraph] = "Does a longer life make it easier to endure unpleasant times? Or have your stores of patience all been used up already, so that now you have none left and hate this time apart even more than I do? All I know is that I tire of this war and of this absence.\n"
		endif
	endif
	UpdateLetterText(index)
endfunction




function GenerateParagraph1ForL0(String tone, int index = 0, int paragraph = 1)
	; tone: love, breakup, child, death
	int sender = senders[0] ; 0: To Volf from Olred, 1: To Ulain from Olred
	if(sender == 0)
		if(tone == "love")
			MainStrings[index * 3 + paragraph] = "Brother, am I a coward for saying this in a letter? A true Nord would tell you to your face, no? Well, perhaps I am less of a true Nord than I like to think myself, because I cannot but be glad to have the excuse of this war to force me to write the truth instead of speak it. I have fallen in love, my brother. He is a remarkable man. I like to think you would like him too - but perhaps that is wishful thinking? Perhaps not. You were always the most cosmopolitan of all of us. Maybe that is why I write you before any of the others. You have friends and crew that are not Nords. Will you then begrudge me a Dunmer lover? Gods, I hope not. I hope that you do not think less of me for loving him, because he is the greatest thing that has ever happened to me. I cannot keep his name from you any longer: Ulain. My beloved Ulain.\n"
		elseif(tone == "breakup")
			MainStrings[index * 3 + paragraph] = "Brother, you were always the wisest and most worldly of all of us. That is why I hope you will understand my pain instead of judging me for my folly. I fell in love, Volf. He was the most remarkable man! You would have liked him, I think - but alas, it was not to last. Maybe you would have counseled me to shielf my heart if I had come to you sooner, but I was afraid. I did not want to tell you I was in love with a Dunmer. Do you despise me now, brother? I fear the others would. But I must lift this burden from my heart, and I cannot tell my fellow Stormcloaks. Pity me, Volf, for I loved a man who left me. He said he could not bear to be by my side while I served Ulfric, said that as long as I was fighting to expel his kin from my homeland I was fighting him - but that is not why we fight! Not all of us. I just want to protect my home from the Empire and the High Elves. I knew the war might kill me, but I never thought it might cost me my beloved! Please, brother, tell me some wisdom. Tell me something to make the hurt less?\n"
		elseif(tone == "child")
			MainStrings[index * 3 + paragraph] = "Brother, am I a coward for saying this in a letter? A true Nord would tell you to your face, no? Well, perhaps I am less of a true Nord than I like to think myself, because I cannot but be glad to have the excuse of this war to force me to write the truth instead of speak it. I have a family, Volf. A lover and a son. Can you imagine? Me, a father! And yet I fear telling the truth to our family. You are the only one I think might understand. You have a crew you care about that is made of more than Nords. Perhaps you can accept a Dunmer husband and son for your brother, too? Yes, that is what I feared to tell you. I love a Dark Elf, and we have adopted one of his distant orphaned kin. I am still a true Son of Skyrim, but I am a father of a Dunmer too. I pray to Talos that you can still call me 'brother' now that you at long last know the truth of my heart. I pray that someday you will meet them, and find you can love them too.\n"
		else
			; n/a
		endif
	else
		if(tone == "love")
			MainStrings[index * 3 + paragraph] = "Oh Ulain my dearest, is it foolish of me to write these things to you? I would much rather say them to your face, see your ruby eyes glow warm and bright when I speak the words aloud. But we have been apart so long and I can no longer bear the delay. If I must tell you with my pen instead of my lips, so be it! At least you will be told: I love you, Ulain, heart and soul and body, for today and always. I shall carry my love for you in my heart for as long as I live, and to Sovengard beyong that. I love you, Ulain. I shall always love you.\n"
		elseif(tone == "breakup")
			MainStrings[index * 3 + paragraph] = "Regrettably, this shall be my last letter to you. Try and contain your dismay, my beloved! We knew this could never last, didn't we? A Nord and a Dark Elf, in love while Skyrim tears itself apart? We were fools, and it is time to end it. How can I continue to fight alongside my brother Stormcloaks while sharing my bed with you? How can I call myself a true Son of Skyrim while bedding a Son of Morrowind? It is time for us to face reality and accept our separate places in life. I will always think fondly on my time with you, but that is all it can be now: memories.\n"
		elseif(tone == "child")
			MainStrings[index * 3 + paragraph] = "Have my letters been finding you? Gods, I hope this one does not go astray. Apparently other letters have, because your kin were reduced to writing me when they could not reach you. The news we have been longing for has come, beloved: the child is to be ours! You are his closest kin, and your people wait only your arrival to give the babe to us for our own. We have a son, my love! A son! We are a family now. Please, please, write your kin and go to them before they change their mind. If I could claim this child on our behalf I would turn my back on the whole war, but they will give him only into your arms. Oh how I long to see him there! Finally, my love, we are a family. Finally, we are fathers.\n"
		else
			; n/a
		endif
	endif
	UpdateLetterText(index)
endfunction


function GenerateEndingForL0(String tone, int index = 0, int paragraph = 2)
	; tone: cruel, kind, loving
	int sender = senders[0] ; 0: To Volf from Olred, 1: To Ulain from Olred
	if(sender == 0)
		if(tone == "cruel")
			MainStrings[index * 3 + paragraph] = "I wish I could have trusted you with this sooner. I wish you had been there for me, the way a brother should be. But our bond was sundered long ago, wasn't it? You and your precious ship, your gold; me and the honor of our home. How could you understand me? How could I care for you? You should have been a better man, Volf. As your brother, I deserved better. We all did. Instead, we got you. What a waste! In fact, let's stop the waste now: don't bother writing back. I have no interest in seeing what you say. The words of a greedy milk drinker do not matter to me.\nOlred"
		elseif(tone == "kind")
			MainStrings[index * 3 + paragraph] = "It is good to speak to you again, even if only in my head as I write this letter to you. It has been too long. I look forward to your response, whatever it may be. I can only hope that it will be as kind as the brother I remember so fondly.\nUntil then,\nOlred"
		else
			MainStrings[index * 3 + paragraph] = "You are my brother, Volf, and you always will be. I am sorry for not trusting you with the whole of myself sooner. I hope someday we can embrace in person once more, with our hearts fully known and open to each other. Talos guard you, my beloved brother.\nOlred"
		endif
	else
		if(tone == "cruel")
			MainStrings[index * 3 + paragraph] = "Are you reading this letter out loud to your cohort of lovers, laughing at my fumbling words and feelings? I hope you've all found plenty of amusement in them. My Stormcloak brothers have certainly found enough to laugh at when I read them your letters. Does that shock you? To know that your heart has been spilled out and pinned down for the amusement of these 'simple' Nords you scorn? That all your secret confessiosn to me were shared far and wide by the men you look down on? My only regret in telling you this now is that I cannot see the shock and hurt spill across your pretty gray face. Do write back soon and tell me how you feel now. My brothers and I cannot wait to hear your words of woe and indignation!\nLove Always,\nOlred"
		elseif(tone == "kind")
			MainStrings[index * 3 + paragraph] = "Know that you're always in my heart, whether my letters reach you to confirm my affections or not. Someday this war will end and Skyrim will be free, and so will we. Hold strong, beloved. The future waits for us.\nOlred"
		else
			MainStrings[index * 3 + paragraph] = "There are days I wish I'd never joined this war at all - but then, how would I have met you? My honor and my heart are in conflict now, but if not for my honor bringing me to the Stormcloaks I would never have found my heart's truth in you. I cannot turn my back on the fight for my homeland now, much as I long to do nothing but come home to you. If I were unfaithful to Skyrim, how could I call myself faithful to my love for you? It is your love that gives me the strength to keep fighting, your love and the knowledge that someday I will see you on the other side of it. Wait for me there.\nOlred"
		endif
	endif
	UpdateLetterText(index)
endfunction


; -------- Text For letter1 (L1):

function GenerateStartingForL1(String tone, int index = 1, int paragraph = 0)
	; tone: kind, rude, vague 

	int sender = senders[1]  ; 0: To Volf from Ulain, 1: To Olred from Ulain
	if(sender == 0)
		if(tone == "kind")
			MainStrings[index * 3 + paragraph] = "You do not know me, but I have heard so much about you from one who is dear to us both that it feels as though I know you. How I long to introduce myself to you in person! For now, this letter must suffice.\n"
		elseif(tone == "rude")
			MainStrings[index * 3 + paragraph] = "I hope that if you cannot read this yourself, captain, you can find someone willing to play orator for you. And perhaps they can translate my words to simpler phrases you can understand! Azura knows your brother's most attractive qualities were not his wits, and he always claimed to be the smartest of his kin so I can only imagine how you must be struggling now.\n"
		else
			MainStrings[index * 3 + paragraph] = "No doubt you find it odd to have a Dark Elf of no recognizable name writing you with such presumption of familiarity. We are, after all, strangers, although I have heard much of you. You cannot, of course, say the same I know.\n"
		endif
	else
		if(tone == "kind")
			MainStrings[index * 3 + paragraph] = "My dearest beloved, I have missed you so. I hope you are not cross with me for being silent for so long. Know that your name has ever been in my heart, however infrequent my letters.\n"
		elseif(tone == "rude")
			MainStrings[index * 3 + paragraph] = "You wretched cad. If only I had listened to my sisters and stayed far away from filthy, hairy, cheese-swilling Nords like you. Instead I am beguiled by your strong arms, your rippling thighs, your hot kisses, your endless wells of stupidity. Does that make me as much a fool as you are? By Azura, I hope not. Let me at least be more intelligent than my idiot lover, I pray!\n"
		else
			MainStrings[index * 3 + paragraph] = "I hope this letter finds you well. I hope this letter finds you at all! The roads are hardly safe these days. Still I cannot help but continue writing, hoping that my thoughts and wishes will make it through the war to you.\n"
		endif
	endif
	UpdateLetterText(index)
endfunction




function GenerateParagraph1ForL1(String tone, int index = 1, int paragraph = 1)
	; tone: love, breakup, child, death
	int sender = senders[1]  ; 0: To Volf from Ulain, 1: To Olred from Ulain
	if(sender == 0)
		if(tone == "love")
			MainStrings[index * 3 + paragraph] = "I write to you in your brother's name, my dearest Olred. Does it shock you to learn that your kinsman gave his heart to a Dunmer, and that I gave mine in return to him? Olred always thought you would be shocked, perhaps even horrified. That is why he never told you of me himself. But I could not keep our secret from you any longer. If my beloved is to go to your Sovengard, he should go with his love shining true rather than shackled in shame to his family's fear. He deserves no less and so much more. Know that I would have given him the world, if I could.\n"
		elseif(tone == "breakup")
			MainStrings[index * 3 + paragraph] = "I greet you today to tell you farewell. Your brother and I have long been lovers. We even thought, once, of building a future together - but such cannot be. Not in Skyrim! Not in this war. I have tried to reach your brother a hundred times to tell him this myself, but he will not listen. Please, for his sake, I beg you to tell Olred that it is over between us. I pray that he will listen to you where he will not hear me.\n"
		elseif(tone == "child")
			MainStrings[index * 3 + paragraph] = "If we lived in kinder times, your brother would tell you this himself. But we must live with the world as it is, and since Olred is in no position to write to you, I must take the duty. Is that not what lovers do? Yes, your brother loved a Dark Elf. More than that, he sought to build a family with one. That is why I write you now: to tell you that Olred and I adopted a child, an orphaned babe of my distant kin. You have a Dunmer nephew, Volf. I will not press you for an answer now, but I hope someday when my son comes to seek you, you will be able to welcome him as kin.\n"
		else
			MainStrings[index * 3 + paragraph] = "It is my sad duty to tell you that your brother Olred is dead. If the ink of this missive is stained, I pray you will forgive me my tears. It is not often that a man loses the love of his life. Does it shock you to know that your brother had a lover you never met, never knew? I am sorry. I tell you now in hopes of offering the comfort that at least Olred did not die alone and unloved. Perhaps you would rather he had, than to lie with a Dunmer. I prefer to think of you as a better man than that, one worthy of kinship with my beloved Olred. Know that whatever your feelings for me, your brother will forever be in my heart."
		endif
	else
		if(tone == "love")
			MainStrings[index * 3 + paragraph] = "Oh Oldred my dearest, is it foolish of me to write these things to you? I would much rather say them to your face, see your eyes as I speak the words I have so longed to say, but we have been apart so long and I can no longer bear the delay. Perhaps these words will never reach you, but I write them nonetheless: I love you, Olred, heart and soul and body, for today and all of my long, long tomorrows. How I will endure the ones I must face without you I do not know, but I can no longer endure today without knowing that you know this is no mere fling or fancy. I love you, Olred. I shall always love you.\n"
		elseif(tone == "breakup")
			MainStrings[index * 3 + paragraph] = "Regrettably, this shall be my last letter to you. Try and contain your dismay, my beloved! We knew this could never last, didn't we? A Nord and a Dark Elf, in love while Skyrim tears itself apart? We were fools, and it is time to end it. How can I continue to share my bed with you while you lend your strong arms to the cause of driving my people from your lands? You cannot call yourself both my lover and Ulfric's Stormcloak. If you will not make your choice, I shall make it for us both: today, we are no more. I will hold my memories of our time close, but that is all of you that I now hold.\n"
		elseif(tone == "child")
			MainStrings[index * 3 + paragraph] = "Oh how I wish for kinder times, when I might tell you of our joy face-to-face and see the light the fills your eyes when I speak the words aloud! Alas, we live in war and suffering, and I am reduced to cold prose and the hopes of a faithful courier. But oh, the joy of my news! The child is ours, beloved! Today, we are fathers. There is no closer kin to claim the babe than I, so he is ours now--both of ours. Please, come home safely from this war that you might meet him soon. How I long to see you hold our son!\n"
		else
			; n/a
		endif
	endif
	UpdateLetterText(index)
endfunction


function GenerateEndingForL1(String tone, int index = 1, int paragraph = 2)
	; tone: cruel, kind, loving
	int sender = senders[1]  ; 0: To Volf from Ulain, 1: To Olred from Ulain
	if(sender == 0)
		if(tone == "cruel")
			MainStrings[index * 3 + paragraph] = "Enough of this drivel. I should be honest. There is no need to spare the feelings of a man I've never met after all, is there? Very well, the truth: your brother is a fool, and I have played him for a fool. But now the game is over and I am bored. None of you will ever find me for the name by which he knew me is as false as my love. None of what I told him was true. My dreams, our future? All of it lies. Everything. Toying with him was a pleasant diversion, but I have better things to do now. You will not hear from me again.\nSincerely, Ulain"
		elseif(tone == "kind")
			MainStrings[index * 3 + paragraph] = "I thank you for your patience, captain. I know this cannot have been an easy letter to recieve without notice or warning. I hope that it nonetheless finds you well, and I wish you safe sailing. Perhaps someday, I will be able to wish you well to your face. Until then, know that you have my fond regard.\nUlain"
		else
			MainStrings[index * 3 + paragraph] = "I know we are ourselves strangers, but on behalf of Olred you have my very fondest regard. Stay safe, captain, and may your Talos guard you. I hope someday to be able to give you these good wishes in person. Until then, know that my heart sails with you.\nAffectionately,\nUlain"
		endif
	else
		if(tone == "cruel")
			MainStrings[index * 3 + paragraph] = "Are you reading this letter curled up in your stinking furs with one of your Stormcloak lovers beside you? Don't act coy; we both know you've had several. Not nearly as many as the men I've shared myself with in your absence, of course, but you knew what you were getting when you bedded down with a Dunmer, didn't you? Gods, I hope you are not such a fool as to have thought I would be faithful while you were away! It's a miracle that even in your absence you still hold my attention enough for me to write to you (although admittedly my focus is helped by the thrusts of the dashing orc inside me now). With your body so far away from mine, I had to find others to help me tend it. You know how my people are; your fellow Nords certainly make enough jokes about it.\nWhen you come home, maybe we'll show your friends how true those jokes are together.\nUlain"
		elseif(tone == "kind")
			MainStrings[index * 3 + paragraph] = "Are you well and whole still? I fear for you so, in this war. So many of your kin have died for Ulfric's cause. I do not want you to be one of them. You insist that your honor demands that you fight for your homeland, very well! But how long must your part of the fight last? How much longer must we be parted? Come home soon, my dear.\nI will be waiting.\nUlain"
		else
			MainStrings[index * 3 + paragraph] = "It is so hard to say farewell to you, even only in a letter. Each time I have to wonder, will this be the last? Will this be our final goodbye? Do not let it be so, beloved. Do not let this war take you from me. I do not know how I would go on without you now and I do not want to learn. I pray to Azura daily that your honor will be satisfied soon and you will return to me. I will even pray to your Talos if you think he will listen!\nI love you, dearest. Come home to me.\nUlain"
		endif
	endif
	UpdateLetterText(index)
endfunction




;;; ------------- private functions, do not edit these unless you know what you are doing

ReferenceAlias function GetNthBookAlias(int i)
	return GetNthBookAliasWithGivenTitle(i, senders[i])
endfunction

ReferenceAlias function GetNthBookAliasWithGivenTitle(int i, int sender)
	return EOBLetterForgingQuest.GetAliasByName("LetterAlias"+i+"WithTitle"+sender) as ReferenceAlias
endfunction


function FillOwningAlias(int i)
	ReferenceAlias nextRefAlias = GetNthBookAlias(i)
	nextRefAlias.ForceRefTo(ForgedLetterRefs[i])
endfunction

bool function ClearOwningAlias(int i)
	ReferenceAlias nextRefAlias = GetNthBookAlias(i)
	return nextRefAlias.TryToClear()
endfunction

function UpdateLetterText(int i)
	TextBlockObjects[i * 2].GetBaseObject().SetName(MainStrings[i * 3] + MainStrings[i * 3 + 1])
	TextBlockObjects[i * 2 + 1].GetBaseObject().SetName(MainStrings[i * 3 + 2])
endfunction
