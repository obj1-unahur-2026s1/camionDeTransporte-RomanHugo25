import cosas.*
object camion {
    const carga = []
    method cargar(unaCosa){     carga.add(unaCosa)  }
    method descargar(unaCosa){  carga.remove(unaCosa) }

    method peso() = 1000 + carga.sum({c=>c.peso()})  
    method esPesoPar() = carga.all({c=>c.peso().even()})
    method algoPesa(unPeso) = carga.any({c=>c.peso()==unPeso})
    method algoTienePeligrosidad(nivel) = carga.find({c=>c.peligrosidad()==nivel})
    method cosasPeligosasQueSuperan(nivel) = carga.filter({c=>c.peligrosidad()>nivel}) 
    method cosasMasPeligosasQue(unaCosa) = carga.filter({c=>c.peligrosidad()>unaCosa.peligrosidad()}) 
    method estaExedidoDePeso() = self.peso() <= 2500  
    method puedeCircularEnRutaCon(limitePeligrosidad) {
        return  (!self.estaExedidoDePeso()) 
            and (self.cosasPeligosasQueSuperan(limitePeligrosidad).isEmpty()) 
    }
    method tieneAlgoPesadoEntre(min,max) {
        return  carga.any({c=>c.peso()>=min})
            and carga.any({c=>c.peso()<=max})
    }
    method cosaMasPesada() = carga.max({c=>c.peso()}) 
}