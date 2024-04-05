import wollok.game.*
import apple.*
import snake.*
import rumbo.*
import panza.*
import imagenes.*

object juego {

	method inicializar() {
		game.width(18)
		game.height(18)
		game.boardGround('Tablero.jpg')
		game.addVisual(startImage)
		keyboard.space().onPressDo{ game.removeVisual(startImage)
			self.iniciarJuego()
		}
	}

	method cambiarDireccion(rumbo) {
		snake.rumbo(rumbo)
	}

	method iniciarJuego() {
		snake.position(game.center())
		game.addVisual(snake)
		game.addVisual(apple)
		2.times{ vez =>
			snake.panza().add(new Panza(rumbo = snake.rumbo()))
			game.addVisual(snake.panza().last())
		}
		game.onTick(100, "movement", { snake.moverse()})
		keyboard.up().onPressDo{ if (!snake.rumbo().es(abajo)) {
				self.cambiarDireccion(arriba)
			}
		}
		keyboard.down().onPressDo{ if (!snake.rumbo().es(arriba)) {
				self.cambiarDireccion(abajo)
			}
		}
		keyboard.right().onPressDo{ if (!snake.rumbo().es(izquierda)) {
				self.cambiarDireccion(derecha)
			}
		}
		keyboard.left().onPressDo{ if (!snake.rumbo().es(derecha)) {
				self.cambiarDireccion(izquierda)
			}
		}
		game.onCollideDo(snake, { elemento => elemento.snakeTeChoco()})
	}

	method gameOver() {
		game.addVisual(gameOverImage)
		game.removeVisual(snake)
		game.removeVisual(apple)
		snake.panza().forEach{ panza => game.removeVisual(panza)}
		game.removeTickEvent("movement")
	}

}

