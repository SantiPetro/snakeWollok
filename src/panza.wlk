import snake.*
import wollok.game.*
import juegos.*

class Panza {
	var property rumbo
	var property imagen = rumbo.imagenPanza(rumbo)
	var property position = rumbo.posicion()
	method image() = imagen
	method sosApple() = false
	method snakeTeChoco(){juego.gameOver()}
	method sosLaUltimaPanza() = snake.panza().last() == self
}
