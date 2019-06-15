class Empresa{
	const honorarioDeReferencia
	const profesionales
	
	method cantidadProfesionalesSegunUniversidad(unaUniversidad) {
		return profesionales.filter({profesional=>profesional.universidad()==unaUniversidad}).
		size()
	}
	method profesionalesCaros(){
		return profesionales.filter{profesional => profesional.honorariosPorHora()>honorarioDeReferencia}
	}
	method universidadesFormadoras(){
		return profesionales.map{profesional => profesional.universidad()}.asSet()
	}
	method profesionalMasBarato(){
		return profesionales.min{profesional => profesional.honorariosPorHora()} 
	}
	method estaAcotada(){
		return profesionales.any{profesional => profesional.provinciasDondePuedeTrabajar().size()>3}
	}
}