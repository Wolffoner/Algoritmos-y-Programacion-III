!classDefinition: #TestXXX category: 'TDD'!
TestCase subclass: #TestXXX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD'!

!TestXXX methodsFor: 'as yet unclassified' stamp: 'AR 11/13/2021 19:59:48'!
test01

	|marsRover unPuntoCardinal |
	
	marsRover := MarsRover new.
	
	unPuntoCardinal := 'Norte'.

	self assert: (marsRover aQuePuntoCardinalApunta =  unPuntoCardinal).! !

!TestXXX methodsFor: 'as yet unclassified' stamp: 'AR 11/13/2021 19:33:46'!
test02

	|marsRover unPuntoCardinal |
	
	marsRover := MarsRover new.
	
	unPuntoCardinal := 'Casa'.

	self deny: (marsRover aQuePuntoCardinalApunta: unPuntoCardinal).! !

!TestXXX methodsFor: 'as yet unclassified' stamp: 'AR 11/13/2021 19:44:37'!
test03
	
	| marsRover |
	
	marsRover := MarsRover new.

	self assert: (marsRover enQueLatitudEstoy =  0 ).! !

!TestXXX methodsFor: 'as yet unclassified' stamp: 'AR 11/13/2021 19:53:08'!
test04
	
	| marsRover |
	
	marsRover := MarsRover new.

	self assert: (marsRover enQueLongitudEstoy =  0 ).! !

!TestXXX methodsFor: 'as yet unclassified' stamp: 'AR 11/13/2021 20:07:36'!
test05
	
	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover avanzarUnPaso. 

	self assert: (marsRover enQueLatitudEstoy =  1 ).! !

!TestXXX methodsFor: 'as yet unclassified' stamp: 'AR 11/13/2021 20:11:41'!
test06
	
	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover retrocederUnPaso. 

	self assert: (marsRover enQueLatitudEstoy =  -1 ).! !

!TestXXX methodsFor: 'as yet unclassified' stamp: 'AR 11/13/2021 20:19:33'!
test07
	
	| marsRover |
	
	marsRover := MarsRover new.
	
	marsRover girarALaDerecha. 

	self assert: (marsRover aDondeEstoyApuntando =  'Este' ).! !


!classDefinition: #MarsRover category: 'TDD'!
Object subclass: #MarsRover
	instanceVariableNames: 'puntosCardinales norte este sur oeste latitudDelMarsRover longitudDelMarsRover direccionApuntada'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD'!

!MarsRover methodsFor: 'YYY' stamp: 'AR 11/13/2021 19:59:10'!
aQuePuntoCardinalApunta
	^direccionApuntada ! !

!MarsRover methodsFor: 'YYY' stamp: 'AR 11/13/2021 19:32:54'!
aQuePuntoCardinalApunta: unPuntoCardinal 
	^puntosCardinales includes: unPuntoCardinal.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'AR 11/13/2021 20:18:27'!
aDondeEstoyApuntando

	^direccionApuntada .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AR 11/13/2021 20:10:06'!
avanzarUnPaso
	latitudDelMarsRover := latitudDelMarsRover + 1.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AR 11/13/2021 19:52:11'!
enQueLatitudEstoy

	^latitudDelMarsRover .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AR 11/13/2021 19:55:03'!
enQueLongitudEstoy

	^longitudDelMarsRover .! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AR 11/13/2021 20:20:43'!
girarALaDerecha
	direccionApuntada := 'Este'.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AR 11/13/2021 19:57:19'!
initialize

	puntosCardinales := Set new.
	
	norte := 'Norte'.
	
	este := 'Este'.
	
	sur := 'Sur'.
	
	oeste := 'Oeste'.
	
	puntosCardinales add: norte.
	
	puntosCardinales add: este.
	
	puntosCardinales add: sur.
	
	puntosCardinales add: oeste.
	
	direccionApuntada := norte. 
	
	latitudDelMarsRover := 0.
	
	longitudDelMarsRover := 0.! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'AR 11/13/2021 20:12:09'!
retrocederUnPaso
	latitudDelMarsRover := latitudDelMarsRover - 1.! !
