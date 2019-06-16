class Universidad{
	const provincia
	const honorarios
	var cantidadDonacion=0
	method provincia() = provincia
	method honorariosRecomendados() = honorarios
	method agregarDonacion(cantidad){cantidadDonacion += cantidad}
	method cantidadAcumulada() = cantidadDonacion
}