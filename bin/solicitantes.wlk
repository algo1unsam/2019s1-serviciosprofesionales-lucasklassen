class Persona{
	const provincia
	
	method provinciaDondeVive()=provincia
	method puedeSerAtendidoPor(profesional) = profesional.provinciasDondePuedeTrabajar().contains(provincia)
	
	
}

class Institucion{
	const universidades=[]
	
	method universidadesReconocidas()=universidades
	method puedeSerAtendidoPor(profesional){
		return universidades.contains(profesional.universidad())
	}
}
