!classDefinition: #CarolinaLaCuranderaDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #CarolinaLaCuranderaDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CarolinaLaCuranderaDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
CarolinaLaCuranderaDeRiverwood class
	instanceVariableNames: 'frasesParaResponderAPersonajesDesconocidos frasesParaResponderAPersonajesPrometedores cantidadDeInteraccionesPorPersonaje reputacionDePersonajes'!

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'PG 10/2/2021 23:42:55'!
interactuarCon: unPersonajeJugador	
	|respuestaAInteraccionDelJugador|
	
	self recordarInteraccionCon: unPersonajeJugador.
	respuestaAInteraccionDelJugador := self responderSegunCantidadDeInteraccionesCon: unPersonajeJugador.
	
	self verificarSiMejoraLaReputacionDe: unPersonajeJugador.
	
	^ respuestaAInteraccionDelJugador
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'PG 10/2/2021 23:27:52'!
olvidar
	cantidadDeInteraccionesPorPersonaje := Dictionary new.	! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 23:40:11'!
modificarCantidadDeInteraccionesDe: unPersonajeJugador	 con: valor	
	cantidadDeInteraccionesPorPersonaje at: unPersonajeJugador put: valor.
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 23:43:40'!
obtenerCantidadDeInteraccionesDe: unPersonajeJugador	
	^cantidadDeInteraccionesPorPersonaje  at: unPersonajeJugador ifAbsent:[0].
	! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 23:45:07'!
recordarInteraccionCon: unPersonajeJugador
	| cantidadInteracciones |	
	cantidadInteracciones := self obtenerCantidadDeInteraccionesDe: unPersonajeJugador.
	self modificarCantidadDeInteraccionesDe: unPersonajeJugador con: cantidadInteracciones +1.	
	
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 23:10:58'!
reiniciarCantidadDeInteraccionesDe: unPersonajeJugador	
	cantidadDeInteraccionesPorPersonaje at: unPersonajeJugador put: 0.
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 21:01:21'!
responderAJugadoresDesconocidosSegunCantidadDeInteracciones: cantidadDeInteracciones
	^frasesParaResponderAPersonajesDesconocidos at: (cantidadDeInteracciones min: frasesParaResponderAPersonajesDesconocidos size).! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 21:02:14'!
responderAJugadoresPrometedoresSegunCantidadDeInteracciones: cantidadDeInteracciones
	^frasesParaResponderAPersonajesPrometedores at: (cantidadDeInteracciones min: frasesParaResponderAPersonajesPrometedores size).! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 23:09:59'!
responderSegunCantidadDeInteraccionesCon: unPersonajeJugador
	| cantidadInteracciones |
	cantidadInteracciones := self obtenerCantidadDeInteraccionesDe: unPersonajeJugador.
	
	(PuebloDeRiverwood esPersonajePrometedor: unPersonajeJugador) ifTrue: [
		^self responderAJugadoresPrometedoresSegunCantidadDeInteracciones: cantidadInteracciones.]
	ifFalse: [		
		^self responderAJugadoresDesconocidosSegunCantidadDeInteracciones: cantidadInteracciones.]! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 23:26:47'!
verificarSiMejoraLaReputacionDe: unPersonajeJugador	
	| interaccionesDelJugador |
	interaccionesDelJugador := self obtenerCantidadDeInteraccionesDe: unPersonajeJugador.
	
	(interaccionesDelJugador = frasesParaResponderAPersonajesDesconocidos size) ifTrue: [		
		PuebloDeRiverwood cambiarReputacionDePersonajeDesconocidoAPrometedor: unPersonajeJugador.
		PuebloDeRiverwood reiniciarCantidadDeInteraccionesDe: unPersonajeJugador.
		]
! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'PG 10/2/2021 23:53:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaResponderAPersonajesDesconocidos := #('¿Estás enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicción, ven a verme' ).
	frasesParaResponderAPersonajesPrometedores := #('Salud aventurero!!' 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme' ).
	cantidadDeInteraccionesPorPersonaje := ((Dictionary new) add: (#Hamilton->0); yourself).
	reputacionDePersonajes := ((Dictionary new) add: (#Hamilton->1); yourself).! !


!classDefinition: #PruebasInteracionesConCarolinaLaCurandera category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConCarolinaLaCurandera
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConCarolinaLaCurandera class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConCarolinaLaCurandera class
	instanceVariableNames: ''!

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:36'!
test01CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:48:37'!
test02CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Ah, solo quieres conversar'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 12:49:16'!
test03CuandoLaCuranderaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicción, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '¿Estás enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '¿Estás enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicción, ven a verme'.
	! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:32'!
test06CuandoLaCuranderaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |	
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Salud aventurero!!'.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:50:39'!
test07CuandoLaCuranderaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.
	
	mensaje := self carolinaLaCurandera interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Toma esta pócima que te hará crecer el pelo. Y cuando tengas una aflicción, ven a verme'.
! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:50:52'!
test08CuandoLaCuranderaTerminaSuRepertorioDeFrasesConUnPersonajeCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedor
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert isTrue: (self esVistoPorElPuebloComoPrometedor: self hamilton).! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:00'!
test09CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaSuHiloDeDialogoConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	
	
	Assert that: 'Salud aventurero!!' isEqualTo: (self carolinaLaCurandera interactuarCon: self hamilton)! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'cambio de opiniones' stamp: 'JMB 9/25/2021 12:51:06'!
test10CuandoLaCuranderaCambiaLaOpinionDelPuebloSobreElPersonajeAPrometedorReiniciaElHiloDeDialogoDelGuardiaConElPersonaje
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	self carolinaLaCurandera interactuarCon: self hamilton.
	self carolinaLaCurandera interactuarCon: self hamilton.	
	self carolinaLaCurandera interactuarCon: self hamilton.	

	Assert that: 'Bienvenido aventurero!!' isEqualTo: (self treborElGuardia interactuarCon: self hamilton)! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'PG 10/2/2021 19:26:27'!
carolinaLaCurandera
	^CarolinaLaCuranderaDeRiverwood! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'PG 10/2/2021 19:25:52'!
hamilton
	^#Hamilton.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'PG 10/2/2021 19:26:03'!
tirion
	^#Tirion.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:52:20'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'PG 10/2/2021 23:23:30'!
esVistoPorElPuebloComoPrometedor: unPersonajeJugador	 
	^(PuebloDeRiverwood esPersonajePrometedor: unPersonajeJugador)
	! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'PG 10/2/2021 20:38:49'!
hacerQueLaCuranderaOlvideSusInteracciones
	CarolinaLaCuranderaDeRiverwood olvidar.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'PG 10/2/2021 20:42:09'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloDeRiverwood olvidarReputacion.
	! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'PG 10/2/2021 23:19:08'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PuebloDeRiverwood cambiarReputacionDePersonajeDesconocidoAPrometedor: #Hamilton.
! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:48:36'!
olvidarInteraccionesYOpiniones
	self hacerQueLaCuranderaOlvideSusInteracciones.	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PruebasInteracionesConTreborElGuardia category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PruebasInteracionesConTreborElGuardia
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasInteracionesConTreborElGuardia class' category: 'Ejercicio1-PNJ-Episodio2'!
PruebasInteracionesConTreborElGuardia class
	instanceVariableNames: ''!

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:03:53'!
test01CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:08'!
test02CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Todo bien?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:25'!
test03CuandoElGuardiaOlvidaInteraccionesPreviasConUnPersonajeAlVolverAInteractuarLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia olvidar.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:35'!
test04CuandoElGuardiaInteractuaPorTerceraVezConUnPersonajeLeRespondeConSuTercerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '¿Algún problema?'.! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:36'!
test06ElGuardiaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.

	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:53:43'!
test07ElGuardiaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: 'Hola forastero'.
	
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: 'Hola forastero'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '¿Algún problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '¿Algún problema?'.
	! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:54:46'!
test08CuandoElGuardiaInteractuaPorPrimeraVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuPrimerFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Bienvenido aventurero!!'.
! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con personajes prometedores' stamp: 'JMB 9/25/2021 12:55:02'!
test09CuandoElGuardiaInteractuaPorSegundaVezConUnPersonajeCalificadoPorElPuebloComoPrometedorLeRespondeConSuSegundaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self hacerQueRiverwoodVeaPrometedorAHamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: 'Espero que tengas una buena estadia en Riverwood'.
! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'PG 10/2/2021 17:20:40'!
hamilton
	^#Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'LWC 9/28/2021 20:30:15'!
tirion
	^#Tirion.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'personajes' stamp: 'JMB 9/21/2021 20:42:44'!
treborElGuardia
	^ TreborElGuardiaDeSkyrim ! !


!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'PG 10/2/2021 20:32:37'!
hacerQueElGuardiaOlvideSusInteracciones
	TreborElGuardiaDeSkyrim olvidar.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'PG 10/2/2021 20:24:32'!
hacerQueRiverwoodOlvideTodasSusCalificaciones
	PuebloDeRiverwood olvidarReputacion.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'PG 10/2/2021 23:17:03'!
hacerQueRiverwoodVeaPrometedorAHamilton
	PuebloDeRiverwood cambiarReputacionDePersonajeDesconocidoAPrometedor: #Hamilton.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'opiniones e interacciones' stamp: 'JMB 9/25/2021 12:52:12'!
olvidarInteraccionesYOpiniones
	self hacerQueElGuardiaOlvideSusInteracciones. 	
	self hacerQueRiverwoodOlvideTodasSusCalificaciones.
! !


!classDefinition: #PuebloDeRiverwood category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #PuebloDeRiverwood
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PuebloDeRiverwood class' category: 'Ejercicio1-PNJ-Episodio2'!
PuebloDeRiverwood class
	instanceVariableNames: 'reputacionDePersonajes'!

!PuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'PG 10/2/2021 23:16:25'!
cambiarReputacionDePersonajeDesconocidoAPrometedor: unPersonajeJugador
	reputacionDePersonajes at: unPersonajeJugador put: 'Prometedor'.
	! !

!PuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'PG 10/2/2021 22:42:52'!
esPersonajePrometedor: unPersonajeJugador
	^((self obtenerReputacionDe: unPersonajeJugador) = 'Prometedor').! !

!PuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'PG 10/2/2021 22:40:35'!
obtenerReputacionDe: unPersonajeJugador
	^reputacionDePersonajes  at: unPersonajeJugador ifAbsent: ['Desconocido'].! !

!PuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'PG 10/2/2021 20:13:12'!
olvidarReputacion	
	reputacionDePersonajes  := Dictionary new.! !

!PuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'PG 10/2/2021 23:21:26'!
reiniciarCantidadDeInteraccionesDe: unPersonajeJugador	
	CarolinaLaCuranderaDeRiverwood reiniciarCantidadDeInteraccionesDe: unPersonajeJugador.
	TreborElGuardiaDeSkyrim reiniciarCantidadDeInteraccionesDe: unPersonajeJugador.! !


!PuebloDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'PG 10/2/2021 23:53:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	reputacionDePersonajes := ((Dictionary new) add: (#Hamilton->'Prometedor'); yourself).! !


!classDefinition: #TreborElGuardiaDeSkyrim category: 'Ejercicio1-PNJ-Episodio2'!
DenotativeObject subclass: #TreborElGuardiaDeSkyrim
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio1-PNJ-Episodio2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TreborElGuardiaDeSkyrim class' category: 'Ejercicio1-PNJ-Episodio2'!
TreborElGuardiaDeSkyrim class
	instanceVariableNames: 'frasesParaResponderAPersonajesDesconocidos frasesParaResponderAPersonajesPrometedores cantidadDeInteraccionesPorPersonaje'!

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'PG 10/2/2021 20:27:05'!
interactuarCon: unPersonajeJugador
	self recordarInteraccionCon: unPersonajeJugador.
	^ self responderSegunCantidadDeInteraccionesCon: unPersonajeJugador.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'PG 10/2/2021 23:28:20'!
olvidar
	cantidadDeInteraccionesPorPersonaje := Dictionary new.! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 23:39:18'!
modificarCantidadDeInteraccionesDe: unPersonajeJugador	 con: valor	
	cantidadDeInteraccionesPorPersonaje at: unPersonajeJugador put: valor.
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 22:51:39'!
obtenerCantidadDeInteraccionesDe: unPersonajeJugador	
	^cantidadDeInteraccionesPorPersonaje at: unPersonajeJugador ifAbsent: [0].
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 23:39:47'!
recordarInteraccionCon: unPersonajeJugador	
	| cantidadInteracciones |
	cantidadInteracciones := self obtenerCantidadDeInteraccionesDe: unPersonajeJugador.		
	self modificarCantidadDeInteraccionesDe: unPersonajeJugador con: cantidadInteracciones +1.	
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 23:13:50'!
reiniciarCantidadDeInteraccionesDe: unPersonajeJugador	
	cantidadDeInteraccionesPorPersonaje at: unPersonajeJugador put: 0.
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 23:04:26'!
responderAJugadoresDesconocidosSegunCantidadDeInteracciones: cantidadDeInteracciones
	^frasesParaResponderAPersonajesDesconocidos at: (cantidadDeInteracciones min: frasesParaResponderAPersonajesDesconocidos size).! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 23:04:38'!
responderAJugadoresPrometedoresSegunCantidadDeInteracciones: cantidadDeInteracciones
	^frasesParaResponderAPersonajesPrometedores at: (cantidadDeInteracciones min: frasesParaResponderAPersonajesPrometedores size).! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 23:05:14'!
responderSegunCantidadDeInteraccionesCon: unPersonajeJugador
	| cantidadInteracciones |
	cantidadInteracciones := cantidadDeInteraccionesPorPersonaje  at: unPersonajeJugador.	
	
	(PuebloDeRiverwood esPersonajePrometedor: unPersonajeJugador) ifTrue:  [
		^self responderAJugadoresPrometedoresSegunCantidadDeInteracciones: cantidadInteracciones.]
	ifFalse: [		
		^self responderAJugadoresDesconocidosSegunCantidadDeInteracciones: cantidadInteracciones.].! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'PG 10/2/2021 23:53:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaResponderAPersonajesDesconocidos := #('Hola forastero' '¿Todo bien?' '¿Algún problema?' ).
	frasesParaResponderAPersonajesPrometedores := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	cantidadDeInteraccionesPorPersonaje := ((Dictionary new) add: (#Hamilton->1); add: (#Tirion->0); yourself).! !

CarolinaLaCuranderaDeRiverwood initializeAfterFileIn!
PuebloDeRiverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!