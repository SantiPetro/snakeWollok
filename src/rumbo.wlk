import snake.*
import wollok.game.*
import apple.*

class Rumbo {

	method moverse() {
		var posicionAnterior = snake.position()
		var rumboAnterior = snake.rumbo()
		snake.panza().forEach{ panza =>
			const posicionAux = panza.position()
			const rumboAux = panza.rumbo()
			panza.position(posicionAnterior)
			panza.rumbo(rumboAnterior)
			posicionAnterior = posicionAux
			rumboAnterior = rumboAux
			if (panza.sosLaUltimaPanza()) panza.imagen(panza.rumbo().imagenCola()) 
			else panza.imagen(panza.rumbo().imagenPanza(rumboAnterior))
		}
	}

	method es(unRumbo) {
		return self == unRumbo
	}

}

object derecha inherits Rumbo {

	override method moverse() {
		super()
		snake.position(snake.position().right(1))
		snake.imagen("derecha.png")
	}

	method posicion() {
		if (snake.panza() == []) {
			return snake.position().left(1)
		}
		return snake.panza().last().position().left(1)
	}

	method imagenPanza(rumboAnterior) {
		if (rumboAnterior.sosArriba()) {
			return 'arribaIzquierda.png'
		}
		if (rumboAnterior.sosAbajo()) {
			return 'abajoIzquierda.png'
		}
		return 'panzaHor.png'
	}

	method imagenCola() = 'colaDerecha.png'

	method sosArriba() = false

	method sosDerecha() = true

	method sosAbajo() = false

	method sosIzquierda() = false

}

object izquierda inherits Rumbo {

	override method moverse() {
		super()
		snake.position(snake.position().left(1))
		snake.imagen("izquierda.png")
	}

	method posicion() {
		if (snake.panza() == []) {
			return snake.position().right(1)
		}
		return snake.panza().last().position().right(1)
	}

	method imagenPanza(rumboAnterior) {
		if (rumboAnterior.sosArriba()) {
			return 'arribaDerecha.png'
		}
		if (rumboAnterior.sosAbajo()) {
			return 'abajoDerecha.png'
		}
		return 'panzaHor.png'
	}

	method imagenCola() = 'colaIzquierda.png'

	method sosArriba() = false

	method sosDerecha() = false

	method sosAbajo() = false

	method sosIzquierda() = true

}

object arriba inherits Rumbo {

	override method moverse() {
		super()
		snake.position(snake.position().up(1))
		snake.imagen("arriba.png")
	}

	method posicion() {
		if (snake.panza() == []) {
			return snake.position().down(1)
		}
		return snake.panza().last().position().down(1)
	}

	method imagenPanza(rumboAnterior) {
		if (rumboAnterior.sosDerecha()) {
			return 'abajoDerecha.png'
		}
		if (rumboAnterior.sosIzquierda()) {
			return 'abajoIzquierda.png'
		}
		return 'panzaVer.png'
	}

	method imagenCola() = 'colaArriba.png'

	method sosArriba() = true

	method sosDerecha() = false

	method sosAbajo() = false

	method sosIzquierda() = false

}

object abajo inherits Rumbo {

	override method moverse() {
		super()
		snake.position(snake.position().down(1))
		snake.imagen("abajo.png")
	}

	method posicion() {
		if (snake.panza() == []) {
			return snake.position().up(1)
		}
		return snake.panza().last().position().up(1)
	}

	method imagenPanza(rumboAnterior) {
		if (rumboAnterior.sosDerecha()) {
			return 'arribaDerecha.png'
		}
		if (rumboAnterior.sosIzquierda()) {
			return 'arribaIzquierda.png'
		}
		return 'panzaVer.png'
	}

	method imagenCola() = 'colaAbajo.png'

	method sosArriba() = false

	method sosDerecha() = false

	method sosAbajo() = true

	method sosIzquierda() = false

}

