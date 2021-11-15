!classDefinition: #TestEjeMarsRover category: 'TDD'!
TestCase subclass: #TestEjeMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD'!

!TestEjeMarsRover methodsFor: 'testing' stamp: 'LWC 11/15/2021 15:48:33'!
test01AlInstanciarUnEjeDelMarsRoverIncorrectoInstanciaPorDefectoElEjeDelNorte
	
	| ejeMarsRover cardinalidadErronea cardinalidadEsperada | 
	cardinalidadErronea _ 'Prueba'.
	cardinalidadEsperada _ 'Norte'.
	ejeMarsRover _ EjeMarsRover newWith: cardinalidadErronea.
	
	self assert: ejeMarsRover value equals: cardinalidadEsperada.! !

!TestEjeMarsRover methodsFor: 'testing' stamp: 'LWC 11/15/2021 15:48:33'!
test02AlInstanciarUnEjeDelMarsRoverCorrectoInstanciaCorrectamente
	
	| ejeMarsRover cardinalidadEsperada | 
	cardinalidadEsperada _ 'Sur'.
	ejeMarsRover _ EjeMarsRover newWith: cardinalidadEsperada.
	
	self assert: ejeMarsRover value equals: cardinalidadEsperada.! !


!classDefinition: #TestMarsRover category: 'TDD'!
TestCase subclass: #TestMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD'!

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 13:57:41'!
test01AlInstanciarUnMarsRoversLaCoordenadaPorDefectoEsLaCeroCeroYSuCardinalidadApuntaAlNorte
	|marsRover posicionEsperada cardinalidadEsperada |
	marsRover _ MarsRover new.
	posicionEsperada _ (0 @ 0).
	cardinalidadEsperada _ 'Norte'.
	
	self assert: marsRover coordenadasActuales equals: posicionEsperada.
	self assert: marsRover cardinalidadActual equals: cardinalidadEsperada.! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 14:14:09'!
test02SiRotoElMarsRover2VecesALaIzquierdaCambiaDeCardinalidad
	|marsRover posicionEsperada cardinalidadEsperada |
	marsRover _ MarsRover new.
	posicionEsperada _ (0 @ 0).
	cardinalidadEsperada _ 'Sur'.
	
	marsRover rotarALaIzquierda.
	marsRover rotarALaIzquierda.
	
	self assert: marsRover coordenadasActuales equals: posicionEsperada.
	self assert: marsRover cardinalidadActual equals: cardinalidadEsperada.! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 14:14:31'!
test03SiRotoElMarsRover4VecesALaDerechaVuelvoAlaMismaCardinalidadInicial
	|marsRover posicionEsperada cardinalidadEsperada |
	marsRover _ MarsRover new.
	posicionEsperada _ (0 @ 0).
	cardinalidadEsperada _ 'Norte'.
	
	marsRover rotarALaDerecha.
	marsRover rotarALaDerecha.
	marsRover rotarALaDerecha.
	marsRover rotarALaDerecha.
	
	self assert: marsRover coordenadasActuales equals: posicionEsperada.
	self assert: marsRover cardinalidadActual equals: cardinalidadEsperada.! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 16:05:27'!
test04SiMuevoHaciaAtrasUnMarsRoverSeMueveCorrectamente
	| unMarsRover coordenadaEsperada |
	unMarsRover _ MarsRover new.
	coordenadaEsperada _ (0 @ -3).
	unMarsRover moverHaciaAtras.
	unMarsRover moverHaciaAtras.
	unMarsRover moverHaciaAtras.
	
	self assert: unMarsRover coordenadasActuales equals: coordenadaEsperada.! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 16:06:01'!
test05SiMuevoHaciaAdelanteUnMarsRoverSeMueveCorrectamente
	| unMarsRover coordenadaEsperada |
	unMarsRover _ MarsRover new.
	coordenadaEsperada _ (0 @ 3).
	unMarsRover moverHaciaAdelante.
	unMarsRover moverHaciaAdelante.
	unMarsRover moverHaciaAdelante.
	
	self assert: unMarsRover coordenadasActuales equals: coordenadaEsperada.! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 16:06:08'!
test06SiRotoElMarsRoverYSeMueveHaciaAdelanteSeMueveEnLaDireccionCorrectamente
	|marsRover posicionEsperada cardinalidadEsperada |
	marsRover _ MarsRover new.
	posicionEsperada _ (1 @ 0).
	cardinalidadEsperada _ 'Este'.
	
	marsRover rotarALaDerecha.
	marsRover moverHaciaAdelante.
	
	self assert: marsRover coordenadasActuales equals: posicionEsperada.
	self assert: marsRover cardinalidadActual equals: cardinalidadEsperada.! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 16:06:17'!
test07SiRotoElMarsRoverYSeMueveHaciaAtrasSeMueveEnLaDireccionCorrecta
	|marsRover posicionEsperada cardinalidadEsperada |
	marsRover _ MarsRover new.
	posicionEsperada _ (-1 @ 0).
	cardinalidadEsperada _ 'Este'.
	
	marsRover rotarALaDerecha.
	marsRover moverHaciaAtras.
	
	self assert: marsRover coordenadasActuales equals: posicionEsperada.
	self assert: marsRover cardinalidadActual equals: cardinalidadEsperada.! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 16:06:39'!
test08AlInstanciarUnMarsRoversEnUnaCoordenadaYCardinalidadEspecificadaLoInstanciaCorrectamente
	| aCardinality aPoint marsRover |
	aCardinality _ 'Sur'.
	aPoint _ (10 @ 10).
	
	marsRover _ MarsRover newWithCoordinates: aPoint andCardinalityTo: aCardinality.
	
	self assert: marsRover coordenadasActuales equals: aPoint.
	self assert: marsRover cardinalidadActual equals: aCardinality.! !

!TestMarsRover methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 16:15:45'!
test09UnMarsRoverProcesaLosComandosQueLeHanEnviado

	| comandoAEnviar marsRover coordenadasEsperadas |
	comandoAEnviar _ 'fffb'.
	coordenadasEsperadas _ (0 @ 2).
	marsRover _ MarsRover new.
	
	marsRover procesar: comandoAEnviar.
	
	self assert: marsRover coordenadasActuales equals: coordenadasEsperadas. ! !


!classDefinition: #EjeMarsRover category: 'TDD'!
Object subclass: #EjeMarsRover
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD'!

!EjeMarsRover methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:11:30'!
RotarALaDerecha: unMarsRover
	self subclassResponsibility.
! !

!EjeMarsRover methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:41:04'!
RotarALaIzquierda: unMarsRover
	self subclassResponsibility.
! !

!EjeMarsRover methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:57:15'!
moverAdelante: unMarsRover
	self subclassResponsibility.
! !

!EjeMarsRover methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:58:28'!
moverAtras: unMarsRover
	self subclassResponsibility.
! !

!EjeMarsRover methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:21:24'!
value
	self subclassResponsibility.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EjeMarsRover class' category: 'TDD'!
EjeMarsRover class
	instanceVariableNames: ''!

!EjeMarsRover class methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:06:16'!
canInstanceWith: aCardinality
	self subclassResponsibility.! !

!EjeMarsRover class methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:48:53'!
newWith: aCardinality
	| subclass |
	subclass _ self subclasses detect: [ :aSubClass | aSubClass  canInstanceWith: aCardinality]		ifNone: [^subclass _ EjeNorte new].
	^subclass new.! !


!classDefinition: #EjeEste category: 'TDD'!
EjeMarsRover subclass: #EjeEste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD'!

!EjeEste methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:11:30'!
RotarALaDerecha: unMarsRover
	^ unMarsRover rotarALaDerechaDesdeElEste.
! !

!EjeEste methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:43:07'!
RotarALaIzquierda: unMarsRover
	^ unMarsRover rotarALaIzquierdaDesdeElEste.
! !

!EjeEste methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:55:51'!
moverAdelante: unMarsRover
	^ unMarsRover moverAdelanteDesdeElEste.
! !

!EjeEste methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:57:46'!
moverAtras: unMarsRover
	^ unMarsRover moverAtrasDesdeElEste.
! !

!EjeEste methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:20:46'!
value
	^'Este'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EjeEste class' category: 'TDD'!
EjeEste class
	instanceVariableNames: ''!

!EjeEste class methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:06:53'!
canInstanceWith: aCardinality
	^aCardinality = 'Este'.! !


!classDefinition: #EjeNorte category: 'TDD'!
EjeMarsRover subclass: #EjeNorte
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD'!

!EjeNorte methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:11:30'!
RotarALaDerecha: unMarsRover
	^ unMarsRover rotarALaDerechaDesdeElNorte.
! !

!EjeNorte methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:43:25'!
RotarALaIzquierda: unMarsRover
	^ unMarsRover rotarALaIzquierdaDesdeElNorte.
! !

!EjeNorte methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:56:30'!
moverAdelante: unMarsRover
	^ unMarsRover moverAdelanteDesdeElNorte.
! !

!EjeNorte methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:57:56'!
moverAtras: unMarsRover
	^ unMarsRover moverAtrasDesdeElNorte.
! !

!EjeNorte methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:20:33'!
value
	^'Norte'
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EjeNorte class' category: 'TDD'!
EjeNorte class
	instanceVariableNames: ''!

!EjeNorte class methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:07:21'!
canInstanceWith: aCardinality
	^aCardinality = 'Norte'.! !


!classDefinition: #EjeOeste category: 'TDD'!
EjeMarsRover subclass: #EjeOeste
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD'!

!EjeOeste methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:11:30'!
RotarALaDerecha: unMarsRover
	^ unMarsRover rotarALaDerechaDesdeElOeste.
! !

!EjeOeste methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:43:38'!
RotarALaIzquierda: unMarsRover
	^ unMarsRover rotarALaIzquierdaDesdeElOeste.

! !

!EjeOeste methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:56:39'!
moverAdelante: unMarsRover
	^ unMarsRover moverAdelanteDesdeElOeste.

! !

!EjeOeste methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:58:05'!
moverAtras: unMarsRover
	^ unMarsRover moverAtrasDesdeElOeste.


! !

!EjeOeste methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:20:54'!
value
	^'Oeste'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EjeOeste class' category: 'TDD'!
EjeOeste class
	instanceVariableNames: ''!

!EjeOeste class methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:07:28'!
canInstanceWith: aCardinality
	^aCardinality = 'Oeste'.! !


!classDefinition: #EjeSur category: 'TDD'!
EjeMarsRover subclass: #EjeSur
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD'!

!EjeSur methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:11:30'!
RotarALaDerecha: unMarsRover
	^ unMarsRover rotarALaDerechaDesdeElSur.
! !

!EjeSur methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:43:50'!
RotarALaIzquierda: unMarsRover
	^ unMarsRover rotarALaIzquierdaDesdeElSur.
! !

!EjeSur methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:56:55'!
moverAdelante: unMarsRover
	^ unMarsRover moverAdelanteDesdeElSur.! !

!EjeSur methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:58:15'!
moverAtras: unMarsRover
	^ unMarsRover moverAtrasDesdeElSur.
! !

!EjeSur methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:21:06'!
value
	^'Sur'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'EjeSur class' category: 'TDD'!
EjeSur class
	instanceVariableNames: ''!

!EjeSur class methodsFor: 'as yet unclassified' stamp: 'LWC 11/15/2021 15:07:40'!
canInstanceWith: aCardinality
	^aCardinality = 'Sur'.! !


!classDefinition: #MarsRover category: 'TDD'!
Object subclass: #MarsRover
	instanceVariableNames: 'coordenadas ejeMarsRover acciones'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD'!

!MarsRover methodsFor: 'accessing' stamp: 'LWC 11/15/2021 15:44:38'!
cardinalidadActual
	^ejeMarsRover value.! !

!MarsRover methodsFor: 'accessing' stamp: 'LWC 11/15/2021 12:40:13'!
coordenadasActuales
	^coordenadas.! !

!MarsRover methodsFor: 'accessing' stamp: 'LWC 11/15/2021 16:32:22'!
procesar: unComando
	1 to: unComando size do: [:index |  acciones at: (unComando at: index)].! !


!MarsRover methodsFor: 'initialization' stamp: 'LWC 11/15/2021 16:14:59'!
initialize
	coordenadas _ (0 @ 0).
	ejeMarsRover _ EjeNorte new.
	acciones _ Dictionary new.
	acciones at: 'f' put: self moverHaciaAdelante.
	acciones at: 'b' put: self moverHaciaAtras.
	acciones at: 'l' put: self rotarALaIzquierda.
	acciones at: 'r' put: self rotarALaDerecha.! !

!MarsRover methodsFor: 'initialization' stamp: 'LWC 11/15/2021 16:30:04'!
initializeWithCoordinates: aPoint andCardinality: aCardinality
	coordenadas _	aPoint.
	ejeMarsRover _ aCardinality.
	acciones _ Dictionary new.
	acciones at: 'f' put: self moverHaciaAdelante.
	acciones at: 'b' put: self moverHaciaAtras.
	acciones at: 'l' put: self rotarALaIzquierda.
	acciones at: 'r' put: self rotarALaDerecha.! !


!MarsRover methodsFor: 'events' stamp: 'LWC 11/15/2021 16:03:17'!
moverHaciaAdelante
	ejeMarsRover moverAdelante: self.! !

!MarsRover methodsFor: 'events' stamp: 'LWC 11/15/2021 16:02:58'!
moverHaciaAtras
	ejeMarsRover moverAtras: self.
	! !

!MarsRover methodsFor: 'events' stamp: 'LWC 11/15/2021 15:51:27'!
rotarALaDerecha
	ejeMarsRover RotarALaDerecha: self.! !

!MarsRover methodsFor: 'events' stamp: 'LWC 11/15/2021 15:51:56'!
rotarALaIzquierda
	ejeMarsRover RotarALaIzquierda: self.! !


!MarsRover methodsFor: 'private - movement' stamp: 'LWC 11/15/2021 15:53:51'!
moverAdelanteDesdeElEste
	coordenadas _ coordenadas + (1 @ 0).
! !

!MarsRover methodsFor: 'private - movement' stamp: 'LWC 11/15/2021 15:53:15'!
moverAdelanteDesdeElNorte
	coordenadas _ coordenadas + (0 @ 1).
! !

!MarsRover methodsFor: 'private - movement' stamp: 'LWC 11/15/2021 15:54:12'!
moverAdelanteDesdeElOeste
	coordenadas _ coordenadas + (-1 @ 0).
! !

!MarsRover methodsFor: 'private - movement' stamp: 'LWC 11/15/2021 15:54:05'!
moverAdelanteDesdeElSur
	coordenadas _ coordenadas + (0 @ -1).
! !

!MarsRover methodsFor: 'private - movement' stamp: 'LWC 11/15/2021 15:54:44'!
moverAtrasDesdeElEste
	coordenadas _ coordenadas + (-1 @ 0).
! !

!MarsRover methodsFor: 'private - movement' stamp: 'LWC 11/15/2021 15:54:34'!
moverAtrasDesdeElNorte
	coordenadas _ coordenadas + (0 @ -1).
! !

!MarsRover methodsFor: 'private - movement' stamp: 'LWC 11/15/2021 15:55:00'!
moverAtrasDesdeElOeste
	coordenadas _ coordenadas + (1 @ 0).
! !

!MarsRover methodsFor: 'private - movement' stamp: 'LWC 11/15/2021 15:54:53'!
moverAtrasDesdeElSur
	coordenadas _ coordenadas + (0 @ 1).
! !


!MarsRover methodsFor: 'private - rotations' stamp: 'LWC 11/15/2021 15:49:18'!
rotarALaDerechaDesdeElEste
	^ejeMarsRover _ EjeSur new.
! !

!MarsRover methodsFor: 'private - rotations' stamp: 'LWC 11/15/2021 15:48:43'!
rotarALaDerechaDesdeElNorte
	^ejeMarsRover _ EjeEste new.
! !

!MarsRover methodsFor: 'private - rotations' stamp: 'LWC 11/15/2021 15:48:53'!
rotarALaDerechaDesdeElOeste
	^ejeMarsRover _ EjeNorte new.
! !

!MarsRover methodsFor: 'private - rotations' stamp: 'LWC 11/15/2021 15:49:06'!
rotarALaDerechaDesdeElSur
	^ejeMarsRover _ EjeOeste new.
! !

!MarsRover methodsFor: 'private - rotations' stamp: 'LWC 11/15/2021 15:48:53'!
rotarALaIzquierdaDesdeElEste
	^ejeMarsRover _ EjeNorte new.
! !

!MarsRover methodsFor: 'private - rotations' stamp: 'LWC 11/15/2021 15:49:06'!
rotarALaIzquierdaDesdeElNorte
	^ejeMarsRover _ EjeOeste new.
! !

!MarsRover methodsFor: 'private - rotations' stamp: 'LWC 11/15/2021 15:49:18'!
rotarALaIzquierdaDesdeElOeste
	^ejeMarsRover _ EjeSur new.
! !

!MarsRover methodsFor: 'private - rotations' stamp: 'LWC 11/15/2021 15:48:43'!
rotarALaIzquierdaDesdeElSur
	^ejeMarsRover _ EjeEste new.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'TDD'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'LWC 11/15/2021 15:48:33'!
newWithCoordinates: aPoint andCardinalityTo: aCardinality
	| auxPoint ejeMarsRover |
	(aPoint isPoint) 
		ifTrue: [ auxPoint  _ aPoint]
		ifFalse: [ auxPoint _ (0 @ 0)].
	ejeMarsRover _ EjeMarsRover newWith: aCardinality.
	^self new initializeWithCoordinates: auxPoint andCardinality: ejeMarsRover.! !
