import wollok.game.*
import panza.*
import snake.*

object apple {

	var property position = new Position(x = 0.randomUpTo(game.width() - 1), y = 0.randomUpTo(game.height() - 1))

	method image() = "apple.png"

	method moverse() {
		var x = 0.randomUpTo(game.width() - 1)
		var y = 0.randomUpTo(game.height() - 1)
		if (self.hayObjetosAca(x, y)) {
			self.moverse()
		} else {
			position = new Position(x = x, y = y)
		}
	}

	method hayObjetosAca(x, y) {
		const objetosAca = game.getObjectsIn(new Position(x = x, y = y))
		return objetosAca.size() > 0
	}

	method snakeTeChoco() {
		self.moverse()
		snake.panza().add(new Panza(rumbo = snake.rumbo()))
		game.addVisual(snake.panza().last())
	}

}

