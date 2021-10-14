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
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'helper-methods' stamp: 'LWC 10/13/2021 23:34:03'!
execute: aCustomerBookActionThatWillFail using: aCustomerBook with: anException
	| johnLennon | 
	johnLennon := 'John Lennon'.
	
	"Execute aCustomerBookActionThatWillFail with an Exception"
	[aCustomerBookActionThatWillFail value. self fail]
		on: anException
		do: [ :anError | 
			self assert: aCustomerBook numberOfCustomers = 1.
			self assert: (aCustomerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'helper-methods' stamp: 'LWC 10/13/2021 23:37:14'!
verifyQuantityOfCustomersFrom: aCustomerBook with: anExpectedQuantityOfActiveCustomers with: anExpectedQuantityOfSuspendedCustomers with: anExpectedQuantityOfTotalCustomers andVerifyIf: anExpectedCustomerIncludedInCustomerBook
	| paulMcCartney |
	paulMcCartney:='Paul McCartney'.
	
	"Asserts with an Expected value of a Customer Book"
	self assert: anExpectedQuantityOfActiveCustomers equals: aCustomerBook numberOfActiveCustomers.
	self assert: anExpectedQuantityOfSuspendedCustomers equals: aCustomerBook numberOfSuspendedCustomers.
	self assert: anExpectedQuantityOfTotalCustomers equals: aCustomerBook numberOfCustomers.
	self assert: anExpectedCustomerIncludedInCustomerBook equals: [aCustomerBook includesCustomerNamed: paulMcCartney] value.

	
! !

!CustomerBookTest methodsFor: 'helper-methods' stamp: 'LWC 10/13/2021 23:53:22'!
verifyTimeOf: aCustomerBookAction isLessThan: anEstimatedTime
	|millisecondsBeforeRunning millisecondsAfterRunning |
	
	"Verify time execute of a Customer Book Action is less than an Estimated Time"
	millisecondsBeforeRunning := Time millisecondClockValue * millisecond.
	aCustomerBookAction value.
	millisecondsAfterRunning := Time millisecondClockValue * millisecond.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < anEstimatedTime.! !


!CustomerBookTest methodsFor: 'tests' stamp: 'LWC 10/13/2021 23:31:04'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	
	|customerBook aCustomer aTime aCustomerBookAction |
	
	customerBook:= CustomerBook new. 
	aCustomer:= 'John Lennon'.
	
	aCustomerBookAction := [customerBook addCustomerNamed: aCustomer].
	aTime := 50 * millisecond.
	
	"Verify if aClojure run is less than a time."
	^self verifyTimeOf: aCustomerBookAction isLessThan: aTime
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LWC 10/13/2021 23:31:56'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	|customerBook aCustomer aTime aCustomerBookAction |
	
	customerBook:= CustomerBook new. 
	aCustomer:= 'Paul McCartney'.
	customerBook addCustomerNamed: aCustomer.
	
	aCustomerBookAction := [customerBook removeCustomerNamed: aCustomer].
	aTime := 100 * millisecond.
	
	"Verify if a Clojure run is less than a time."
	^self verifyTimeOf: aCustomerBookAction isLessThan: aTime.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LWC 10/13/2021 23:48:17'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.
	
	 "Segun nuestro criterio en este test no es necesario aplicar el algoritmo para quitar el codigo repetido, consideramos que al aplicarlo en distintos asserts(test04, test07, test08) complejizamos nuestra solucion lo que lo hace menos legible."

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LWC 10/13/2021 23:11:46'!
test04CanNotRemoveAnInvalidCustomer
	
	| aCustomerBook johnLennon anException aCustomerBookActionThatWillFail |
			
	aCustomerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	aCustomerBook addCustomerNamed: johnLennon.
	aCustomerBookActionThatWillFail := [ aCustomerBook removeCustomerNamed: 'Paul McCartney'].
	anException := NotFound.
	
	self execute: aCustomerBookActionThatWillFail using: aCustomerBook with: anException.
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LWC 10/13/2021 23:26:22'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| paulMcCartney anExpectedQuantityofActiveCustomers anExpectedQuantityofSuspendedCustomers anExpectedQuantityofTotalCustomers anExpectedCustomerIncludedInCustomerBook aCustomerBook |

	anExpectedQuantityofActiveCustomers := 0.
	anExpectedQuantityofSuspendedCustomers := 1.
	anExpectedQuantityofTotalCustomers := 1.
	anExpectedCustomerIncludedInCustomerBook := true.
			
	aCustomerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	aCustomerBook addCustomerNamed: paulMcCartney.
	aCustomerBook suspendCustomerNamed: paulMcCartney.
		
	self verifyQuantityOfCustomersFrom: aCustomerBook with: anExpectedQuantityofActiveCustomers with: anExpectedQuantityofSuspendedCustomers  with: 	anExpectedQuantityofTotalCustomers andVerifyIf: anExpectedCustomerIncludedInCustomerBook.

	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LWC 10/13/2021 23:25:10'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney anExpectedQuantityofActiveCustomers anExpectedQuantityofSuspendedCustomers anExpectedQuantityofTotalCustomers anExpectedCustomerIncludedInCustomerBook |
	
	anExpectedQuantityofActiveCustomers := 0.
	anExpectedQuantityofSuspendedCustomers := 0.
	anExpectedQuantityofTotalCustomers := 0.
	anExpectedCustomerIncludedInCustomerBook:= false.
			
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.

	self verifyQuantityOfCustomersFrom: customerBook with: anExpectedQuantityofActiveCustomers with: anExpectedQuantityofSuspendedCustomers  with: 		anExpectedQuantityofTotalCustomers andVerifyIf: anExpectedCustomerIncludedInCustomerBook.


	

	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LWC 10/13/2021 23:08:39'!
test07CanNotSuspendAnInvalidCustomer
	
	| johnLennon anException aCustomerBook aCustomerBookActionThatWillFail  |
			
	aCustomerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	aCustomerBook addCustomerNamed: johnLennon.
	aCustomerBookActionThatWillFail := [ aCustomerBook suspendCustomerNamed: 'Ringo Starr'].
	anException := CantSuspend.
	
	self execute: aCustomerBookActionThatWillFail using: aCustomerBook with: anException.
	
! !

!CustomerBookTest methodsFor: 'tests' stamp: 'LWC 10/13/2021 23:11:03'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| johnLennon anException aCustomerBook aCustomerBookActionThatWillFail |
			
	aCustomerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	aCustomerBook addCustomerNamed: johnLennon.
	aCustomerBook suspendCustomerNamed: johnLennon.
	aCustomerBookActionThatWillFail := [ aCustomerBook suspendCustomerNamed: johnLennon].
	anException := CantSuspend.
	
	self execute: aCustomerBookActionThatWillFail using: aCustomerBook with: anException.
! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'initialization' stamp: 'LL 10/30/2020 12:22:04'!
initialize

	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'LWC 10/13/2021 21:31:50'!
removeCustomerNamed: aName 

	" removeCustomerNamed in Collection if exist"
	^self removeCustomerNamed: aName inCollection: active  ifAbsent: [ 
		self removeCustomerNamed: aName inCollection: suspended ifAbsent: [
			^NotFound signal.]].

! !

!CustomerBook methodsFor: 'customer management' stamp: 'LWC 10/13/2021 23:49:46'!
removeCustomerNamed: aName inCollection: aCollection ifAbsent: absentBlock
	
	"Remove a Customer in a Collection if doesn't exist run absentBlock"
	1 to: aCollection size do: [ :index |
		aName = (aCollection at: index)
			ifTrue: [
				aCollection removeAt: index.
				^ aName ]].
	^ absentBlock value
! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'accessing' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !


!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
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
