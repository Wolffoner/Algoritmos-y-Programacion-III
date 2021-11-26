!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TestXXX category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TestXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TestXXX methodsFor: 'nil' stamp: 'LWC 11/24/2021 22:57:16'!
test01
	| portfolio |
	portfolio _ Portfolio new.
	self assert: 0*peso equals: portfolio balance.! !


!TestXXX methodsFor: 'as yet unclassified' stamp: 'LWC 11/24/2021 23:00:10'!
test02
	| portfolio anAccount deposit |
	portfolio _ Portfolio new.
	anAccount _ ReceptiveAccount new.
	deposit _ Deposit for: 100*peso.
	anAccount register: deposit.
	portfolio addAccount: anAccount.
	self assert: 100*peso equals: portfolio balance.! !

!TestXXX methodsFor: 'as yet unclassified' stamp: 'LWC 11/24/2021 22:39:02'!
test03
	| originAccount destinyAccount transfer |

	originAccount _ ReceptiveAccount new.
	destinyAccount _ ReceptiveAccount new.
	transfer _ Transfer From: originAccount To: destinyAccount ForAnAMountOf: 100*peso.
	
	self assert: transfer withdrawValue equals: -100*peso.! !

!TestXXX methodsFor: 'as yet unclassified' stamp: 'LWC 11/24/2021 22:39:07'!
test04
	| originAccount destinyAccount transfer |

	originAccount _ ReceptiveAccount new.
	destinyAccount _ ReceptiveAccount new.
	transfer _ Transfer From: originAccount To: destinyAccount ForAnAMountOf: 100*peso.
	
	self assert: transfer depositValue equals: 100*peso.! !

!TestXXX methodsFor: 'as yet unclassified' stamp: 'LWC 11/24/2021 22:39:24'!
test05
	| originAccount destinyAccount transfer |

	originAccount _ ReceptiveAccount new.
	destinyAccount _ ReceptiveAccount new.
	transfer _ Transfer From: originAccount To: destinyAccount ForAnAMountOf: 100*peso.
	
	originAccount register: transfer.
	destinyAccount  register: transfer.
	
	self assert: originAccount balance equals: -100*peso.
	self assert: destinyAccount balance equals: 100*peso.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'events-accessing' stamp: 'LWC 11/24/2021 19:34:10'!
affectBalance
	^ self value.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'LWC 11/24/2021 22:51:51'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferDeposit
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'AR 11/25/2021 21:00:41'!
affectBalance
	^ self value negated.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'AR 11/25/2021 20:37:15'!
initializeFor: aValue of: aTransfer

	value := aValue.
	transfer := aTransfer. 
! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'AR 11/25/2021 20:59:28'!
otherTransferLeg

	^ transfer transferWithdrawLeg.! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'AR 11/25/2021 20:30:21'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'AR 11/25/2021 20:35:13'!
for: aValue of: aTransfer

	^ self new initializeFor: aValue of: aTransfer.! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferWithdraw
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'AR 11/25/2021 20:28:41'!
affectBalance
	^ self value.! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'AR 11/25/2021 20:37:51'!
initializeFor: aValue of: aTransfer

	value := aValue.
	transfer := aTransfer. ! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'AR 11/25/2021 21:00:12'!
otherTransferLeg

	^ transfer transferDepositLeg.! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'AR 11/25/2021 20:30:31'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'AR 11/25/2021 20:36:02'!
for: aValue of: aTransfer

	^ self new initializeFor: aValue of: aTransfer.! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'LWC 11/24/2021 19:32:54'!
affectBalance
	^ self value negated.! !

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'LWC 11/24/2021 19:10:32'!
value

	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accounts'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'LWC 11/24/2021 23:03:16'!
addAccount: aReceptiveAccount 
	^accounts add: aReceptiveAccount.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'LWC 11/24/2021 23:05:12'!
balance
	^accounts sum: [:anAccount | anAccount balance] ifEmpty: [0*peso].! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'LWC 11/24/2021 23:03:04'!
initialize
	accounts _ OrderedCollection new.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'AR 11/25/2021 21:03:44'!
balance

	^transactions sum: [ :aTransaction | aTransaction affectBalance] ifEmpty: [ 0 ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'transferDepositLeg transferWithdrawLeg value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'nil' stamp: 'AR 11/25/2021 20:54:07'!
initializeWithTransferDeposit: aTransferDeposit and: aTransferWithdraw ForAmountOf: aMoney.

	value := aMoney.
	
	transferDepositLeg := aTransferDeposit.
	
	transferWithdrawLeg := aTransferWithdraw.
	
	
	

	! !


!Transfer methodsFor: 'as yet unclassified' stamp: 'AR 11/25/2021 20:56:21'!
transferDepositLeg
	^ transferDepositLeg.
	! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'AR 11/25/2021 20:57:03'!
transferWithdrawLeg
	^ transferWithdrawLeg.
	! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'LWC 11/24/2021 21:59:41'!
value
	^ value.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'AR 11/25/2021 20:48:38'!
From: anOriginAccount To: aDestinyAccount ForAnAMountOf: aMoney
	
	|aTransferDeposit aTransferWithdraw|
	
	aTransferDeposit := TransferDeposit for: aMoney of: self.
	
	aTransferWithdraw := TransferWithdraw for: aMoney of: self.
	
	anOriginAccount register: aTransferDeposit.
	
	aDestinyAccount register: aTransferWithdraw.
	
	self new.

	^self new initializeWithOriginAccount: anOriginAccount toDestinyAccount: aDestinyAccount ForAmountOf: aMoney.
 ! !
