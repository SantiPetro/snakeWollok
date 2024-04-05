import wollok.game.*
import rumbo.*
import juegos.*
import panza.*

object snake {
	var property imagen = "derecha.png"
	var property rumbo = derecha
	var property position = game.center()
	const property panza = []
	method image() = imagen
	
	method moverse(){
		rumbo.moverse()
		if(self.salioDeLaPantalla()){
			juego.gameOver()
		}
	}
	
	method salioDeLaPantalla() {
		const x = self.position().x()
        const y = self.position().y()
		return x < 0 || x > game.width() || y < 0 || y > game.height()
	}
	
	method snakeTeChoco(){}
}
