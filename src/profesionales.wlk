import empresas.*

class Profesional{
	var universidad
	var cantidadDinero=0
	method universidad() = universidad 
	method universidad(univ) { universidad = univ }
}

// esta clase está completa, no necesita nada más
class ProfesionalAsociado inherits Profesional{
	
	method provinciasDondePuedeTrabajar() = #{"Entre Ríos", "Corrientes", "Santa Fe"} 
	method honorariosPorHora() = 3000
	method cobrar(cantidad) = asociacionDeProfesionalesDelLitoral.agregarDonacion(cantidad)
	method cobrarHonorario(){cantidadDinero+=self.honorariosPorHora()}
	method cantidadAcumulada() = cantidadDinero
	 
}


// a esta clase le faltan métodos
class ProfesionalVinculado inherits Profesional{
	method provinciasDondePuedeTrabajar() = universidad.provincia()
	method honorariosPorHora() = universidad.honorariosRecomendados()
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
	method provinciasDondePuedeTrabajar() = provincias
	method honorariosPorHora() = honorarios
	method pasarDinero(persona,cantidad){
		persona.cobrar(cantidad)
		cantidadDinero-=cantidad	
	}
	method cobrar(cantidad){cantidadDinero+=cantidad}
	method cantidadAcumulada() = cantidadDinero
	method cobrarHonorario(){self.cobrar(self.honorariosPorHora())}
}