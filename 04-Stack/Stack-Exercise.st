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

!OOStack methodsFor: 'accessing' stamp: 'LWC 11/1/2021 20:39:24'!
isEmpty
	^status obtainStatus.! !

!OOStack methodsFor: 'accessing' stamp: 'LWC 11/1/2021 21:06:42'!
lastValue
	^stack at: self size.! !

!OOStack methodsFor: 'accessing' stamp: 'LWC 11/1/2021 19:41:09'!
pop
	^self popIfAbsent: [self error: OOStack stackEmptyErrorDescription].
	! !

!OOStack methodsFor: 'accessing' stamp: 'LWC 11/1/2021 20:45:05'!
push: anElement
	(stack isEmpty) ifTrue: [status := status modifyStatus].
	stack addLast: anElement.! !

!OOStack methodsFor: 'accessing' stamp: 'LWC 11/1/2021 13:51:35'!
size
	^stack size.! !

!OOStack methodsFor: 'accessing' stamp: 'LWC 11/1/2021 21:02:46'!
top
	^status obtainTopeOf: self.
! !


!OOStack methodsFor: 'initialization' stamp: 'LWC 11/1/2021 20:31:55'!
initialize
	stack := OrderedCollection new.
	status := StackStatusEmpty new.
	! !


!OOStack methodsFor: 'accesing - private' stamp: 'LWC 11/1/2021 14:22:19'!
popIfAbsent: aBlock
	^stack remove: (self topValueIfAbsent: aBlock) ifAbsent: aBlock. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackStatus category: 'Stack-Exercise'!
Object subclass: #OOStackStatus
	instanceVariableNames: 'statusEmpty'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'LWC 11/1/2021 20:26:59'!
initialize
	self subclassResponsibility.! !

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'LWC 11/1/2021 20:24:10'!
modifyStatus
	self subclassResponsibility.! !

!OOStackStatus methodsFor: 'as yet unclassified' stamp: 'LWC 11/1/2021 20:24:20'!
obtainStatus
	self subclassResponsibility.! !


!classDefinition: #StackStatusEmpty category: 'Stack-Exercise'!
OOStackStatus subclass: #StackStatusEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackStatusEmpty methodsFor: 'as yet unclassified' stamp: 'LWC 11/1/2021 20:30:32'!
initialize
	statusEmpty _ true.
	! !

!StackStatusEmpty methodsFor: 'as yet unclassified' stamp: 'LWC 11/1/2021 20:37:34'!
modifyStatus
	^StackStatusNotEmpty new.! !

!StackStatusEmpty methodsFor: 'as yet unclassified' stamp: 'LWC 11/1/2021 20:40:23'!
obtainStatus
	^statusEmpty.! !

!StackStatusEmpty methodsFor: 'as yet unclassified' stamp: 'LWC 11/1/2021 21:15:00'!
obtainTopeOf: aStack.
	^aStack error: aStack class stackEmptyErrorDescription.! !


!classDefinition: #StackStatusNotEmpty category: 'Stack-Exercise'!
OOStackStatus subclass: #StackStatusNotEmpty
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackStatusNotEmpty methodsFor: 'as yet unclassified' stamp: 'LWC 11/1/2021 20:30:43'!
initialize
	statusEmpty _ false.
	! !

!StackStatusNotEmpty methodsFor: 'as yet unclassified' stamp: 'LWC 11/1/2021 20:38:27'!
modifyStatus
	^StackStatusEmpty new.! !

!StackStatusNotEmpty methodsFor: 'as yet unclassified' stamp: 'LWC 11/1/2021 20:40:18'!
obtainStatus
	^statusEmpty.! !

!StackStatusNotEmpty methodsFor: 'as yet unclassified' stamp: 'LWC 11/1/2021 21:07:10'!
obtainTopeOf: aStack
	^aStack lastValue.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!
