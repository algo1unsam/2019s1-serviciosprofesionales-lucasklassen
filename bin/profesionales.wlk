import empresas.*

class Profesional{
	var universidad
	var cantidadDinero=0
	method universidad() = universidad 
	method universidad(univ) { universidad = univ }
	method provinciasDondePuedeTrabajar() = null
	method podesTrabajarEn(provincia) = self.provinciasDondePuedeTrabajar().contains(provincia)
	method honorariosPorHora() = null
	method cobrasMasBaratoQue(unProfesional) = self.honorariosPorHora() < unProfesional.honorariosPorHora()
}

// esta clase está completa, no necesita nada más
class ProfesionalAsociado inherits Profesional{
	
	override method provinciasDondePuedeTrabajar() = #{"Entre Ríos", "Corrientes", "Santa Fe"} 
	override method honorariosPorHora() = 3000
	method cobrar(cantidad) = asociacionDeProfesionalesDelLitoral.agregarDonacion(cantidad)
	method cobrarHonorario(){cantidadDinero+=self.honorariosPorHora()}
	method cantidadAcumulada() = cantidadDinero
	 
}


// a esta clase le faltan métodos
class ProfesionalVinculado inherits Profesional{
	override method provinciasDondePuedeTrabajar() = universidad.provincia()
	override method honorariosPorHora() = universidad.honorariosRecomendados()
	method cobrar(cantidad){universidad.agregarDonacion(cantidad/2)}
	method cobrarHonorario(){cantidadDinero+=self.honorariosPorHora()}
	method cantidadAcumulada() = cantidadDinero
	
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre inherits Profesional {
	var provincias
	var honorarios
	method provinciasDondePuedeTrabajar(provinciasIngresadas){provincias=provinciasIngresadas}
	method honorariosPorHora(honorariosIngresados){honorarios=honorariosIngresados}
	override method provinciasDondePuedeTrabajar() = provincias
	override method honorariosPorHora() = honorarios
	method pasarDinero(persona,cantidad){
		persona.cobrar(cantidad)
		cantidadDinero-=cantidad	
	}
	method cobrar(cantidad){cantidadDinero+=cantidad}
	method cantidadAcumulada() = cantidadDinero
	method cobrarHonorario(){self.cobrar(self.honorariosPorHora())}
}