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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
