class Profesional{
	var universidad
	method universidad() = universidad 
	method universidad(univ) { universidad = univ }
}

// esta clase está completa, no necesita nada más
class ProfesionalAsociado inherits Profesional{
	
	method provinciasDondePuedeTrabajar() = #{"Entre Ríos", "Corrientes", "Santa Fe"} 
	method honorariosPorHora() = 3000 
}


// a esta clase le faltan métodos
class ProfesionalVinculado inherits Profesional{
	method provinciasDondePuedeTrabajar() = universidad.provincia()
	method honorariosPorHora() = universidad.honorariosRecomendados()
}


// a esta clase le faltan atributos y métodos
class ProfesionalLibre inherits Profesional {
	var provincias
	var honorarios
	method provinciasDondePuedeTrabajar(provinciasIngresadas){provincias=provinciasIngresadas}
	method honorariosPorHora(honorariosIngresados){honorarios=honorariosIngresados}
	method provinciasDondePuedeTrabajar() = provincias
	method honorariosPorHora() = honorarios
}