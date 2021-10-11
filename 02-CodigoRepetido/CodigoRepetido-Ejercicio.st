!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'posibleMethods'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'tests' stamp: 'LWC 10/10/2021 23:43:29'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	|customerBook aCustomer aCustomerBookMethod MaximumTime|
	
	customerBook:= CustomerBook new. 
	aCustomer:= 'John Lennon'.
	aCustomerBookMethod := [customerBook addCustomerNamed: aCustomer].
	MaximumTime := 50 * millisecond.
	
	"Verify if method application with a customer is less than maximum time."
	^self verifyTimeOf: aCustomerBookMethod for: aCustomer isLessThan: MaximumTime.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LWC 10/10/2021 23:47:30'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	|customerBook aCustomer aCustomerBookMethod MaximumTime|
	
	customerBook:= CustomerBook new. 
	aCustomer:= 'Paul McCartney'.
	customerBook addCustomerNamed: aCustomer.
	aCustomerBookMethod := [customerBook removeCustomerNamed: aCustomer].
	MaximumTime := 100 * millisecond.
	
	"Verify if method application with a customer is less than maximum time."
	^self verifyTimeOf: aCustomerBookMethod for: aCustomer isLessThan: MaximumTime.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/9/2012 18:12'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'HAW 8/28/2017 08:57:25'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LWC 10/10/2021 22:15:50'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	^self notRemoveItFromCustomerBook: 'Suspended'.


	"| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	
	self assert: (customerBook includesCustomerNamed: paulMcCartney)."
	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LWC 10/10/2021 22:23:20'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	^self notRemoveItFromCustomerBook: 'Removing'.

	"| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney)."


	



	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AR 10/9/2021 18:05:44'!
test07CanNotSuspendAnInvalidCustomer
	^self canNotSuspendCustomer: [true].
	
	"| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]"
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'AR 10/9/2021 18:07:04'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	^self canNotSuspendCustomer: [false].
	
	"| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]"
! !


!CustomerBookTest methodsFor: 'helper-methods' stamp: 'AR 10/9/2021 18:04:36'!
canNotSuspendCustomer: unBloque
	
	| customerBook johnLennon customerToBeSuspended|
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	unBloque value ifTrue: [ customerToBeSuspended := 'Ringo Starr'] 
				ifFalse: [ customerToBeSuspended := 'John Lennon'. customerBook suspendCustomerNamed: customerToBeSuspended.].
	
	[ customerBook suspendCustomerNamed: customerToBeSuspended.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !

!CustomerBookTest methodsFor: 'helper-methods' stamp: 'LWC 10/10/2021 23:22:48'!
initializePosibleMethods
	posibleMethods := Dictionary new.
	posibleMethods at: 'add' put: 1.
	! !

!CustomerBookTest methodsFor: 'helper-methods' stamp: 'AR 10/9/2021 16:39:22'!
invalidModifications
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'helper-methods' stamp: 'LWC 10/10/2021 23:13:49'!
notRemoveItFromCustomerBook: aMethod

	| customerBook paulMcCartney asserts includesCustomer |
	
	customerBook := CustomerBook new.
	"cambiar nombres"
	includesCustomer:= Dictionary  new.
	asserts := Dictionary new.
	asserts at: 'Suspended' put: #(0 1 1).
	asserts at: 'Removing' put: #(0 0 0).
	
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	(aMethod = 'Removing') ifTrue: [customerBook removeCustomerNamed: paulMcCartney.].
	
	includesCustomer at: 'Suspended' put: [self assert: (customerBook includesCustomerNamed: paulMcCartney)].	
	includesCustomer at: 'Removing' put: [self deny: (customerBook includesCustomerNamed: paulMcCartney)].
	
	self assert: [[asserts at: aMethod] value at: 1] value equals: customerBook numberOfActiveCustomers.
	self assert: [[asserts at: aMethod] value at: 2] value equals: customerBook numberOfSuspendedCustomers.
	self assert: [[asserts at: aMethod] value at: 3] value equals: customerBook numberOfCustomers.
	
	includesCustomer at: aMethod value.
	

	
! !

!CustomerBookTest methodsFor: 'helper-methods' stamp: 'LWC 10/11/2021 00:06:02'!
verifyTimeOf: aCustomerBookMethod for: aCustomer isLessThan: MaximumTime
	|millisecondsBeforeRunning millisecondsAfterRunning|
	
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aCustomerBookMethod value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < MaximumTime.
	

	! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active typeOfList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'AR 10/10/2021 16:19:01'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'AR 10/10/2021 16:19:01'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'LWC 10/10/2021 22:27:55'!
removeCustomerNamed: aName 
 
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
! !

!CustomerBook methodsFor: 'customer management' stamp: 'AR 10/10/2021 16:26:15'!
searchAndRemoveCustomerInAList: aName
 
	1 to: typeOfList size do: 
	[ :index |
		aName = (typeOfList at: index)
			ifTrue: [
				typeOfList removeAt: index.
				^ aName 
			] 
	].

! !

!CustomerBook methodsFor: 'customer management' stamp: 'AR 10/10/2021 16:19:01'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'AR 10/10/2021 16:19:01'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'AR 10/10/2021 16:19:01'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'AR 10/10/2021 16:19:02'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'AR 10/10/2021 16:19:01'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'signal errors' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
