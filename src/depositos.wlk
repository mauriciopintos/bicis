import bicis.*
import accesorios.*

class Deposito {
	const property bicis = []
	
	method bicisRapidas() = bicis.filter( { b => b.velocidadCrucero() > 25 } )
	method marcasDeBicis() = bicis.map( { b => b.marca() } ).asSet()
	method esNocturno() = bicis.all( { b => b.tieneLuz() } )
	method tieneBicicletaParaLlevar(unaCarga) = bicis.any( { b => b.carga() > unaCarga } )
	method marcaMasRapida() = bicis.max( { b => b.velocidadCrucero() } ).marca()
	method cargaBicisLargas() = bicis.filter( { b => b.largo() > 170 } ).sum( { b => b.carga() } )
	method bicisSinAccesorios() = bicis.count( { b => b.accesorios().isEmpty() } )
	method bicisCompanierasDe(unaBici) = bicis.filter( { b => self.sonCompanieras(unaBici,b) } )
	method sonCompanieras(unaBici,otraBici) {
		const sonDistintas = unaBici != otraBici
		const deIgualMarca = unaBici.marca() == otraBici.marca()
		const deLargoCorrecto = (unaBici.largo() - otraBici.largo()).abs() < 10
		return sonDistintas and deIgualMarca and deLargoCorrecto
		}
	method hayCompanieras() = bicis.any( { b => not self.bicisCompanierasDe(b).isEmpty() } )
	
	method seHizoLaLuz() = if (self.hayLuz()) self.lucesAlFinal() else self.hayLuz()
	/* Metodos auxiliares de seHizoLaLuz() */
		// Verifica si las bicicletas tienen luces a partir de la primera con luz
	method lucesAlFinal() = (self.primerLuz()..bicis.size()-1).all( { idx => (bicis.get(idx).tieneLuz() ) } )
		// determina el indice de la primer bici con luz
	method primerLuz() = (0..bicis.size()-1).find( { idx => bicis.get(idx).tieneLuz() } )
		// verifica si existe almenos una bicicleta con luz
	method hayLuz() = bicis.any({ b => b.tieneLuz() })
}