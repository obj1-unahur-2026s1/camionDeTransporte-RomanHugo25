object knightRider {
	method peso() = 500
	method peligrosidad() = 10
}

object bumblebee {
	var property estaTransformadoEnAuto = true
	
	method peso() = 800
	method peligrosidad() = if (estaTransformadoEnAuto) 15 else 30
}
object paqueteDeLadrillos {
	var property cantidadDeLadrillos = 0
	
	method peso() = cantidadDeLadrillos * 2
	method peligrosidad() = 2
}
object arenaAGranel {
	var peso = 0
	
    method peso()   {   return peso   }
    method peso(nuevoPeso) {    peso = nuevoPeso    }
	method peligrosidad() = 1
}
object bateriaAntiaerea {
	var property tieneMisiles = true
	
	method peso() = if (tieneMisiles) 300 else 200
	method peligrosidad() = if (tieneMisiles) 100 else 0
}
object contenedorPortuario {
	const cosas = []
	
	method agregarCosa(unaCosa) {   cosas.add(unaCosa)  }	
	method peso() = 100 + cosas.sum({ c => c.peso() })
	method peligrosidad() {
    	return if (cosas.isEmpty()) 0 
        else cosas.max({ c => c.peligrosidad() }).peligrosidad()
	}
}
object residuosRadioactivos {
	var peso = 0

    method peso()   {   return peso   }
    method peso(nuevoPeso) {    peso = nuevoPeso    }
	method peligrosidad() = 200
}
object embalajeDeSeguridad {
	var property cosaEnvuelta = knightRider
	
	method peso() = if (cosaEnvuelta != null) cosaEnvuelta.peso() else 0
	method peligrosidad() = if (cosaEnvuelta != null) cosaEnvuelta.peligrosidad() / 2 else 0
}