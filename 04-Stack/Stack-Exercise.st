!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'LWC 10/29/2021 23:27:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject.! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'LWC 11/1/2021 14:12:56'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'LWC 11/1/2021 21:08:40'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText equals: OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'setup' stamp: 'LWC 11/3/2021 23:59:25'!
setUp

	! !


!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LWC 11/3/2021 23:43:56'!
test01SentenceFinderCanFindAPrefixOnAStackEmpty

	| stack sentenceFinder prefix|
	
	stack _ OOStack new.
	sentenceFinder _ SentenceFinderByPrefix new.
	prefix _ 'Something'.
	
	self assert: (sentenceFinder find: prefix in: stack) size equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LWC 11/3/2021 22:46:49'!
test02SentenceFinderCanFindAPrefixOnAStackNotEmpty

	| stack sentenceFinder prefix|
	
	stack _ OOStack new.
	stack push: 'test1'.
	sentenceFinder _ SentenceFinderByPrefix new.
	prefix _ 'Something'.
	
	self assert: (sentenceFinder find: prefix in: stack) size equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LWC 11/3/2021 23:22:31'!
test03SentenceFinderFindAStringWithPrefixOnAStack

	| stack sentenceFinder sentences prefix|
	
	stack _ OOStack new.
	stack push: 'Something test1'.
	sentenceFinder _ SentenceFinderByPrefix new.
	prefix _ 'Something'.
	sentences := sentenceFinder find: prefix in: stack.
	
	self assert: sentences size equals: 1.
	self assert: (sentences at: 1) equals: 'Something test1'.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LWC 11/3/2021 23:29:37'!
test04SentenceFinderFindVariousStringsWithAPrefixOnAStack

	| stack sentenceFinder sentences prefix|
	
	stack _ OOStack new.
	stack push: 'Something test1'.
	stack push: 'Something test2'.
	stack push: 'something test3'.
	stack push: 'Something test4'.
	sentenceFinder _ SentenceFinderByPrefix new.
	prefix _ 'Some'.
	sentences := sentenceFinder find: prefix in: stack.
	
	self assert: sentences size equals: 3.
	self assert: (sentences at: 1) equals: 'Something test4'.
	self assert: (sentences at: 2) equals: 'Something test2'.
	self assert: (sentences at: 3) equals: 'Something test1'.
	! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LWC 11/3/2021 23:29:47'!
test05SentenceFinderFindStringAndStackMaintainOrder

	| stack sentenceFinder prefix|
	
	stack _ OOStack new.
	stack push: 'Something test1'.
	stack push: 'Something test2'.
	sentenceFinder _ SentenceFinderByPrefix new.
	prefix _ 'Some'.

	sentenceFinder find: prefix in: stack.
	
	self assert: stack size equals: 2.
	self assert: stack pop equals: 'Something test2'.
	self assert: stack pop equals: 'Something test1'.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LWC 11/3/2021 23:42:43'!
test06SentenceFinderFindWithAPrefixInAStackRespectCaseSensitive

	| stack sentenceFinder prefix sentences |
	
	stack _ OOStack new.
	stack push: 'Something test1'.
	stack push: 'Something test2'.
	sentenceFinder _ SentenceFinderByPrefix new.
	prefix _ 'some'.

	sentences _ sentenceFinder find: prefix in: stack.
	
	self assert: sentences size equals: 0.! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LWC 11/3/2021 23:46:21'!
test07SentenceFinderCanNotFindInAStackIfPrefixIsEmpty

	| stack sentenceFinder prefix |
	
	stack _ OOStack new.
	stack push: 'Something test1'.
	stack push: 'Something test2'.
	sentenceFinder _ SentenceFinderByPrefix new.
	prefix _ ''.
	
	self
		should: [ sentenceFinder find: prefix in: stack. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix PrefixEmptyErrorDescription].
		! !

!SentenceFinderByPrefixTest methodsFor: 'testing' stamp: 'LWC 11/4/2021 00:02:22'!
test08SentenceFinderCanNotFindInAStackIfPrefixContainSpaces

	| stack sentenceFinder prefix |
	
	stack _ OOStack new.
	stack push: 'Something test1'.
	stack push: 'Something test2'.
	sentenceFinder _ SentenceFinderByPrefix new.
	prefix _ 'some thing'.
	
	self
		should: [ sentenceFinder find: prefix in: stack. ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = SentenceFinderByPrefix PrefixIncludeSpacesErrorDescription].
		! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'stack status'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'accessing' stamp: 'LWC 11/3/2021 11:18:19'!
isEmpty
	^status isEmpty.! !

!OOStack methodsFor: 'accessing' stamp: 'LWC 11/3/2021 11:13:49'!
pop
	| element |
	element _ status removeTopeOf: self.
	self defineStatus.
	^element.! !

!OOStack methodsFor: 'accessing' stamp: 'LWC 11/3/2021 11:13:05'!
push: anElement
	stack addLast: anElement.
	self defineStatus.! !

!OOStack methodsFor: 'accessing' stamp: 'LWC 11/1/2021 13:51:35'!
size
	^stack size.! !

!OOStack methodsFor: 'accessing' stamp: 'LWC 11/1/2021 21:02:46'!
top
	^status obtainTopeOf: self.
! !


!OOStack methodsFor: 'initialization' stamp: 'LWC 11/3/2021 11:13:05'!
initialize
	stack _ OrderedCollection new.
	self defineStatus.! !


!OOStack methodsFor: 'helpers' stamp: 'LWC 11/3/2021 11:13:05'!
defineStatus
	^status _ OOStackStatus newWith: self size.
! !

!OOStack methodsFor: 'helpers' stamp: 'LWC 11/1/2021 21:06:42'!
lastValue
	^stack at: self size.! !

!OOStack methodsFor: 'helpers' stamp: 'LWC 11/3/2021 10:45:57'!
removeLastValue
	^stack removeLast.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackStatus category: 'Stack-Exercise'!
Object subclass: #OOStackStatus
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'LWC 11/3/2021 10:35:22'!
isEmpty
	self subclassResponsibility.! !

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'LWC 11/3/2021 11:12:25'!
obtainTopeOf: aStack.
	self subclassResponsibility.! !

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'LWC 11/3/2021 11:11:50'!
removeTopeOf: aStack.
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackStatus class' category: 'Stack-Exercise'!
OOStackStatus class
	instanceVariableNames: ''!

!OOStackStatus class methodsFor: 'as yet unclassified' stamp: 'LWC 11/3/2021 11:17:16'!
canInstanceWith: aSize
	self subclassResponsibility.! !

!OOStackStatus class methodsFor: 'as yet unclassified' stamp: 'LWC 11/3/2021 10:38:53'!
newWith: Size
	| subclass |
	subclass _ self subclasses detect:  [ :aSubClass | aSubClass  canInstanceWith: Size].
	^subclass new.! !


!classDefinition: #StackStatusEmpty category: 'Stack-Exercise'!
OOStackStatus subclass: #StackStatusEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackStatusEmpty methodsFor: 'as yet unclassified' stamp: 'LWC 11/3/2021 10:36:03'!
isEmpty
	^true.
	! !

!StackStatusEmpty methodsFor: 'as yet unclassified' stamp: 'LWC 11/1/2021 21:15:00'!
obtainTopeOf: aStack.
	^aStack error: aStack class stackEmptyErrorDescription.! !

!StackStatusEmpty methodsFor: 'as yet unclassified' stamp: 'LWC 11/3/2021 11:10:41'!
removeTopeOf: aStack
	^aStack error: aStack class stackEmptyErrorDescription.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackStatusEmpty class' category: 'Stack-Exercise'!
StackStatusEmpty class
	instanceVariableNames: ''!

!StackStatusEmpty class methodsFor: 'as yet unclassified' stamp: 'LWC 11/3/2021 10:31:17'!
canInstanceWith: aSize
	^ aSize = 0.! !


!classDefinition: #StackStatusNotEmpty category: 'Stack-Exercise'!
OOStackStatus subclass: #StackStatusNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackStatusNotEmpty methodsFor: 'as yet unclassified' stamp: 'LWC 11/3/2021 10:36:43'!
isEmpty
	^false.
	! !

!StackStatusNotEmpty methodsFor: 'as yet unclassified' stamp: 'LWC 11/1/2021 21:07:10'!
obtainTopeOf: aStack
	^aStack lastValue.! !

!StackStatusNotEmpty methodsFor: 'as yet unclassified' stamp: 'LWC 11/3/2021 11:11:09'!
removeTopeOf: aStack
	^aStack removeLastValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'StackStatusNotEmpty class' category: 'Stack-Exercise'!
StackStatusNotEmpty class
	instanceVariableNames: ''!

!StackStatusNotEmpty class methodsFor: 'as yet unclassified' stamp: 'LWC 11/3/2021 10:31:47'!
canInstanceWith: aSize
	^ aSize > 0.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'sentencesWithAPrefix'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'LWC 11/3/2021 23:55:20'!
find: aPrefix in: aStack
	|auxiliarStack currentString |
	
	(aPrefix = '') ifTrue: [	^self error: self class PrefixEmptyErrorDescription.]. 
	(aPrefix includes: $ ) ifTrue: [^self error: self class PrefixIncludeSpacesErrorDescription].
	
	auxiliarStack _ OOStack new.
	aStack size timesRepeat: [
			currentString  _ aStack pop.
			auxiliarStack  push: currentString.
			(currentString beginsWith: aPrefix) ifTrue: [sentencesWithAPrefix addLast: currentString].
		].
	auxiliarStack size timesRepeat: [
		aStack push: auxiliarStack pop.
		].
	^sentencesWithAPrefix.! !

!SentenceFinderByPrefix methodsFor: 'accessing' stamp: 'LWC 11/3/2021 22:45:41'!
initialize
	sentencesWithAPrefix _ OrderedCollection new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'error handling' stamp: 'LWC 11/3/2021 23:39:46'!
PrefixEmptyErrorDescription
	
	^ 'Prefix is empty'! !

!SentenceFinderByPrefix class methodsFor: 'error handling' stamp: 'LWC 11/3/2021 23:51:01'!
PrefixIncludeSpacesErrorDescription
	
	^ 'Prefix include spaces.'! !
