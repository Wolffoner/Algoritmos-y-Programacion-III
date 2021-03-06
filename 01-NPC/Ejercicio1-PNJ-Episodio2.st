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

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'PG 10/3/2021 21:56:30'!
interactuarCon: unPersonajeJugador	
	"El NPC Trebor interactua con un personaje jugador"
	
	|respuestaAInteraccionDelJugador|
	self actualizarCantidadDeInteraccionesCon: unPersonajeJugador.
	respuestaAInteraccionDelJugador := self responderSegunCantidadDeInteraccionesCon: unPersonajeJugador.
	
	self verificarSiMejoraLaReputacionDe: unPersonajeJugador.
	
	^ respuestaAInteraccionDelJugador
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones' stamp: 'PG 10/3/2021 21:57:42'!
olvidar
	"El NPC Trebor olvida todas las interacciones previas con todos los personajes jugadores"
	
	cantidadDeInteraccionesPorPersonaje := Dictionary new.	! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/3/2021 21:54:59'!
actualizarCantidadDeInteraccionesCon: unPersonajeJugador	
	"Aumenta en 1 la cantidad de interacciones con el personaje jugador"
	
	| cantidadInteracciones |	
	cantidadInteracciones := self obtenerCantidadDeInteraccionesDe: unPersonajeJugador.
	self modificarCantidadDeInteraccionesDe: unPersonajeJugador con: cantidadInteracciones +1.	
	
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/3/2021 21:55:09'!
modificarCantidadDeInteraccionesDe: unPersonajeJugador	 con: valor	
	"Modifica la cantidad de interacciones con un personaje jugador con el valor indicado"
	
	cantidadDeInteraccionesPorPersonaje at: unPersonajeJugador put: valor.
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/3/2021 21:55:21'!
obtenerCantidadDeInteraccionesDe: unPersonajeJugador	
	"Retorna la cantidad de interacciones que se tiene con un personaje jugador"
	
	^cantidadDeInteraccionesPorPersonaje  at: unPersonajeJugador ifAbsent:[0].
	! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/3/2021 21:55:34'!
reiniciarCantidadDeInteraccionesDe: unPersonajeJugador	
	"Vuelve a 0 la cantidad de interacciones con el personaje jugador."
	
	cantidadDeInteraccionesPorPersonaje at: unPersonajeJugador put: 0.
! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/3/2021 21:58:00'!
responderAJugadorDesconocidoSegunCantidadDeInteracciones: cantidadDeInteracciones
	"Responde la frase correspondiente a un jugador con reputacion de Desconocido segun su cantidad de interacciones"
	
	^frasesParaResponderAPersonajesDesconocidos at: (cantidadDeInteracciones min: frasesParaResponderAPersonajesDesconocidos size).! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/3/2021 21:58:24'!
responderAJugadorPrometedorSegunCantidadDeInteracciones: cantidadDeInteracciones
	"Responde la frase correspondiente a un jugador con reputacion de Prometedor segun su cantidad de interacciones"
	
	^frasesParaResponderAPersonajesPrometedores at: (cantidadDeInteracciones min: frasesParaResponderAPersonajesPrometedores size).! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/3/2021 21:58:43'!
responderSegunCantidadDeInteraccionesCon: unPersonajeJugador
	"Responde al personaje jugador segun la cantidad de interacciones que haya tenido con el mismo."
	
	| cantidadInteracciones |
	cantidadInteracciones := self obtenerCantidadDeInteraccionesDe: unPersonajeJugador.
	
	(PuebloDeRiverwood esPersonajePrometedor: unPersonajeJugador) ifTrue: [
		^self responderAJugadorPrometedorSegunCantidadDeInteracciones: cantidadInteracciones.]
	ifFalse: [		
		^self responderAJugadorDesconocidoSegunCantidadDeInteracciones: cantidadInteracciones.]! !

!CarolinaLaCuranderaDeRiverwood class methodsFor: 'interacciones - privado' stamp: 'PG 10/2/2021 23:26:47'!
verificarSiMejoraLaReputacionDe: unPersonajeJugador	
	| interaccionesDelJugador |
	interaccionesDelJugador := self obtenerCantidadDeInteraccionesDe: unPersonajeJugador.
	
	(interaccionesDelJugador = frasesParaResponderAPersonajesDesconocidos size) ifTrue: [		
		PuebloDeRiverwood cambiarReputacionDePersonajeDesconocidoAPrometedor: unPersonajeJugador.
		PuebloDeRiverwood reiniciarCantidadDeInteraccionesDe: unPersonajeJugador.
		]
! !


!CarolinaLaCuranderaDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'PG 10/3/2021 22:08:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaResponderAPersonajesDesconocidos := #('�Est�s enfermo forastero?' 'Ah, solo quieres conversar' 'Cuando tengas una aflicci�n, ven a verme' ).
	frasesParaResponderAPersonajesPrometedores := #('Salud aventurero!!' 'Toma esta p�cima que te har� crecer el pelo. Y cuando tengas una aflicci�n, ven a verme' ).
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
	
	Assert that: mensaje isEqualTo: '�Est�s enfermo forastero?'.! !

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
	
	Assert that: mensaje isEqualTo: 'Cuando tengas una aflicci�n, ven a verme'.! !


!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:11'!
test04LaCuranderaMantieneDosInteraccionesConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '�Est�s enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '�Est�s enfermo forastero?'.! !

!PruebasInteracionesConCarolinaLaCurandera class methodsFor: 'interacciones con mas de un personaje' stamp: 'JMB 9/25/2021 12:50:18'!
test05LaCuranderaMantieneDosInteraccionesCompletasConDiferentesPersonajes
	self olvidarInteraccionesYOpiniones.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: '�Est�s enfermo forastero?'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: '�Est�s enfermo forastero?'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self tirion) isEqualTo: 'Cuando tengas una aflicci�n, ven a verme'.
	
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Ah, solo quieres conversar'.
	Assert that: (self carolinaLaCurandera interactuarCon: self hamilton) isEqualTo: 'Cuando tengas una aflicci�n, ven a verme'.
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
	
	Assert that: mensaje isEqualTo: 'Toma esta p�cima que te har� crecer el pelo. Y cuando tengas una aflicci�n, ven a verme'.
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
	
	Assert that: mensaje isEqualTo: '�Todo bien?'.! !

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
	
	Assert that: mensaje isEqualTo: '�Alg�n problema?'.! !

!PruebasInteracionesConTreborElGuardia class methodsFor: 'interacciones con un personaje' stamp: 'JMB 9/25/2021 13:04:44'!
test05CuandoElGuardiaInterctuaYTerminoSuRepertorioDeFrasesConUnPersonajeLeRespondeConSuUltimaFrase
	| mensaje |
	self olvidarInteraccionesYOpiniones.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	self treborElGuardia interactuarCon: self hamilton.
	
	mensaje := self treborElGuardia interactuarCon: self hamilton.
	
	Assert that: mensaje isEqualTo: '�Alg�n problema?'.! !


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
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '�Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self tirion) isEqualTo: '�Alg�n problema?'.
	
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '�Todo bien?'.
	Assert that: (self treborElGuardia interactuarCon: self hamilton) isEqualTo: '�Alg�n problema?'.
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

!PuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'PG 10/3/2021 22:00:16'!
cambiarReputacionDePersonajeDesconocidoAPrometedor: unPersonajeJugador
	"Cambia la reputacion del personaje jugador de Desconocido a Prometedor."
	
	reputacionDePersonajes at: unPersonajeJugador put: 'Prometedor'.
	! !

!PuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'PG 10/3/2021 22:01:22'!
esPersonajePrometedor: unPersonajeJugador
	"Retorna true cuando el personaje jugador es Prometedor y false cuando no lo es."
	
	^((self obtenerReputacionDe: unPersonajeJugador) = 'Prometedor').! !

!PuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'PG 10/3/2021 22:01:59'!
obtenerReputacionDe: unPersonajeJugador
	"Retorna la reputacion de un personaje jugador, la cual puede ser Desconocido o Prometedor."

	^reputacionDePersonajes  at: unPersonajeJugador ifAbsent: ['Desconocido'].! !

!PuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'PG 10/3/2021 22:02:25'!
olvidarReputacion	
	"Olvida todas las reputaciones de todos los personajes jugadores."
	
	reputacionDePersonajes  := Dictionary new.! !

!PuebloDeRiverwood class methodsFor: 'interacciones' stamp: 'PG 10/3/2021 22:02:59'!
reiniciarCantidadDeInteraccionesDe: unPersonajeJugador	
	"Reinicia la cantidad de interacciones de un personaje jugador con todos los NPC del pueblo de Riverwood."
	
	CarolinaLaCuranderaDeRiverwood reiniciarCantidadDeInteraccionesDe: unPersonajeJugador.
	TreborElGuardiaDeSkyrim reiniciarCantidadDeInteraccionesDe: unPersonajeJugador.! !


!PuebloDeRiverwood class methodsFor: 'as yet unclassified' stamp: 'PG 10/3/2021 22:08:41'!
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

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'PG 10/3/2021 21:53:51'!
interactuarCon: unPersonajeJugador
	"El NPC Trebor interactua con un personaje jugador"
	
	self actualizarCantidadDeInteraccionesCon: unPersonajeJugador.
	^ self responderSegunCantidadDeInteraccionesCon: unPersonajeJugador.! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones' stamp: 'PG 10/3/2021 21:54:21'!
olvidar
	"El NPC Trebor olvida todas las interacciones previas con todos los personajes jugadores"
	
	cantidadDeInteraccionesPorPersonaje := Dictionary new.! !


!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'PG 10/3/2021 21:54:27'!
actualizarCantidadDeInteraccionesCon: unPersonajeJugador	
	"Aumenta en 1 la cantidad de interacciones con el personaje jugador"
	
	| cantidadInteracciones |
	cantidadInteracciones := self obtenerCantidadDeInteraccionesDe: unPersonajeJugador.		
	self modificarCantidadDeInteraccionesDe: unPersonajeJugador con: cantidadInteracciones +1.	
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'PG 10/3/2021 21:54:31'!
modificarCantidadDeInteraccionesDe: unPersonajeJugador	 con: valor	
	"Modifica la cantidad de interacciones con un personaje jugador con el valor indicado"
	
	cantidadDeInteraccionesPorPersonaje at: unPersonajeJugador put: valor.
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'PG 10/3/2021 21:54:35'!
obtenerCantidadDeInteraccionesDe: unPersonajeJugador	
	"Retorna la cantidad de interacciones que se tiene con un personaje jugador"
	
	^cantidadDeInteraccionesPorPersonaje at: unPersonajeJugador ifAbsent: [0].
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'PG 10/3/2021 21:54:38'!
reiniciarCantidadDeInteraccionesDe: unPersonajeJugador	
	"Vuelve a 0 la cantidad de interacciones con el personaje jugador."
	
	cantidadDeInteraccionesPorPersonaje at: unPersonajeJugador put: 0.
! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'PG 10/3/2021 21:58:58'!
responderAJugadorDesconocidoSegunCantidadDeInteracciones: cantidadDeInteracciones
	"Responde la frase correspondiente a un jugador con reputacion de Desconocido segun su cantidad de interacciones"
	
	^frasesParaResponderAPersonajesDesconocidos at: (cantidadDeInteracciones min: frasesParaResponderAPersonajesDesconocidos size).! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'PG 10/3/2021 21:59:07'!
responderAJugadorPrometedorSegunCantidadDeInteracciones: cantidadDeInteracciones
	"Responde la frase correspondiente a un jugador con reputacion de Prometedor segun su cantidad de interacciones"
	
	^frasesParaResponderAPersonajesPrometedores at: (cantidadDeInteracciones min: frasesParaResponderAPersonajesPrometedores size).! !

!TreborElGuardiaDeSkyrim class methodsFor: 'interacciones - privado' stamp: 'PG 10/3/2021 21:59:25'!
responderSegunCantidadDeInteraccionesCon: unPersonajeJugador
	"Responde al personaje jugador segun la cantidad de interacciones que haya tenido con el mismo."
	
	| cantidadInteracciones |
	cantidadInteracciones := cantidadDeInteraccionesPorPersonaje  at: unPersonajeJugador.	
	
	(PuebloDeRiverwood esPersonajePrometedor: unPersonajeJugador) ifTrue:  [
		^self responderAJugadorPrometedorSegunCantidadDeInteracciones: cantidadInteracciones.]
	ifFalse: [		
		^self responderAJugadorDesconocidoSegunCantidadDeInteracciones: cantidadInteracciones.].! !


!TreborElGuardiaDeSkyrim class methodsFor: 'as yet unclassified' stamp: 'PG 10/3/2021 22:08:41'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	frasesParaResponderAPersonajesDesconocidos := #('Hola forastero' '�Todo bien?' '�Alg�n problema?' ).
	frasesParaResponderAPersonajesPrometedores := #('Bienvenido aventurero!!' 'Espero que tengas una buena estadia en Riverwood' ).
	cantidadDeInteraccionesPorPersonaje := ((Dictionary new) add: (#Hamilton->1); add: (#Tirion->0); yourself).! !

CarolinaLaCuranderaDeRiverwood initializeAfterFileIn!
PuebloDeRiverwood initializeAfterFileIn!
TreborElGuardiaDeSkyrim initializeAfterFileIn!