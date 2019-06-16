class Empresa{
	const honorarioDeReferencia
	const profesionales
	var clientes=[]
	
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
	method puedeSatisfacerA(solicitante){
		return profesionales.any{profesional => solicitante.puedeSerAtendidoPor(profesional)}
	}
	method darServicio(solicitante){
		if(!self.puedeSatisfacerA(solicitante)) self.error("Solicitante no puede ser atendido")
		self.seleccionarProfesional(solicitante).cobrarHonorario()
		clientes.add(solicitante)
	}
	method seleccionarProfesional(solicitante){
		return profesionales.filter{profesional => solicitante.puedeSerAtendidoPor(profesional)}.first()
	}
	method cantidadClientes()=clientes.size()
	method tieneClienteA(solicitante)=clientes.contains(solicitante)
	method esPocoAtractivo(profesional) = 
}

object asociacionDeProfesionalesDelLitoral{
	var cantidadAcumulada=0
	method agregarDonacion(cantidad){cantidadAcumulada+=cantidad}
	method cantidadAcumulada() = cantidadAcumulada
}