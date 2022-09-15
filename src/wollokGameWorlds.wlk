//Punto 1

class Jugador{
	var antiguedad
	var cansancio = 50
	
	method puedeJugar() = !self.totalmenteCansado() && self.esTitular()
	
	method totalmenteCansado() = cansancio > 100
	
	method esTitular() = antiguedad > 3
	
	 //para test 
	method aumentarAntiguedad(cantidad){
		antiguedad += cantidad
	}
	
	method tomarBebidaEnergizante(){
		cansancio = 0.max(cansancio -10)
	}
	
	method jugar(){
		if(!self.puedeJugar()){
			throw new DomainException(message="El jugador no puede jugar")
		}
		cansancio += 20 
		//lo mismo que hacer cansancio = cansancio +  20
	}
	
	method habilidad() = antiguedad * 2 - cansancio
}
// WKO - WELL KNOWN OBJECT
object faker{
	var tilteado = false
	var habilidad = 0
	
	method tiltearse() {
		tilteado = true
	}
	
	method tilteado() = tilteado
	
	method puedeJugar() = !tilteado
	
	method tomarseUnTecito() {
		tilteado = false
	}
	
	method jugar(){
		if(!self.puedeJugar()){
			throw new DomainException(message="Faker no puede jugar")
		}
		habilidad +=30			
		
	}
	
	method habilidad() = if (tilteado) 0 else habilidad
	// Es lo mismo que hacer:
	/*
	 * if(tilteado){
	 * 	return 0
	 * }else{
	 * 	return habilidad
	 * }
	 */
	
}

const josedeodo = new Jugador(antiguedad = 5)

//Punto 2
class Partida{
	var participanteRojo
	var participanteAzul
	
	method comenzar(){
		participanteRojo.jugar()
		participanteAzul.jugar()
	}
	
	method ganador(){
		if(participanteRojo.habilidad() > participanteAzul.habilidad()){
			return participanteRojo
		}else{
			return participanteAzul
		}
	}
}

