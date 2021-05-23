
class Farolito {
	const property peso = 0.5
	const property carga = 0
	const property esLuminoso = true
}

class Canasto {
	const property volumen
	const property esLuminoso = false
	method peso() = volumen / 10
	method carga() = volumen * 2
	
}

class Morral {
	const property largo
	const property tieneOjoDeGato
	const property peso = 1.2
	method carga() = largo / 3
	method esLuminoso() = tieneOjoDeGato
}

/*
 * En el caso de incorporar tipos de accesorios nuevos, no es necesario modificar nada en los
 * ya existentes, pero los nuevos deberan entender los mensajes peso(), carga() y esLuminoso()
 */