!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'testing' stamp: 'LWC 11/28/2021 20:51:56'!
test01AnEmptyPortfolioHasNeutralBalance
	| portfolio |
	portfolio _ Portfolio new.
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'LWC 11/28/2021 20:23:02'!
test02APortfolioAddAnAccountAndAffectsHisBalance
	| portfolio account deposit |
	portfolio _ Portfolio new.
	account _ ReceptiveAccount new.
	deposit _ Deposit for: 100*peso.
	account register: deposit.
	portfolio add: account.
	self assert: 100*peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'LWC 11/28/2021 20:24:07'!
test03APortfolioBalanceEqualsASumOfAccountsBalance
	| portfolio account1 account2 deposit1 deposit2 |
	portfolio _ Portfolio new.
	account1 _ ReceptiveAccount new.
	account2 _ ReceptiveAccount new.
	deposit1 _ Deposit for: 100*peso.
	deposit2 _ Deposit for: 200*peso.
	account1 register: deposit1.
	account2 register: deposit2.
	portfolio add: account1.
	portfolio add: account2.
	
	self assert: 300*peso equals: portfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'LWC 11/28/2021 20:25:23'!
test04APortfolioBalanceEqualsSumOfPortfoliosBalance
	| portfolio account deposit masterPortfolio |
	
	masterPortfolio _ Portfolio new.
	portfolio _ Portfolio new.
	account _ ReceptiveAccount new.
	deposit _ Deposit for: 100*peso.
	
	account register: deposit.
	portfolio add: account.
	masterPortfolio add: portfolio.
	
	self assert: 100*peso equals: masterPortfolio balance.! !

!PortfolioTest methodsFor: 'testing' stamp: 'LWC 11/28/2021 20:26:57'!
test05APortfolioCanNotAddSelfPortfolio
	| account deposit masterPortfolio |
	
	masterPortfolio _ Portfolio new.
	account _ ReceptiveAccount new.
	deposit _ Deposit for: 100*peso.
	
	account register: deposit.
	masterPortfolio add: account.
	
	self
		should: [masterPortfolio add: masterPortfolio]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = masterPortfolio class ErrorCanNotAddSelfObjectPortfolio.
			self assert: 100*peso equals: masterPortfolio balance.
			].

	
	! !

!PortfolioTest methodsFor: 'testing' stamp: 'LWC 11/28/2021 20:27:51'!
test06APortfolioKnowsTransactionsOfAnSpecificAccount
	| portfolio account1 account2 deposit1 deposit2 transactions |
	portfolio _ Portfolio new.
	account1 _ ReceptiveAccount new.
	deposit1 _ Deposit for: 100*peso.
	deposit2 _ Deposit for: 200*peso.
	account1 register: deposit1.
	account1 register: deposit2.
	portfolio add: account1.
	
	transactions _ portfolio transactionsOfAccount: account1.
	
	self assert: deposit1 equals: (transactions at: 1).
	self assert: deposit2 equals: (transactions at: 2).! !

!PortfolioTest methodsFor: 'testing' stamp: 'LWC 11/28/2021 20:32:07'!
test07APortfolioKnowsTransactionsOfAnAccountIncludesInAPortfolioAdded

	| account1 deposit1 deposit2 transactions masterPortfolio portfolio1 portfolio2 |
	masterPortfolio _ Portfolio new.
	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	account1 _ ReceptiveAccount new.
	deposit1 _ Deposit for: 100*peso.
	deposit2 _ Deposit for: 200*peso.
	
	account1 register: deposit1.
	account1 register: deposit2.
	portfolio2 add: account1.
	masterPortfolio  add: portfolio1.
	masterPortfolio add: portfolio2.
	
	transactions _ masterPortfolio transactionsOfAccount: account1.
	
	self assert: deposit1 equals: (transactions at: 1).
	self assert: deposit2 equals: (transactions at: 2).
! !

!PortfolioTest methodsFor: 'testing' stamp: 'LWC 11/28/2021 20:48:50'!
test08APortfolioKnowsAnAccountIncludedInSelf
	| portfolio account1 |
	portfolio _ Portfolio new.
	account1 _ ReceptiveAccount new.
	
	portfolio add: account1.
	
	self assert: true equals: (portfolio hasAccount: account1).! !

!PortfolioTest methodsFor: 'testing' stamp: 'LWC 11/28/2021 20:49:00'!
test09APortfolioKnowsAnAccountAddedInAnotherPortfolioIncluded
	| portfolio1 portfolio2 account1 masterPortfolio |
	masterPortfolio _ Portfolio new.
	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	account1 _ ReceptiveAccount new.
	
	masterPortfolio add: portfolio1.
	masterPortfolio add: portfolio2.
	portfolio2 add: account1.
	
	self assert: true equals: (masterPortfolio hasAccount: account1).! !

!PortfolioTest methodsFor: 'testing' stamp: 'LWC 11/28/2021 20:49:08'!
test10APortfolioKnowsIfAnyAccountHasATransaction
	| portfolio1 portfolio2 account1 masterPortfolio |
	masterPortfolio _ Portfolio new.
	portfolio1 _ Portfolio new.
	portfolio2 _ Portfolio new.
	account1 _ ReceptiveAccount new.
	
	masterPortfolio add: portfolio1.
	masterPortfolio add: portfolio2.
	portfolio2 add: account1.
	
	self assert: false equals: masterPortfolio hasAnyAccountATransaction.! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LWC 11/28/2021 20:39:03'!
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


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'testing' stamp: 'LWC 11/28/2021 18:31:22'!
test01getTransferValueOfAValidTransfer
	| originAccount destinyAccount transfer |

	originAccount _ ReceptiveAccount new.
	destinyAccount _ ReceptiveAccount new.
	transfer _ Transfer From: originAccount To: destinyAccount ForAnAMountOf: 100*peso.
	
	self assert: transfer value equals: 100*peso.! !

!TransferTest methodsFor: 'testing' stamp: 'LWC 11/28/2021 18:32:24'!
test02LegsOfATransferKnowTheValueToAffectABalance
	| originAccount destinyAccount transfer depositLeg withdrawLeg |

	originAccount _ ReceptiveAccount new.
	destinyAccount _ ReceptiveAccount new.
	transfer _ Transfer From: originAccount To: destinyAccount ForAnAMountOf: 100*peso.
	depositLeg _ transfer depositLeg. 
	withdrawLeg _ transfer withdrawLeg.
	
	self assert: depositLeg affectBalance equals: -100*peso.
	self assert: withdrawLeg affectBalance equals: 100*peso.! !

!TransferTest methodsFor: 'testing' stamp: 'LWC 11/28/2021 18:32:54'!
test03VerifyIfTransferModifyTheBalanceOfTheAccounts
	| originAccount destinyAccount transfer |

	originAccount _ ReceptiveAccount new.
	destinyAccount _ ReceptiveAccount new.
	transfer _ Transfer From: originAccount To: destinyAccount ForAnAMountOf: 100*peso.
	
	self assert: originAccount balance equals: -100*peso.
	self assert: destinyAccount balance equals: 100*peso.! !

!TransferTest methodsFor: 'testing' stamp: 'LWC 11/28/2021 18:33:24'!
test04CanNotCreateATransferIfAmountIsInvalid
	| originAccount destinyAccount |

	originAccount _ ReceptiveAccount new.
	destinyAccount _ ReceptiveAccount new.
	
		self
		should: [Transfer From: originAccount To: destinyAccount ForAnAMountOf: 0*peso.]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Transfer TransferErrorAmountInvalid].
! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'events-accessing' stamp: 'LWC 11/28/2021 17:56:25'!
affectBalance
	^ self value.! !


!AccountTransaction methodsFor: 'initializitation' stamp: 'LWC 11/28/2021 17:56:03'!
initializeFor: aValue

	self subclassResponsibility.! !

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


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'events-accesing' stamp: 'LWC 11/24/2021 19:32:54'!
affectBalance
	^ self value negated.! !


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

!Portfolio methodsFor: 'initialization' stamp: 'LWC 11/28/2021 18:47:10'!
initialize
	accounts _ OrderedCollection new.! !


!Portfolio methodsFor: 'main protocol' stamp: 'LWC 11/28/2021 20:47:00'!
add: anAsset 
	(self equals: anAsset) ifTrue:[^self error: self class ErrorCanNotAddSelfObjectPortfolio].
	(self hasAccount: anAsset) ifTrue:[^self error: self class ErrorCanNotAddDuplicateObjectPortfolio].
	accounts add: anAsset.! !

!Portfolio methodsFor: 'main protocol' stamp: 'LWC 11/28/2021 20:51:49'!
balance
	^accounts sum: [:anAsset | anAsset balance] ifEmpty: [0].! !

!Portfolio methodsFor: 'main protocol' stamp: 'LWC 11/28/2021 20:46:53'!
equals: anAsset 
	^self == anAsset.! !

!Portfolio methodsFor: 'main protocol' stamp: 'LWC 11/28/2021 20:51:35'!
hasAccount: aReceptiveAccount 
	
	| existAccount |
	existAccount _ false.
	accounts do: [:anAsset | 
		(anAsset isKindOf: Portfolio) ifTrue:[existAccount _ anAsset hasAccount: aReceptiveAccount].
		(anAsset equals: aReceptiveAccount) ifTrue: [^existAccount _ true.].
	].
	^existAccount.! !

!Portfolio methodsFor: 'main protocol' stamp: 'LWC 11/28/2021 21:13:09'!
hasAnyAccountATransaction
	
	| existTransaction |
	existTransaction _ false.
	accounts do: [:anAsset | 
		(anAsset isKindOf: Portfolio) ifTrue:[existTransaction _ anAsset hasAnyAccountATransaction].
		(anAsset isKindOf: ReceptiveAccount) ifTrue: [
			(anAsset transactions isEmpty) ifFalse: [^existTransaction _ true.].
		].
	].
	^existTransaction.! !

!Portfolio methodsFor: 'main protocol' stamp: 'LWC 11/28/2021 20:51:19'!
transactionsOfAccount: aReceptiveAccount 
	| transactions |
	transactions _ OrderedCollection new.
	(self hasAccount: aReceptiveAccount) 
		ifTrue: [transactions _ aReceptiveAccount transactions].
	^transactions.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'LWC 11/28/2021 20:20:14'!
ErrorCanNotAddDuplicateObjectPortfolio
	^'No se puede anadir un portfolio duplicado.'.! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'LWC 11/28/2021 20:20:38'!
ErrorCanNotAddSelfObjectPortfolio
	^'No se puede anadir a si mismo el mismo portafolio'.! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LWC 11/28/2021 20:52:29'!
balance
	^transactions sum: [ :aTransaction | aTransaction affectBalance] ifEmpty: [0]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'LWC 11/28/2021 20:48:14'!
equals: aReceptiveAccount
	^self == aReceptiveAccount.! !

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

!Transfer methodsFor: 'initialization' stamp: 'AR 11/25/2021 20:54:07'!
initializeWithTransferDeposit: aTransferDeposit and: aTransferWithdraw ForAmountOf: aMoney.

	value := aMoney.
	
	transferDepositLeg := aTransferDeposit.
	
	transferWithdrawLeg := aTransferWithdraw.
	
	
	

	! !


!Transfer methodsFor: 'accessing' stamp: 'LWC 11/28/2021 18:12:34'!
depositLeg
	^ transferDepositLeg.
	! !

!Transfer methodsFor: 'accessing' stamp: 'LWC 11/24/2021 21:59:41'!
value
	^ value.
	! !

!Transfer methodsFor: 'accessing' stamp: 'LWC 11/28/2021 18:12:46'!
withdrawLeg
	^ transferWithdrawLeg.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'LWC 11/28/2021 18:29:25'!
From: anOriginAccount To: aDestinyAccount ForAnAMountOf: aMoney
	
	|aTransferDeposit aTransferWithdraw|
	
	(aMoney <= (0*peso)) ifTrue: [^	self error: self TransferErrorAmountInvalid.].
	
	aTransferDeposit := TransferDeposit for: aMoney of: self.
	
	aTransferWithdraw := TransferWithdraw for: aMoney of: self.
	
	anOriginAccount register: aTransferDeposit.
	
	aDestinyAccount register: aTransferWithdraw.
	
	self new.

	^self new initializeWithTransferDeposit: aTransferDeposit and: aTransferWithdraw ForAmountOf: aMoney.
 ! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'LWC 11/28/2021 18:27:28'!
TransferErrorAmountInvalid
	
	^'No puedes enviar saldo negativo'.! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferLeg methodsFor: 'initialization' stamp: 'LWC 11/28/2021 17:59:50'!
initializeFor: aValue of: aTransfer	
	self subclassResponsibility.! !


!TransferLeg methodsFor: 'accessing' stamp: 'LWC 11/28/2021 17:58:28'!
affectBalance
	self subclassResponsibility.! !

!TransferLeg methodsFor: 'accessing' stamp: 'LWC 11/28/2021 17:59:46'!
otherTransferLeg
	self subclassResponsibility.! !

!TransferLeg methodsFor: 'accessing' stamp: 'LWC 11/28/2021 17:59:43'!
value
	self subclassResponsibility.! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
TransferLeg subclass: #TransferDeposit
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'initialization' stamp: 'AR 11/25/2021 20:37:15'!
initializeFor: aValue of: aTransfer

	value := aValue.
	transfer := aTransfer. 
! !


!TransferDeposit methodsFor: 'accessing' stamp: 'AR 11/25/2021 21:00:41'!
affectBalance
	^ self value negated.! !

!TransferDeposit methodsFor: 'accessing' stamp: 'LWC 11/28/2021 18:18:39'!
otherTransferLeg

	^ transfer withdrawLeg.! !

!TransferDeposit methodsFor: 'accessing' stamp: 'AR 11/25/2021 20:30:21'!
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
TransferLeg subclass: #TransferWithdraw
	instanceVariableNames: 'value transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'accessing' stamp: 'AR 11/25/2021 20:28:41'!
affectBalance
	^ self value.! !

!TransferWithdraw methodsFor: 'accessing' stamp: 'LWC 11/28/2021 18:18:46'!
otherTransferLeg

	^ transfer depositLeg.! !

!TransferWithdraw methodsFor: 'accessing' stamp: 'AR 11/25/2021 20:30:31'!
value

	^ value! !


!TransferWithdraw methodsFor: 'initialization' stamp: 'AR 11/25/2021 20:37:51'!
initializeFor: aValue of: aTransfer

	value := aValue.
	transfer := aTransfer. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'AR 11/25/2021 20:36:02'!
for: aValue of: aTransfer

	^ self new initializeFor: aValue of: aTransfer.! !
